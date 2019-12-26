package com.qinyou.apiserver.core.base;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;


/**
 * Entity 基类
 * @author chuang
 */
@Getter
@Setter
@Accessors(chain = true)
public class BaseEntity {

    @ApiModelProperty(value = "创建时间")
    @TableField(value = "create_time",select = false)
    public LocalDateTime createTime;

    @ApiModelProperty(value = "创建人")
    @TableField(value ="creater",select = false)
    public String creater;

    @ApiModelProperty(value = "最后修改时间")
    @TableField(value ="update_time",select = false)
    public LocalDateTime updateTime;

    @ApiModelProperty(value = "最后修改人")
    @TableField(value ="updater",select = false)
    public String updater;
}
