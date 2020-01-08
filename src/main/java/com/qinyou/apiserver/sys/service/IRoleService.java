package com.qinyou.apiserver.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qinyou.apiserver.sys.dto.RoleDTO;
import com.qinyou.apiserver.sys.entity.Role;

import java.util.Set;

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

    // 根据角色id查询 用户名列表
    Set<String> findUsersByRole(String roleId);
}
