package com.viroyal.light.module.light.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value="路灯信息")
public class SysLightInfoVo {
	@ApiModelProperty("主键id,自增长(不用填，更新的时候带上)")
	private Long id;
	/**
	 * 路灯编码
	 */
	@ApiModelProperty("路灯编码(添加必填，更新选填)")
	private String code;
	/**
	 * 路灯信息
	 */
	@ApiModelProperty("路灯信息(添加必填，更新选填)")
	private String lightInfo;
	/**
	 * 1:正在使用，0:刚注册信息并没有投入使用
	 */
	@ApiModelProperty("是否启用( 1:正在使用，0:刚注册信息并没有投入使用)(添加必填，更新选填)")
	private String status;
	/**
	 * 经度
	 */
	@ApiModelProperty("经度(添加必填，更新选填)")
	private Double longitude;
	/**
	 * 纬度
	 */
	@ApiModelProperty("纬度(添加必填，更新选填)")
	private Double latitude;
	/**
	 * 引用策略表的id，根据四季的不同，车流量的不同，来指派亮度以及打开时间
	 */
	@ApiModelProperty("策略id(添加必填，更新选填)")
	private Long strategyId;
	/**
	 * 所属用户id
	 */
	@ApiModelProperty("所属维修员id(即用户id,看数据库谁是维修员)(需要分配的时候就添加，更新选填)")
	private Long userId;
	/**
	 * 所属街道id
	 */
	@ApiModelProperty("所属街道id(添加必填，更新选填)")
	private Long streetId;
	/**
	 * 所属组的id
	 */
	@ApiModelProperty("所属组的id(即sys_group表中的id)(添加，更新选填)")
	private Long groupId;
	/**
	 * 路灯自动上报周期
	 */
	@ApiModelProperty("路灯自动上报周期(时间为毫秒，多久提交一次数据到sys_light表，默认60秒)(添加，更新选填)")
	private Long autoReport;
	/**
	 * 灯杆id
	 */
	@ApiModelProperty("灯杆id(添加必填，更新选填)")
	private Long poleId;
	/**
	 * 灯箱id
	 */
	@ApiModelProperty("灯箱id(添加必填，更新选填)")
	private Long boxId;
	/**
	 * 安装路灯id
	 */
	@ApiModelProperty("安装路灯id(添加必填，更新选填)")
	private Long basicId;
	/**
	 * 警报id
	 */
	@ApiModelProperty("警报id(添加，更新选填)")
	private Long alarmId;
}