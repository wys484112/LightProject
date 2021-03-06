package com.viroyal.light.module.light.controller;

import com.alibaba.fastjson.JSON;
import com.viroyal.light.common.utils.BaseConstant;
import com.viroyal.light.module.light.entity.SysLightInfo;
import com.viroyal.light.module.light.entity.vo.SysInfoBasicLightVo;
import com.viroyal.light.module.light.entity.vo.SysLightInfoVo;
import com.viroyal.light.module.light.service.ISysInfoBasicLightService;
import com.viroyal.light.module.light.service.ISysLightInfoService;
import io.swagger.annotations.*;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jiaptti
 * @since 2018-01-04
 */
@Api("SysLightInfoController相关api")
@Controller
@RequestMapping(value = "/lightInfo")
public class SysLightInfoController {
    @Autowired
    ISysLightInfoService sysLightInfoService;

    @Autowired
    ISysInfoBasicLightService sysInfoBasicLightService;

    @ApiOperation("移动端添加路灯")
    @ApiResponses({
            @ApiResponse(code=200,message="添加成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="添加失败")
    })
    @RequestMapping(value = "/lightInfoSave", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:lightInfo:save")
    public String saveLightInfo(SysLightInfoVo lightInfo){
        return sysLightInfoService.saveLightInfo(lightInfo);
    }


    @ApiOperation("移动端删除路灯")
    @ApiResponses({
            @ApiResponse(code=200,message="删除成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="删除失败")
    })
    @RequestMapping(value = "/lightInfoDelete", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:lightInfo:delete")
    public String deleteLightInfo(@RequestParam(value = "ids[]") String[] ids){
        return sysLightInfoService.deleteLightInfo(ids);
    }


    @ApiOperation("移动端更新路灯")
    @ApiResponses({
            @ApiResponse(code=200,message="更新成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="更新失败")
    })
    @RequestMapping(value = "/lightInfoUpdate", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:lightInfo:update")
    public String updateLightInfo(SysLightInfoVo lightInfo){
       return sysLightInfoService.updateLightInfo(lightInfo);
    }

    @ApiOperation("移动端将路灯添加分组")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "groupId", required = true,
                    dataType = "Int", value = "需要分配策略的路灯组id(sys_light_group的id)多个用逗号隔开"),
            @ApiImplicitParam(paramType = "query", name = "lightInfoIds", required = true,
                    dataType = "Int", value = "要分配的策略id")
    })
    @ApiResponses({
            @ApiResponse(code=200,message="指派成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="指派失败")
    })
    @RequestMapping(value = "/lightInfoStrategyByGroup", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:lightInfo:update")
    public String lightInfoStrategyByGroup (@RequestParam(value = "groupId") String groupId, @RequestParam(value = "lightInfoIds") String lightInfoIds){
        return sysLightInfoService.dispatchLightToGroup(groupId, lightInfoIds);
    }

    @ApiOperation("移动端给多个路灯分配决策")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "strategyId", required = true,
                    dataType = "Int", value = "要分配的策略id"),
            @ApiImplicitParam(paramType = "query", name = "lightInfoIds", required = true,
                    dataType = "Int", value = "路灯信息id(多个id用逗号隔开)")
    })
    @ApiResponses({
            @ApiResponse(code=200,message="指派成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="指派失败")
    })
    @RequestMapping(value = "/dispatchStrategy", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:lightInfo:update")
    public String dispatchStrategy (@RequestParam(value = "strategyId") String strategyId, @RequestParam(value = "lightInfoIds") String lightInfoIds){
        return sysLightInfoService.dispatchStrategy(strategyId, lightInfoIds);
    }

    @ApiOperation("移动端通过街道给路灯分配策略")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "strategyId", required = true,
                    dataType = "Int", value = "要分配的策略id"),
            @ApiImplicitParam(paramType = "query", name = "streetId", required = true,
                    dataType = "Int", value = "街道的common_region_id(多个id用逗号隔开)")
    })
    @ApiResponses({
            @ApiResponse(code=200,message="指派成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="指派失败")
    })
    @RequestMapping(value = "/dispatchStreetStrategy", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:lightInfo:update")
    public String dispatchStreetStrategy (@RequestParam(value = "strategyId") String strategyId, @RequestParam(value = "streetId") String streetId){
        return sysLightInfoService.dispatchStreetStrategy(strategyId, streetId);
    }


    @ApiOperation("移动端通过条件查询所有路灯(标记required的就是必填)pageId,pageSize为必填项,param参数接口填一个1就行，请求的时候不需要带")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="query", name="pageId", dataType="Int", value="第几页"),
            @ApiImplicitParam(paramType="query", name="pageSize", dataType="Int", value="多少条"),
            @ApiImplicitParam(paramType="query", name="infoId", dataType="Long", value="路灯id"),
            @ApiImplicitParam(paramType="query", name="areaId", dataType="Long", value="区Id(common_region_id)"),
            @ApiImplicitParam(paramType="query", name="areaName", dataType="String", value="区名(模糊查询)"),
            @ApiImplicitParam(paramType="query", name="cityId", dataType="Long", value="城市Id(common_region_id)"),
            @ApiImplicitParam(paramType="query", name="streetId", dataType="Long", value="街道Id(common_region_id)"),
            @ApiImplicitParam(paramType="query", name="streetName", dataType="String", value="街道名(模糊查询)"),
            @ApiImplicitParam(paramType="query", name="userId", dataType="Long", value="用户Id"),
            @ApiImplicitParam(paramType="query", name="poleId", dataType="Long", value="灯杆Id"),
            @ApiImplicitParam(paramType="query", name="boxId", dataType="Long", value="灯箱Id"),
            @ApiImplicitParam(paramType="query", name="basicId", dataType="Long", value="安装路灯Id"),
            @ApiImplicitParam(paramType="query", name="alarmId", dataType="Long", value="警报id"),
            @ApiImplicitParam(paramType="query", name="userName", dataType="String", value="维修员名字"),
            @ApiImplicitParam(paramType="query", name="groupId", dataType="Long", value="组Id"),
            @ApiImplicitParam(paramType="query", name="code", dataType="String", value="路灯编号(模糊查询)"),
            @ApiImplicitParam(paramType="query", name="status", dataType="String", value="是否启用(1表示启用，0表示没启用)"),
            @ApiImplicitParam(paramType="query", name="longitude", dataType="Double", value="经度"),
            @ApiImplicitParam(paramType="query", name="latitude", dataType="Double", value="维度"),
            @ApiImplicitParam(paramType="query", name="strategyId", dataType="Double", value="决策id，具体看sys_strategy表"),
            @ApiImplicitParam(paramType="query", name="sort", dataType="String" ,value="排序方式(asc升序，desc降序)")
    })
    @ApiResponses({
            @ApiResponse(code=200,message="查询成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="查询失败")
    })
    @RequestMapping(value = "/queryWithCondition", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:lightInfo:list")
    public String queryWithCondition(@RequestParam Map<String, Object> params){
        return sysLightInfoService.queryWithCondition(params);
    }

    @ApiOperation("移动端通过路灯信息id获得安装路灯")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="query", name="infoId", dataType="Long" ,value="路灯信息id")
    })
    @ApiResponses({
            @ApiResponse(code=200,message="查询成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="查询失败")
    })
    @RequestMapping(value = "/getLightById", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:infoBasic:list")
    public String getLightById(String infoId){
        return sysLightInfoService.getLightById(infoId);
    }

    @ApiOperation("移动端添加路灯上的安装路灯")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="query", name="infoId", required = true, dataType="Long" ,value="路灯信息id"),
            @ApiImplicitParam(paramType="query", name="basicId", required = true, dataType="Long" ,value="安装路灯id，多个用逗号隔开")
    })
    @ApiResponses({
            @ApiResponse(code=200,message="添加成功"),
            @ApiResponse(code = 400, message = "添加错误"),
            @ApiResponse(code=500,message="添加失败")
    })
    @RequestMapping(value = "/saveBasicLight", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:infoBasic:save")
    public String saveBasicLight(@RequestParam(value = "infoId") String infoId, @RequestParam(value = "basicId") String basicId){
        return sysInfoBasicLightService.save(infoId, basicId);
    }

    @ApiOperation("移动端更新路灯上的安装路灯")
    @ApiResponses({
            @ApiResponse(code=200,message="更新成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="更新失败")
    })
    @RequestMapping(value = "/updateBasicLight", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:infoBasic:update")
    public String updateBasicLight(SysInfoBasicLightVo infoBasicLightVo){
        return sysInfoBasicLightService.update(infoBasicLightVo);
    }

    @ApiOperation("移动端删除路灯上的安装路灯关联")
    @ApiResponses({
            @ApiResponse(code=200,message="删除成功"),
            @ApiResponse(code = 400, message = "请求错误"),
            @ApiResponse(code=500,message="删除失败")
    })
    @RequestMapping(value = "/deleteBasicLight", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:infoBasic:delete")
    public String deleteBasicLight(@RequestParam(value = "ids[]") String[] ids){
        return sysInfoBasicLightService.deleteBatch(ids);
    }

    @ExceptionHandler({Exception.class})
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ResponseBody
    public String processUnauthenticatedException(Exception ex) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        if(ex instanceof UnauthorizedException){
            resultMap.put(BaseConstant.CODE, BaseConstant.ERROR_CODE);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.NO_AUTORITY);
        } else if(ex instanceof BindException){
            resultMap.put(BaseConstant.CODE, BaseConstant.ERROR_CODE);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.REQUEST_EXCEPTION + " : " + BaseConstant.EXCEPTION_FORMAT);
        } else {
            resultMap.put(BaseConstant.CODE, BaseConstant.ERROR_CODE);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.REQUEST_EXCEPTION + " : " +
                    BaseConstant.EXCEPTION_TYPE + " = " +ex.getClass().getSimpleName() + ", " +
                    BaseConstant.EXCEPTION_MESSAGE + " = " + ex.getMessage());
        }
        return JSON.toJSONString(resultMap);
    }
}
