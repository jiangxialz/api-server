package com.qinyou.apiserver.sys.service.impl;

import com.qinyou.apiserver.sys.entity.Log;
import com.qinyou.apiserver.sys.mapper.LogMapper;
import com.qinyou.apiserver.sys.service.ILogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户操作日志  服务实现类
 * </p>
 *
 * @author chuang
 * @since 2019-12-15
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements ILogService {

}
