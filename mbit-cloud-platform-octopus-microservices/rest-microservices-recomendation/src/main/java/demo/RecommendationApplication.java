package demo;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.hateoas.MediaTypes;
import org.springframework.hateoas.Resources;
import org.springframework.hateoas.client.Traverson;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.async.DeferredResult;

import reactor.core.Environment;
import reactor.rx.Stream;
import reactor.rx.spec.Streams;

import com.netflix.discovery.DiscoveryClient;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

import demo.StoreDetails.Recommendation;

@Configuration
@ComponentScan
@EnableAutoConfiguration
@EnableEurekaClient
@EnableHystrix
@RestController
public class RecommendationApplication {

	@Autowired
	private StoreService stores;

	@RequestMapping("/{customerId}")
	public DeferredResult<List<StoreDetails>> recommend(@PathVariable String customerId)
			throws Exception {
		return toDeferredResult(fetch(customerId));
	}

	public static void main(String[] args) {
		SpringApplication.run(RecommendationApplication.class, args);
	}

	private Stream<StoreDetails> fetch(String customerId) {
		Stream<StoreDetails> details = stores.nearbyStores(customerId).flatMap(
				store -> {
					StoreDetails result = new StoreDetails(store);
					Stream<Recommendation> recommendations = stores
							.recommendationsForStore(store);
					return recommendations.map(recommendation -> {
						if (recommendation != null) {
							result.getRecommendations().add(recommendation);
						}
						return result;
					});
				});
		return details;
	}

	private static <T> DeferredResult<List<T>> toDeferredResult(Stream<T> publisher) {
		DeferredResult<List<T>> deferred = new DeferredResult<List<T>>();
		publisher.buffer().consume((List<T> result) -> deferred.setResult(result));
		return deferred;
	}

}

@Component
class StoreService {

	private final DiscoveryClient client;
	private Environment environment;

	@Autowired
	public StoreService(Environment environment, DiscoveryClient client) {
		this.environment = environment;
		this.client = client;
	}

	@HystrixCommand(fallbackMethod = "emptyStream")
	public Stream<Recommendation> recommendationsForStore(Store store) {
		return Streams.defer(environment, recommendations(store));
	}

	@HystrixCommand(fallbackMethod = "emptyStream")
	public Stream<Store> nearbyStores(String customerId) {
		// TODO: iterate over pages
		return Streams.defer(environment, stores(customerId));
	}

	protected <T> Stream<T> emptyStream(String id) {
		return Streams.defer(environment, Collections.<T>singleton(null));
	}

	protected <T> Stream<T> emptyStream(Store input) {
		return Streams.defer(environment, Collections.<T>singleton(null));
	}

	private Collection<Store> stores(String customerId) {
		String url = client.getNextServerFromEureka("CUSTOMERS", false).getHomePageUrl();
		URI base;
		try {
			base = new URI(url + "customers/" + customerId);
		}
		catch (URISyntaxException e) {
			throw new IllegalStateException("Could not create base URI", e);
		}
		final Collection<Store> stores = new Traverson(base, MediaTypes.HAL_JSON)
				.follow("stores-nearby")
				.toObject(new ParameterizedTypeReference<Resources<Store>>() {
				}).getContent();
		return stores;
	}

	private Collection<Recommendation> recommendations(Store store) {
		throw new UnsupportedOperationException("No recommendations available");
	}

}