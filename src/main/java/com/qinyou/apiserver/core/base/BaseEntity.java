package com.qinyou.apiserver.core.base;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;


/**
 * Entity 基类
 */
@Getter
@Setter
@Accessors(chain = true)
public class BaseEntity {

    @ApiModelProperty(value = "创建时间")
    @TableField("create_time")
    public LocalDateTime createTime;

    @ApiModelProperty(value = "创建人")
    @TableField("creater")
    public String creater;

    @ApiModelProperty(value = "最后修改时间")
    @TableField("update_time")
    public LocalDateTime updateTime;

    @ApiModelProperty(value = "最后修改人")
    @TableField("updater")
    public String updater;
}
