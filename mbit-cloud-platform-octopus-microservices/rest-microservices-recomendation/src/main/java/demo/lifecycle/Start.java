package demo.lifecycle;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.context.annotation.Import;

/**
 * @author Dave Syer
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import(SmartLifecycleRegistry.class)
public @interface Start {
	int phase() default 0;
	int order() default 0;
	boolean autoStart() default true;
}
