package com.qinyou.apiserver;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.qinyou.apiserver.core.utils.DateUtils;
import com.qinyou.apiserver.sys.entity.*;
import com.qinyou.apiserver.sys.service.*;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Autowired
    IMsgService msgService;

    @Test
    public void createMsg() throws IOException, TemplateException {
        // ${username}  于  ${datetime} 下单，消费金额 ￥${money}.   单号 ${orderNo}
        String typeCode = "ORDER_NEW";
        for(int i=0; i<100; i++ ){
            Map<String,Object> params = new HashMap<>();
            params.put("username","性感哥"+i);
            params.put("datetime", DateUtils.formatDateTime(LocalDateTime.now().plusDays(i)));
            params.put("money",i*100);
            params.put("orderNo","NO."+i+Math.random()*1000000);
            msgService.triggerMsg(typeCode,params);
        }
    }
}
