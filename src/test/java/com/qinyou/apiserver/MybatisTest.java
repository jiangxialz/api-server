package com.qinyou.apiserver;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qinyou.apiserver.sys.entity.Role;
import com.qinyou.apiserver.sys.mapper.UserRoleMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class MybatisTest {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    UserRoleMapper userRoleMapper;

    @Test
    public void test1(){
      String userId = "admin";
        IPage<Role> page = new Page<Role>().setCurrent(1).setSize(10);
        QueryWrapper<Role> queryWrapper = new QueryWrapper<Role>().like("name","管");
        IPage<Role> roles = userRoleMapper.listHaveRoles(page,userId,queryWrapper);
        log.info("query date size: {}",roles.getRecords().size());
        log.info("total: {}",roles.getTotal());
        log.info("total: {}",page.getTotal());
    }
}
