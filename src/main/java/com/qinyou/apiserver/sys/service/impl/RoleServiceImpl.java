package com.qinyou.apiserver.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qinyou.apiserver.core.result.RequestException;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.RoleDTO;
import com.qinyou.apiserver.sys.entity.Role;
import com.qinyou.apiserver.sys.entity.RoleResource;
import com.qinyou.apiserver.sys.entity.UserRole;
import com.qinyou.apiserver.sys.mapper.RoleMapper;
import com.qinyou.apiserver.sys.service.IRoleResourceService;
import com.qinyou.apiserver.sys.service.IRoleService;
import com.qinyou.apiserver.sys.service.IUserRoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * <p>
 * 系统角色表 服务实现类
 * </p>
 *
 * @author chuang
 * @since 2019-10-19
 */
@SuppressWarnings({"Duplicates","SpringJavaInjectionPointsAutowiringInspection"})
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Autowired
    IUserRoleService userRoleService;
    @Autowired
    IRoleResourceService roleResourceService;

    @Override
    public void add(RoleDTO roleDTO) {
        Role role = new Role();
        BeanUtils.copyProperties(roleDTO,role);
        role.setCreater(WebUtils.getSecurityUsername());
        role.setCreateTime(LocalDateTime.now());
        this.save(role);
    }

    @Override
    public void update(String id, RoleDTO roleDTO) {
        Role role = this.getById(id);
        if(role==null){
            throw RequestException.fail(ResponseEnum.UPDATE_FAIL);
        }
        BeanUtils.copyProperties(roleDTO,role,"id"); // 角色编码不可改
        role.setUpdater(WebUtils.getSecurityUsername()).setUpdateTime(LocalDateTime.now());
        this.updateById(role);
    }

    @Transactional
    @Override
    public void remove(String id) {
        Role role = this.getById(id);
        if(role==null){
            throw RequestException.fail(ResponseEnum.DELETE_FAIL);
        }
        this.removeById(id);
        userRoleService.remove(new QueryWrapper<UserRole>().eq("role_id",id));
        roleResourceService.remove(new QueryWrapper<RoleResource>().eq("role_id",id));
    }

    @Override
    public void toggleState(String id) {
        Role role = this.getById(id);
        if(role==null){
            throw RequestException.fail(ResponseEnum.TOGGLE_FAIL);
        }
        String state = "ON".equals(role.getState()) ? "OFF":"ON";
        UpdateWrapper<Role> wraper = new UpdateWrapper<>();
        wraper.set("state",state)
                .set("updater", WebUtils.getSecurityUsername())
                .set("update_time",LocalDateTime.now())
                .eq("id",id);
        this.update(wraper);
    }
}
