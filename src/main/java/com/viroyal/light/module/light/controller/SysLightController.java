package com.viroyal.light.module.light.controller;

import com.alibaba.fastjson.JSON;
import com.viroyal.light.common.page.DatePage;
import com.viroyal.light.common.utils.BaseConstant;
import com.viroyal.light.module.light.entity.SysLight;
import com.viroyal.light.module.light.service.ISysLightService;
import io.swagger.annotations.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
@Api("SysLightController相关api")
@Controller
@RequestMapping("/light")
public class SysLightController {

    @Autowired
    ISysLightService sysLightService;

    @ApiOperation("移动端添加路灯数据")
    @ApiResponses({
            @ApiResponse(code=200,message="添加成功"),
            @ApiResponse(code=500,message="添加失败")
    })
    @RequestMapping(value = "/lightSave", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:light:save")
    public String saveLight(SysLight sysLight){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try{
            resultMap.put(BaseConstant.CODE, BaseConstant.SUCCESS_CODE);
            sysLightService.save(sysLight);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.SUCCESS_RESULT);
        } catch (Exception e){
            e.printStackTrace();
            resultMap.put(BaseConstant.CODE, BaseConstant.ERROR_CODE);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.SAVE_FAILURE + " : " + e.getMessage());
        }
        return JSON.toJSONString(resultMap);
    }


    @ApiOperation("移动端更新路灯数据")
    @ApiResponses({
            @ApiResponse(code=200,message="更新成功"),
            @ApiResponse(code=500,message="更新失败")
    })
    @RequestMapping(value = "/lightUpdate", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:light:update")
    public String updateLight(SysLight sysLight){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try{
            resultMap.put(BaseConstant.CODE, BaseConstant.SUCCESS_CODE);
            sysLightService.update(sysLight);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.SUCCESS_RESULT);
        } catch (Exception e){
            e.printStackTrace();
            resultMap.put(BaseConstant.CODE, BaseConstant.ERROR_CODE);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.UPDATE_FAILURE + " : " + e.getMessage());
        }
        return JSON.toJSONString(resultMap);
    }


    @ApiOperation("移动端删除路灯数据")
    @ApiResponses({
            @ApiResponse(code=200,message="删除成功"),
            @ApiResponse(code=500,message="删除失败")
    })
    @RequestMapping(value = "/lightDelete", method = RequestMethod.GET)
    @ResponseBody
    @RequiresPermissions("sys:light:delete")
    public String deleteLight(@RequestParam(value = "ids[]") String[] ids){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try{
            resultMap.put(BaseConstant.CODE, BaseConstant.SUCCESS_CODE);
            sysLightService.deleteBatch(ids);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.SUCCESS_RESULT);
        } catch (Exception e){
            e.printStackTrace();
            resultMap.put(BaseConstant.CODE, BaseConstant.ERROR_CODE);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.DELETE_FAILURE + " : " + e.getMessage());
        }
        return JSON.toJSONString(resultMap);
    }

    @ApiOperation("移动端通过条件查询所有路灯数据(标记required的就是必填)pageId,pageSize为必填项,param参数接口填一个1就行，请求的时候不需要带")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType="query", name="pageId", dataType="Int", value="第几页"),
            @ApiImplicitParam(paramType="query", name="pageSize", dataType="Int", value="多少条"),
            @ApiImplicitParam(paramType="query", name="lightId", dataType="Int", value="路灯数据id"),
            @ApiImplicitParam(paramType="query", name="status", dataType="Int", value="是否打开(1/0表示开/关)"),
            @ApiImplicitParam(paramType="query", name="voltageGt", dataType="Int", value="电压(这里表示大于)"),
            @ApiImplicitParam(paramType="query", name="voltageLt", dataType="Int", value="电压(这里表示小于)"),
            @ApiImplicitParam(paramType="query", name="currentGt", dataType="Int", value="电流(这里表示大于)"),
            @ApiImplicitParam(paramType="query", name="currentLt", dataType="Int", value="电流(这里表示小于)"),
            @ApiImplicitParam(paramType="query", name="temperatureGt", dataType="Int", value="温度(这里表示大于)"),
            @ApiImplicitParam(paramType="query", name="temperatureLt", dataType="Int", value="温度(这里表示小于)"),
            @ApiImplicitParam(paramType="query", name="humidityGt", dataType="Int", value="湿度(这里表示大于)"),
            @ApiImplicitParam(paramType="query", name="humidityLt", dataType="Int", value="湿度(这里表示小于)"),
            @ApiImplicitParam(paramType="query", name="startTime", dataType="Date", value="日期(格式为yyyy-MM-dd)(这里表示大于)"),
            @ApiImplicitParam(paramType="query", name="endTime", dataType="Date", value="日期(格式为yyyy-MM-dd)(这里表示小于)"),
            @ApiImplicitParam(paramType="query", name="trafficFlow", dataType="Int", value="车流量"),
            @ApiImplicitParam(paramType="query", name="lightnessGt", dataType="Int", value="亮度(这里表示大于)"),
            @ApiImplicitParam(paramType="query", name="lightnessLt", dataType="Int", value="亮度(这里表示小于)"),
            @ApiImplicitParam(paramType="query", name="infoId", dataType="Int", value="路灯信息id(sys_light_info表的id)"),
            @ApiImplicitParam(paramType="query", name="sort", dataType="String" ,value="排序方式(asc升序，desc降序)")
    })
    @ApiResponses({
            @ApiResponse(code=200,message="查询成功"),
            @ApiResponse(code=500,message="查询失败")
    })
    @RequestMapping(value = "/queryWithCondition", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("sys:light:list")
    public String queryWithCondition(@RequestParam Map<String, Object> params){
        if((!params.containsKey("pageId") && params.containsKey("pageSize"))
                || (params.containsKey("pageId") && !params.containsKey("pageSize"))){
            Map<String, Object> resultMap = new HashMap<String, Object>();
            resultMap.put(BaseConstant.CODE, BaseConstant.ERROR_CODE);
            resultMap.put(BaseConstant.MESSAGE, BaseConstant.REQUEST_ERROR);
            return JSON.toJSONString(resultMap);
        }
        DatePage<SysLight> datePage = sysLightService.queryWithCondition(params);
        return JSON.toJSONString(datePage);
    }
}
