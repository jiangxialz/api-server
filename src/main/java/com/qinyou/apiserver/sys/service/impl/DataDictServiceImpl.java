package com.qinyou.apiserver.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qinyou.apiserver.core.result.RequestException;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.DataDictDTO;
import com.qinyou.apiserver.sys.entity.DataDict;
import com.qinyou.apiserver.sys.mapper.DataDictMapper;
import com.qinyou.apiserver.sys.service.IDataDictService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * <p>
 * 数据字典 服务实现类
 * </p>
 *
 * @author chuang
 * @since 2019-10-23
 */
@SuppressWarnings("Duplicates")
@Service
public class DataDictServiceImpl extends ServiceImpl<DataDictMapper, DataDict> implements IDataDictService {

    @Override
    public void add(DataDictDTO dto) {
         DataDict dataDict = new DataDict();
         BeanUtils.copyProperties(dto, dataDict);
         dataDict.setCreater(WebUtils.getSecurityUsername()).setCreateTime(LocalDateTime.now());
         this.save(dataDict);
    }

    @Override
    public void update(String id, DataDictDTO dto) {
         DataDict dataDict = this.getById(id);
         if(dataDict==null){
             throw RequestException.fail(ResponseEnum.UPDATE_FAIL);
         }
         String oldState = dataDict.getState();
         String oldCode = dataDict.getCode();

         BeanUtils.copyProperties(dto,dataDict,"type");  // type 不可修改
         dataDict.setUpdater(WebUtils.getSecurityUsername()).setUpdateTime(LocalDateTime.now());
         this.updateById(dataDict);

         // 类型为 组， state 和 code 变更，更新下级组 状态、组编码
         if("group".equals(dto.getType()) && (!oldState.equals(dto.getState()) || !oldCode.equals(dto.getCode()))){

             this.update(new UpdateWrapper<DataDict>()
                     .set("state",dto.getState())
                     .set("group_code",dto.getCode())
                     .set("update_time",LocalDateTime.now())
                     .set("updater",WebUtils.getSecurityUsername())
                     .eq("group_code",oldCode)
             );
         }
    }

    @Override
    public void remove(String id) {
        DataDict dataDict = this.getById(id);
        if (dataDict == null) {
            throw RequestException.fail(ResponseEnum.DELETE_FAIL);
        }
        QueryWrapper<DataDict> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", id);
        if("group".equals(dataDict.getType())){
            queryWrapper.or().eq("group_code", dataDict.getCode());
        }
        this.remove(queryWrapper);
    }

    @Override
    public void toggleState(String id) {
        DataDict dataDict = this.getById(id);
        if (dataDict == null) {
            throw RequestException.fail(ResponseEnum.TOGGLE_FAIL);
        }
        String state = "ON".equals(dataDict.getState()) ? "OFF" : "ON";

        UpdateWrapper<DataDict> wrapper = new UpdateWrapper<>();
        wrapper.set("state", state);
        wrapper.eq("id", dataDict.getId());
        if("group".equals(dataDict.getType())){
            wrapper.or().eq("group_code", dataDict.getCode());
        }
        this.update(wrapper);
    }
}
