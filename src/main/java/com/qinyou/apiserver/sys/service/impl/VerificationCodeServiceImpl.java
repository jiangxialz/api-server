package com.qinyou.apiserver.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qinyou.apiserver.sys.entity.VerificationCode;
import com.qinyou.apiserver.sys.mapper.VerificationCodeMapper;
import com.qinyou.apiserver.sys.service.IVerificationCodeService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 存放验证码 服务实现类
 * </p>
 *
 * @author chuang
 * @since 2019-11-21
 */
@Service
public class VerificationCodeServiceImpl extends ServiceImpl<VerificationCodeMapper, VerificationCode> implements IVerificationCodeService {

}
