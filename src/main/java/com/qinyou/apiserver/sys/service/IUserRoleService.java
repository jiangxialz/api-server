package com.qinyou.apiserver.sys.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qinyou.apiserver.core.base.PageDTO;
import com.qinyou.apiserver.core.base.PageFindDTO;
import com.qinyou.apiserver.sys.entity.Role;
import com.qinyou.apiserver.sys.entity.UserRole;

import java.util.List;

/**
 * <p>
 * 用户角色中间表 服务类
 * </p>
 *
 * @author chuang
 * @since 2019-12-10
 */
public interface IUserRoleService extends IService<UserRole> {
    /**
     * 添加
     * @param userId
     * @param roleIds
     */
    void addUserRoles(String userId, List<String> roleIds);

    /**
     * 删除
     * @param userId
     * @param roleIds
     */
    void delUserRoles(String userId,List<String> roleIds);


    /**
     * 分页查询 用户拥有的角色 或 用户没有的角色
     * @param haveFlag true 拥有的角色，false 没有的角色
     * @param userId
     * @param pageFindDTO
     * @return
     */
    PageDTO<Role> listRoles(boolean haveFlag, String userId, PageFindDTO pageFindDTO);
}
