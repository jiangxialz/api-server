package com.qinyou.apiserver.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qinyou.apiserver.core.aop.SysLog;
import com.qinyou.apiserver.core.base.PageDTO;
import com.qinyou.apiserver.core.base.PageFindDTO;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.result.ResponseResult;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.MsgTypeDTO;
import com.qinyou.apiserver.sys.entity.MsgType;
import com.qinyou.apiserver.sys.service.IMsgTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 系统通知消息类型 前端控制器
 * </p>
 *
 * @author chuang
 * @since 2019-12-31
 */
@SuppressWarnings({"Duplicates"})
@Api(tags = "消息类型")
@RestController
@RequestMapping("/sys/msg-type")
public class MsgTypeController {

    @Autowired
    IMsgTypeService msgTypeService;

    @ApiOperation("查询消息类型列表")
    @PreAuthorize("hasAuthority('sysMsgType')")
    @PostMapping("/list")
    public ResponseResult<PageDTO<MsgType>> list(@RequestBody PageFindDTO pageFindDto) {
        QueryWrapper<MsgType> queryWrapper = WebUtils.buildSearchQueryWrapper(pageFindDto);
        IPage<MsgType> page = WebUtils.buildSearchPage(pageFindDto);
        PageDTO<MsgType> pageDataDTO = WebUtils.buildResultPage(msgTypeService.page(page, queryWrapper));
        return WebUtils.ok(pageDataDTO);
    }

    @ApiOperation("添加消息类型")
    @SysLog()
    @PreAuthorize("hasAuthority('sysMsgType:add')")
    @PostMapping("/add")
    public ResponseResult add(@RequestBody @Validated MsgTypeDTO msgTypeDTO) {
        msgTypeService.add(msgTypeDTO);
        return WebUtils.ok(ResponseEnum.ADD_SUCCESS);
    }

    @ApiOperation(value = "修改消息类型")
    @SysLog()
    @PreAuthorize("hasAuthority('sysMsgType:update')")
    @PostMapping("/update/{id}")
    public ResponseResult update(@PathVariable("id") String id, @RequestBody @Validated  MsgTypeDTO msgTypeDTO) {
        msgTypeService.update(id, msgTypeDTO);
        return WebUtils.ok(ResponseEnum.UPDATE_SUCCESS);
    }

    @ApiOperation(value = "删除消息类型")
    @SysLog()
    @PreAuthorize("hasAuthority('sysMsgType:remove')")
    @GetMapping("/remove/{id}")
    public ResponseResult remove(@PathVariable("id") String id) {
        msgTypeService.remove(id);
        return WebUtils.ok(ResponseEnum.DELETE_SUCCESS);
    }

    @ApiOperation(value = "切换状态，ON变OFF 或 OFF变ON")
    @SysLog()
    @PreAuthorize("hasAuthority('sysMsgType:toggle')")
    @GetMapping("/toggle-state/{id}")
    public ResponseResult toggleState(@PathVariable String id) {
        msgTypeService.toggleState(id);
        return WebUtils.ok(ResponseEnum.TOGGLE_SUCCESS);
    }
}
