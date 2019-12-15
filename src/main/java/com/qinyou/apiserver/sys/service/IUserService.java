package com.qinyou.apiserver.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qinyou.apiserver.sys.dto.UserDTO;
import com.qinyou.apiserver.sys.entity.User;

/**
 * <p>
 * 系统用户表 服务类
 * </p>
 *
 * @author chuang
 * @since 2019-10-19
 */
public interface IUserService extends IService<User> {
    void add(UserDTO userDTO);
    void update(String id, UserDTO userDTO);
    void remove(String id);
    void toggleState(String id);
    void resetPwd(String id);
}
