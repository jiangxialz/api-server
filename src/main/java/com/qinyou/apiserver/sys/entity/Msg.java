package com.qinyou.apiserver.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * <p>
 * 消息主表，保存消息内容
 * </p>
 *
 * @author chuang
 * @since 2020-01-08
 */
@Data
@Accessors(chain = true)
@ApiModel(value="数据响应", description="用户消息")
@TableName("sys_msg")
public class Msg  {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id",type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "类型编码")
    @TableField("type_code")
    private String typeCode;

    @ApiModelProperty(value = "消息内容")
    @TableField("content")
    private String content;

    @ApiModelProperty(value = "过期日期")
    @TableField("expiry_time")
    private LocalDateTime expiryTime;

    @ApiModelProperty(value = "作废日期")
    @TableField("dead_time")
    private LocalDateTime deadTime;

    @ApiModelProperty(value = "创建日期")
    @TableField("create_time")
    public LocalDateTime createTime;
}
