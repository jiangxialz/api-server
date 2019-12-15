package com.qinyou.apiserver.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qinyou.apiserver.sys.dto.DataDictDTO;
import com.qinyou.apiserver.sys.entity.DataDict;

/**
 * <p>
 * 数据字典 服务类
 * </p>
 *
 * @author chuang
 * @since 2019-10-23
 */
public interface IDataDictService extends IService<DataDict> {
    void add(DataDictDTO dto);
    void update(String id, DataDictDTO dto);
    void remove(String id);
    void toggleState(String id);

}
