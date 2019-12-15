package com.qinyou.apiserver;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qinyou.apiserver.sys.entity.*;
import com.qinyou.apiserver.sys.service.*;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDateTime;
import java.util.List;

@SpringBootTest
@Slf4j
class ApiServerApplicationTests {

    @Autowired
    IUserService userService;
    @Autowired
    IRoleService roleService;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    IUserRoleService userRoleService;
    @Autowired
    IRoleResourceService roleResourceService;
    @Autowired
    IResourceService resourceService;

    /**
     * 创建 admin 账号
     */
    @Test
    @Order(1)
    public void createAdmin(){
        if(userService.getById("admin")==null){
            User user = new User().setId("admin").setPassword(passwordEncoder.encode("123456"))
                    .setPhone("15238002477").setEmail("916432779@qq.com")
                    .setIntro("handsome boy").setState("0");
            user.setCreateTime(LocalDateTime.now()).setCreater("chuang");
            userService.save(user);
        }
    }

    /**
     * 创建 admin 角色
     */
    @Test
    @Order(2)
    public void createRole(){
        if(roleService.getById("admin") == null){
            Role role = new Role().setId("admin").setName("管理员").setState("ON");
            role.setCreateTime(LocalDateTime.now()).setCreater("chuang");
            roleService.save(role);
        }
    }


    /**
     * admin 用户关联 admin 角色
     */
    @Test
    @Order(3)
    public void createUserRole(){
        if(userRoleService.getOne(new QueryWrapper<>(new UserRole().setUserId("admin").setRoleId("admin")))== null ){
            UserRole userRole = new UserRole().setUserId("admin").setRoleId("admin")
                    .setCreateTime(LocalDateTime.now()).setCreater("chuang");
            userRoleService.save(userRole);
        }
    }


    /**
     * admin 角色 关联所有 资源
     */
    @Test
    @Order(4)
    public void createRoleResource(){
        List<Resource> resources = resourceService.list();
        for(Resource resource : resources){
            if(roleResourceService.getOne(new QueryWrapper<>(new RoleResource().setRoleId("admin").setResourceId(resource.getId()))) == null){
                RoleResource roleResource = new RoleResource()
                        .setRoleId("admin")
                        .setResourceId(resource.getId())
                        .setCreater("chuang").setCreateTime(LocalDateTime.now());
                roleResourceService.save(roleResource);
            }
        }
    }
}
