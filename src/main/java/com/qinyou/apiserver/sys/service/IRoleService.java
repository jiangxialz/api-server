package com.qinyou.apiserver.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qinyou.apiserver.sys.dto.RoleDTO;
import com.qinyou.apiserver.sys.entity.Role;

/**
 * <p>
 * 系统角色表 服务类
 * </p>
 *
 * @author chuang
 * @since 2019-10-19
 */
public interface IRoleService extends IService<Role> {

    void add(RoleDTO roleDTO);
    void update(String id, RoleDTO roleDTO);
    void remove(String id);
    void toggleState(String id);
}
