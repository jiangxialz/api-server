package com.qinyou.apiserver.core.validator;


import cn.hutool.core.lang.Validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class EmailValidator implements ConstraintValidator<Email, String> {

    private boolean required = false;

    @Override
    public void initialize(Email email) {
        required = email.required();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        return Validator.isEmail(value);
    }
}
