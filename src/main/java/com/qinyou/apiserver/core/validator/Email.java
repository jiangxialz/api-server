package com.qinyou.apiserver.core.validator;


import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

/**
 * 自定义校验器
 */
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.ANNOTATION_TYPE, ElementType.CONSTRUCTOR, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = {EmailValidator.class})
public @interface Email {
    boolean required() default true;

    String message() default "Email pattern error";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
