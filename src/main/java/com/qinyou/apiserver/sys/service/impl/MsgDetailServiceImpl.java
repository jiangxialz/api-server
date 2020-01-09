package com.qinyou.apiserver.sys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qinyou.apiserver.sys.entity.MsgDetail;
import com.qinyou.apiserver.sys.mapper.MsgDetailMapper;
import com.qinyou.apiserver.sys.service.IMsgDetailService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 消息从表（保存接收人） 服务实现类
 * </p>
 *
 * @author chuang
 * @since 2020-01-08
 */
@Service
public class MsgDetailServiceImpl extends ServiceImpl<MsgDetailMapper, MsgDetail> implements IMsgDetailService {

}
