package com.qinyou.apiserver.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qinyou.apiserver.sys.dto.ResourceDTO;
import com.qinyou.apiserver.sys.entity.Resource;

/**
 * <p>
 * 系统资源表 服务类
 * </p>
 *
 * @author chuang
 * @since 2019-10-19
 */
public interface IResourceService extends IService<Resource> {

    /**
     * 添加
     * @param dto
     */
    void add(ResourceDTO dto);

    /**
     * 修改
     * @param id
     * @param dto
     */
    void update(String id, ResourceDTO dto);

    /**
     * 删除
     * @param id
     */
    void remove(String id);

    /**
     * 切换 资源状态
     * @param id
     */
    void toggleState(String id);


}
