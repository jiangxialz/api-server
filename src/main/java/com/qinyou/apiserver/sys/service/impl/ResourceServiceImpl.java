package com.qinyou.apiserver.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qinyou.apiserver.core.result.RequestException;
import com.qinyou.apiserver.core.result.ResponseEnum;
import com.qinyou.apiserver.core.utils.WebUtils;
import com.qinyou.apiserver.sys.dto.ResourceDTO;
import com.qinyou.apiserver.sys.entity.Resource;
import com.qinyou.apiserver.sys.entity.RoleResource;
import com.qinyou.apiserver.sys.mapper.ResourceMapper;
import com.qinyou.apiserver.sys.service.IResourceService;
import com.qinyou.apiserver.sys.service.IRoleResourceService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * <p>
 * 系统资源表 服务实现类
 * </p>
 *
 * @author chuang
 * @since 2019-10-19
 */
@SuppressWarnings({"Duplicates","SpringJavaInjectionPointsAutowiringInspection"})
@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements IResourceService {

    @Autowired
    IRoleResourceService roleResourceService;

    @Override
    public void add(ResourceDTO dto) {
        Resource resource = new Resource();
        BeanUtils.copyProperties(dto, resource);
        resource.setCreater(WebUtils.getSecurityUsername())
                .setCreateTime(LocalDateTime.now());
        this.save(resource);
    }

    @Transactional
    @Override
    public void update(String id, ResourceDTO dto) {
        Resource resource = this.getById(id);
        if (resource == null) {
            throw RequestException.fail(ResponseEnum.UPDATE_FAIL);
        }

        String oldState = resource.getState();
        BeanUtils.copyProperties(dto, resource, "type","id");  // 资源编码、类型不可修改
        resource.setUpdater(WebUtils.getSecurityUsername())
                .setUpdateTime(LocalDateTime.now());
        this.updateById(resource);

        // 变更子级状态
        if(!dto.getState().equals(oldState) && "menu".equals(resource.getType())){
            this.update(
                    new UpdateWrapper<Resource>()
                            .set("state",dto.getState())
                            .set("updater", WebUtils.getSecurityUsername())
                            .set("update_time",LocalDateTime.now())
                            .likeLeft("id",dto.getId())
            );
        }
    }

    @Transactional
    @Override
    public void remove(String id) {
        Resource resource = this.getById(id);
        if (resource == null) {
            throw RequestException.fail(ResponseEnum.DELETE_FAIL);
        }
        // 删除自己以及子级
        this.remove(new QueryWrapper<Resource>().likeLeft("id",id));
        // 删中间表数据
        roleResourceService.remove(new QueryWrapper<RoleResource>().likeRight("resource_id",id));
    }

    @Override
    public void toggleState(String id) {
        Resource resource = this.getById(id);
        if (resource == null) {
            throw RequestException.fail(ResponseEnum.TOGGLE_FAIL);
        }
        String state = "ON".equals(resource.getState()) ? "OFF" : "ON";
        this.update(
                new UpdateWrapper<Resource>()
                        .set("state",state)
                        .set("updater", WebUtils.getSecurityUsername())
                        .set("update_time",LocalDateTime.now())
                        .likeRight("id",id)
        );
    }
}
