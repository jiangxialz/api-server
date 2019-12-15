package com.qinyou.apiserver.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qinyou.apiserver.core.aop.SysLog;
import com.qinyou.apiserver.core.base.PageDTO;
import com.qinyou.apiserver.core.base.PageFindDTO;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.result.ResponseResult;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.UserDTO;
import com.qinyou.apiserver.sys.entity.Role;
import com.qinyou.apiserver.sys.entity.User;
import com.qinyou.apiserver.sys.service.IUserRoleService;
import com.qinyou.apiserver.sys.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 系统用户表 前端控制器
 * </p>
 *
 * @author chuang
 * @since 2019-10-19
 */
@SuppressWarnings({"Duplicates","SpringJavaInjectionPointsAutowiringInspection"})
@Api(tags = "用户管理")
@RestController
@RequestMapping("/sys/user")
public class UserController {

    @Autowired
    IUserService userService;
    @Autowired
    IUserRoleService userRoleService;

    @ApiOperation("查询用户列表")
    @PreAuthorize("hasAuthority('sysUser')")
    @PostMapping("/list")
    public ResponseResult<PageDTO<User>> list(@RequestBody PageFindDTO pageFindDto) {
        QueryWrapper<User> queryWrapper = WebUtils.buildSearchQueryWrapper(pageFindDto);
        queryWrapper.orderByAsc("create_time");
        IPage<User> page = WebUtils.buildSearchPage(pageFindDto);
        PageDTO<User> pageDataDTO = WebUtils.buildResultPage(userService.page(page, queryWrapper));
        return WebUtils.ok(pageDataDTO);
    }


    @ApiOperation("添加用户")
    @SysLog()
    @PreAuthorize("hasAuthority('sysUser:add')")
    @PostMapping("/add")
    public ResponseResult add(@RequestBody @Validated UserDTO userDTO) {
        userService.add(userDTO);
        return WebUtils.ok(ResponseEnum.ADD_SUCCESS);
    }

    @ApiOperation(value = "修改用户")
    @SysLog()
    @PreAuthorize("hasAuthority('sysUser:update')")
    @PostMapping("/update/{id}")
    public ResponseResult update(@PathVariable("id") String id, @RequestBody @Validated UserDTO userDTO) {
        userService.update(id, userDTO);
        return WebUtils.ok(ResponseEnum.UPDATE_SUCCESS);
    }


    @ApiOperation(value = "删除用户")
    @SysLog()
    @PreAuthorize("hasAuthority('sysUser:remove')")
    @GetMapping("/remove/{id}")
    public ResponseResult remove(@PathVariable("id") String id) {
        userService.remove(id);
        return WebUtils.ok(ResponseEnum.DELETE_SUCCESS);
    }

    @ApiOperation(value = "切换状态，0变1 或 1变0")
    @SysLog()
    @PreAuthorize("hasAuthority('sysUser:toggle')")
    @GetMapping("/toggle-state/{id}")
    public ResponseResult toggleState(@PathVariable String id) {
        userService.toggleState(id);
        return WebUtils.ok(ResponseEnum.TOGGLE_SUCCESS);
    }


    @Value("${app.user-default-password}")
    String userDefaultPwd;

    @ApiOperation(value = "重置用户密码")
    @SysLog()
    @PreAuthorize("hasAuthority('sysUser:resetPwd')")
    @GetMapping("/reset-pwd/{id}")
    public ResponseResult resetPassword(@PathVariable String id){
        userService.resetPwd(id);
        return WebUtils.ok(ResponseEnum.RESET_PWD_SUCCESS,ResponseEnum.RESET_PWD_SUCCESS.msg+" 新密码:"+userDefaultPwd);
    }


    /*****************************用户配置角色相关*********************************/
    @ApiOperation(value = "获得用户详情")
    @PreAuthorize("hasAuthority('sysUser:configRoles')")
    @GetMapping("/detail/{id}")
    public ResponseResult<User> detail(@PathVariable String id){
        return WebUtils.ok(userService.getById(id));
    }

    @ApiOperation(value = "用户没有的角色列表")
    @PreAuthorize("hasAuthority('sysUser:configRoles')")
    @PostMapping("/list-no-roles/{userId}")
    public ResponseResult<PageDTO<Role>> listNoRoles(@PathVariable String userId, @RequestBody PageFindDTO pageFindDto){
        return WebUtils.ok(userRoleService.listRoles(false,userId,pageFindDto));
    }

    @ApiOperation(value = "用户拥有的角色列表")
    @PreAuthorize("hasAuthority('sysUser:configRoles')")
    @PostMapping("/list-have-roles/{userId}")
    public ResponseResult<PageDTO<Role>> listHaveRoles(@PathVariable String userId, @RequestBody PageFindDTO pageFindDto){
        return WebUtils.ok(userRoleService.listRoles(true,userId,pageFindDto));
    }

    @ApiOperation(value = "删除用户相关角色")
    @SysLog()
    @PreAuthorize("hasAuthority('sysUser:configRoles')")
    @PostMapping("/del-user-roles/{userId}")
    public ResponseResult deleteUserRoles(@PathVariable String userId, @RequestBody List<String> roleIds){
        userRoleService.delUserRoles(userId,roleIds);
        return WebUtils.ok(ResponseEnum.DELETE_SUCCESS);
    }


    @ApiOperation(value = "增加用户相关角色")
    @SysLog()
    @PreAuthorize("hasAuthority('sysUser:configRoles')")
    @PostMapping("/add-user-roles/{userId}")
    public ResponseResult addUserRoles(@PathVariable String userId, @RequestBody List<String> roleIds){
        userRoleService.addUserRoles(userId,roleIds);
        return WebUtils.ok(ResponseEnum.ADD_SUCCESS);
    }
}

