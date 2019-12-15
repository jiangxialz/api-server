package com.qinyou.apiserver.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qinyou.apiserver.core.base.PageDTO;
import com.qinyou.apiserver.core.base.PageFindDTO;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.result.ResponseResult;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.DataDictDTO;
import com.qinyou.apiserver.sys.entity.DataDict;
import com.qinyou.apiserver.sys.service.IDataDictService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 数据字典 前端控制器
 * </p>
 *
 * @author chuang
 * @since 2019-10-23
 */
@Api(tags = "数据字典")
@RestController
@RequestMapping("/sys/data-dict")
public class DataDictController {

    @Autowired
    IDataDictService dataDictService;

    @ApiOperation("数组字典列表")
    @PreAuthorize("hasAuthority('sysDataDict')")
    @GetMapping(value = "/list")
    public ResponseResult<PageDTO<DataDict>> list(@RequestBody PageFindDTO pageFindDto) {
        // 查询参数
        QueryWrapper<DataDict> queryWrapper = WebUtils.buildSearchQueryWrapper(pageFindDto);
        queryWrapper.eq("type", "group");
        IPage<DataDict> pageQuery = WebUtils.buildSearchPage(pageFindDto);
        // 查询数据
        IPage<DataDict> pageData = dataDictService.page(pageQuery, queryWrapper);
        for (DataDict dataDict : pageData.getRecords()) {
            List<DataDict> children = dataDictService.list(
                    new QueryWrapper<DataDict>().eq("group_code", dataDict.getCode())
            );
            if (children.size() > 0) dataDict.setChildren(children);
        }
        // 数据结果包装
        return WebUtils.ok(WebUtils.buildResultPage(pageData));
    }


    @ApiOperation("添加字典")
    @PreAuthorize("hasAuthority('sysDataDict:add')")
    @PostMapping("/add")
    public ResponseResult add(@RequestBody @Validated DataDictDTO dataDictDTO) {
        dataDictService.add(dataDictDTO);
        return WebUtils.ok(ResponseEnum.ADD_SUCCESS);
    }

    @ApiOperation("修改字典")
    @PreAuthorize("hasAuthority('sysDataDict:update')")
    @PostMapping("/update/{id}")
    public ResponseResult update(@PathVariable("id") String id, @RequestBody @Validated DataDictDTO dataDictDTO) {
        dataDictService.update(id, dataDictDTO);
        return WebUtils.ok(ResponseEnum.UPDATE_SUCCESS);
    }


    @ApiOperation("删除字典")
    @PreAuthorize("hasAuthority('sysDataDict:remove')")
    @GetMapping("/remove/{id}")
    public ResponseResult delete(@PathVariable String id) {
        dataDictService.remove(id);
        return WebUtils.ok(ResponseEnum.DELETE_SUCCESS);
    }

    @ApiOperation("切换状态，如果为ON变更为OFF，如果为OFF变更为ON")
    @PreAuthorize("hasAuthority('sysDataDict:toggleState')")
    @GetMapping("/toggle-state/{id}")
    @Transactional
    public ResponseResult toggleState(@PathVariable String id) {
        dataDictService.toggleState(id);
        return WebUtils.ok(ResponseEnum.TOGGLE_SUCCESS);
    }
}
