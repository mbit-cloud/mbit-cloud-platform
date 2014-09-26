/*
 * Copyright 2013-2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package demo.lifecycle;

import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicBoolean;

import org.springframework.aop.support.AopUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.context.SmartLifecycle;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;
import org.springframework.util.ReflectionUtils.MethodCallback;

/**
 * @author Dave Syer
 *
 */
@Component
public class SmartLifecycleRegistry implements BeanFactoryAware, BeanPostProcessor {

	private ConfigurableListableBeanFactory beanFactory;

	@Override
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
		this.beanFactory = (ConfigurableListableBeanFactory) beanFactory;
	}

	@Override
	public Object postProcessBeforeInitialization(Object bean, String beanName)
			throws BeansException {
		return bean;
	}

	@Override
	public Object postProcessAfterInitialization(Object bean, String beanName)
			throws BeansException {
		Class<?> targetClass = AopUtils.getTargetClass(bean);
		ReflectionUtils.doWithMethods(targetClass, new MethodCallback() {
			@Override
			public void doWith(Method method) throws IllegalArgumentException,
					IllegalAccessException {
				Start start = AnnotationUtils.getAnnotation(method, Start.class);
				if (start != null) {
					processStart(beanName, start, method, bean);
				}
			}

		});
		return bean;
	}

	protected void processStart(String beanName, Start start, Method method, Object bean) {
		beanFactory.registerSingleton("lifecycle." + beanName, new SmartLifecycleWrapper(
				start.phase(), start.order(), start.autoStart(), bean, method));
	}

	private static class SmartLifecycleWrapper implements SmartLifecycle, Ordered {

		private int phase;
		private int order;
		private boolean autoStart;
		private Object bean;
		private Method method;
		private AtomicBoolean running = new AtomicBoolean(false);

		public SmartLifecycleWrapper(int phase, int order, boolean autoStart,
				Object bean, Method method) {
			this.phase = phase;
			this.order = order;
			this.autoStart = autoStart;
			this.bean = bean;
			this.method = method;
		}
		
		@Override
		public int getOrder() {
			return order;
		}

		@Override
		public void start() {
			if (running.compareAndSet(false, true)) {
				ReflectionUtils.invokeMethod(method, bean);
			}
		}

		@Override
		public void stop() {
			if (running.compareAndSet(true, false)) {
			}
		}

		@Override
		public boolean isRunning() {
			return running.get();
		}

		@Override
		public int getPhase() {
			return phase;
		}

		@Override
		public boolean isAutoStartup() {
			return autoStart;
		}

		@Override
		public void stop(Runnable callback) {
			if (running.compareAndSet(true, false)) {
				callback.run();
			}
		}

	}

}
