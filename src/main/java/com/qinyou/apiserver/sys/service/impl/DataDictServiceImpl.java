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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * <p>
 * 数据字典 服务实现类
 * </p>
 *
 * @author chuang
 * @since 2019-10-23
 */
@SuppressWarnings({"Duplicates","SpringJavaInjectionPointsAutowiringInspection"})
@Service
public class DataDictServiceImpl extends ServiceImpl<DataDictMapper, DataDict> implements IDataDictService {
    @Autowired
    DataDictMapper dataDictMapper;

    @Override
    public void findList(DataDict root){
        List<DataDict>  children = list(
                new QueryWrapper<DataDict>()
                        .eq("pid",root.getId()).orderByAsc("sort")
        );
        if(children.size() > 0){
            root.setChildren(children);
            for(DataDict dataDict : children){
                findList(dataDict);
            }
        }
    }

    @Override
    public void add(DataDictDTO dto) {
         DataDict dataDict = new DataDict();
         BeanUtils.copyProperties(dto, dataDict);
         dataDict.setCreater(WebUtils.getSecurityUsername()).setCreateTime(LocalDateTime.now());
         this.save(dataDict);
    }

    @Transactional
    @Override
    public void update(String id, DataDictDTO dto) {
         DataDict dataDict = this.getById(id);
         if(dataDict==null){
             throw RequestException.fail(ResponseEnum.UPDATE_FAIL);
         }
         String oldState = dataDict.getState();
         BeanUtils.copyProperties(dto,dataDict);
         dataDict.setUpdater(WebUtils.getSecurityUsername()).setUpdateTime(LocalDateTime.now());
         this.updateById(dataDict);
         // 如果状态变更，级联所有子节点状态
         if(!oldState.equals(dto.getState())){
             Set<String> findedIds = new HashSet<>();
             findChildrenIds(id, findedIds);
             if(findedIds.size()>0){
                 this.update(new UpdateWrapper<DataDict>()
                         .set("state",dto.getState())
                         .set("update_time",LocalDateTime.now())
                         .set("updater",WebUtils.getSecurityUsername())
                         .in("id",findedIds)
                 );
             }
         }
    }

    @Override
    public void remove(String id) {
        DataDict dataDict = this.getById(id);
        if (dataDict == null) {
            throw RequestException.fail(ResponseEnum.DELETE_FAIL);
        }
        Set<String> findedIds = new HashSet<>();
        findChildrenIds(id, findedIds);
        findedIds.add(id);
        this.remove(new QueryWrapper<DataDict>().in("id",findedIds));
    }

    @Override
    public void toggleState(String id) {
        DataDict dataDict = this.getById(id);
        if (dataDict == null) {
            throw RequestException.fail(ResponseEnum.TOGGLE_FAIL);
        }
        String state = "ON".equals(dataDict.getState()) ? "OFF" : "ON";

        Set<String> findedIds = new HashSet<>();
        findChildrenIds(id, findedIds);
        findedIds.add(id);

        this.update(new UpdateWrapper<DataDict>()
                .set("state",state)
                .in("id",findedIds));
    }

    @Override
    public void findChildrenIds(String id, Set<String> findedIds){
        Set<String> childrenIds = dataDictMapper.findListByPid(id);
        if(childrenIds.size() > 0){
            findedIds.addAll(childrenIds);
            for(String cId : childrenIds){
                findChildrenIds(cId,findedIds);
            }
        }
    }

    @Override
    public void findPForTreeSelect(Map<String,Object> root,Set<String> disableKey) {
        List<Map<String,Object>>  children = dataDictMapper.findPTreeSelectsByPid((String)root.get("key"));
        if(children.size() > 0){
            root.put("children",children);
            for(Map<String,Object> data : children){
                if(disableKey.contains((String)data.get("key"))){
                    data.put("disabled",true);
                }
                findPForTreeSelect(data,disableKey);
            }
        }
    }
}
