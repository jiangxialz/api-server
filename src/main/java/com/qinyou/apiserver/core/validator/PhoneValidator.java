package com.qinyou.apiserver.core.validator;


import cn.hutool.core.lang.Validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator<Phone, String> {

    private boolean required = false;

    @Override
    public void initialize(Phone phone) {
        required = phone.required();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        return Validator.isMobile(value);
    }
}
