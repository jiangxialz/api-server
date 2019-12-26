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
 * 用户角色中间表
 * </p>
 *
 * @author chuang
 * @since 2019-12-10
 */
@Data
@Accessors(chain = true)
@TableName("sys_user_role")
@ApiModel(value="UserRole对象", description="用户角色中间表")
public class UserRole {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id",type = IdType.ID_WORKER_STR)
    private String id;

    @ApiModelProperty(value = "用户id")
    @TableField("user_id")
    private String userId;

    @ApiModelProperty(value = "角色id")
    @TableField("role_id")
    private String roleId;

    @ApiModelProperty(value = "创建时间")
    @TableField(value = "create_time",select = false)
    public LocalDateTime createTime;

    @ApiModelProperty(value = "创建人")
    @TableField(value = "creater",select = false)
    public String creater;


}
