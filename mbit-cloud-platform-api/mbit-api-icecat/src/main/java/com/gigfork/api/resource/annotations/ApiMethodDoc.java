package com.gigfork.api.resource.annotations;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import com.gigfork.jaxb.rest.ErrorCodeEnum;

/**
 * Used in api resteasy resources for documentation information.
 * value should be a relative path starting from /templates/doc/ folder on classpath
 * 
 * e.g: template is located on classpath:
 * /templates/doc/main/live.ftl   => annotation value should ´have the following as value : main/live.ftl
 */
@Target(METHOD)
@Documented
@Retention(RUNTIME)
public @interface ApiMethodDoc
{
    String classpathTemplateLocation() default "resourceDefault.ftl";

    ErrorCodeEnum[] errorCodes() default {};
    String[] errorCodePatterns() default {};

    String fsXSDLocation() default "";

    String docTitle() default "";

    String docSubtitle() default "";

    String docDescription() default "";

    String docAdditionalText() default "";

    String docIncludePath() default "";

    String docXmlConsumerParameterExample() default "";

    /**
     * add parameter documentation for @QueryParam and @PathParam annotations. the array contains the name of
     * the param and the description after each other.
     */
    String[] docMethodDescriptions() default {};
}
