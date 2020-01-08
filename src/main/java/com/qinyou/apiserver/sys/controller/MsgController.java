package com.qinyou.apiserver.sys.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qinyou.apiserver.core.base.PageDTO;
import com.qinyou.apiserver.core.base.PageFindDTO;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.result.ResponseResult;
import com.qinyou.apiserver.core.utils.DateUtils;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.MsgDTO;
import com.qinyou.apiserver.sys.entity.Msg;
import com.qinyou.apiserver.sys.entity.MsgDetail;
import com.qinyou.apiserver.sys.mapper.MsgMapper;
import com.qinyou.apiserver.sys.service.IMsgDetailService;
import com.qinyou.apiserver.sys.service.IMsgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * <p>
 * 消息主表，保存消息内容 前端控制器
 * </p>
 *
 * @author chuang
 * @since 2020-01-08
 */
@SuppressWarnings({"Duplicates","SpringJavaInjectionPointsAutowiringInspection"})
@Api(tags = "用户消息")
@RestController
@RequestMapping("/sys/msg")
public class MsgController {

    @Autowired
    IMsgService msgService;
    @Autowired
    IMsgDetailService msgDetailService;
    @Autowired
    MsgMapper msgMapper;

    @ApiOperation(value = "未读消息条数")
    @GetMapping("/unread-count")
    public ResponseResult<Integer> unreadCount(){
        String username = WebUtils.getSecurityUsername();
        QueryWrapper<MsgDetail> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("receiver",username);
        return WebUtils.ok(msgDetailService.count(queryWrapper));
    }

    @ApiOperation(value = "已读/未读消息列表, readFlag = 0 未读消息列表，readFlag = 1 已读消息列表")
    @PostMapping("/list/{readFlag}")
    public ResponseResult<PageDTO<MsgDTO>> listUnRead(@PathVariable Integer readFlag, @RequestBody PageFindDTO pageFindDto) {
        QueryWrapper<MsgDTO> queryWrapper = new QueryWrapper<>();
        Map<String,String> filter = pageFindDto.getFilter();
        if( filter!=null && filter.keySet().size()>0){
            String title = filter.get("title");         // 消息标题
            String startStr = filter.get("start");      // 时间段 起
            String endStr  = filter.get("end");         // 时间段 止
            queryWrapper.like(StrUtil.isNotBlank(title), "b.title",title);
            if(StrUtil.isNotBlank(startStr)){
                queryWrapper.ge("b.create_time", DateUtils.parseLocalDateTime(startStr));
            }
            if(StrUtil.isNotBlank(endStr)){
                queryWrapper.ge("b.create_time", DateUtils.parseLocalDateTime(endStr));
            }
        }else{
            queryWrapper.eq("1",1);  // 因为 mapper 中已拼接了 and 语句
        }
        queryWrapper.orderByAsc("b.create_time");

        // 分页参数
        IPage<MsgDTO> page = WebUtils.buildSearchPage(pageFindDto);
        msgMapper.listUnRead(page,WebUtils.getSecurityUsername(),readFlag, queryWrapper);
        PageDTO<MsgDTO> pageDataDTO = WebUtils.buildResultPage(page);
        return WebUtils.ok(pageDataDTO);
    }

    @ApiOperation(value = "查看消息列表")
    @GetMapping("/read/{id}")
    public ResponseResult<Msg> readMsg(@PathVariable String id){
        MsgDetail detail = msgDetailService.getById(id);
        if(detail==null){
            return  WebUtils.fail(ResponseEnum.DATA_NOT_FOUND);
        }
        Msg msg = msgService.getById(detail.getMsgId());
        if(msg==null){
            return  WebUtils.fail(ResponseEnum.DATA_NOT_FOUND);
        }
        detail.setIsRead("1").setReadTime(LocalDateTime.now());
        msgDetailService.updateById(detail);
        return WebUtils.ok(msg);
    }
}
