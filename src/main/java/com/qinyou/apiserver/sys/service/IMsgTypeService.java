package com.qinyou.apiserver.sys.service;

import com.qinyou.apiserver.sys.dto.MsgTypeDTO;
import com.qinyou.apiserver.sys.entity.MsgType;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 系统通知消息类型 服务类
 * </p>
 *
 * @author chuang
 * @since 2019-12-31
 */
public interface IMsgTypeService extends IService<MsgType> {
    // 增改删 切换状态
    void add(MsgTypeDTO msgTypeDTO);
    void update(String id, MsgTypeDTO msgTypeDTO);
    void remove(String id);
    void toggleState(String id);
}
