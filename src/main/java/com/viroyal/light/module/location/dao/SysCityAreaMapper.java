package com.viroyal.light.module.location.dao;

import com.viroyal.light.module.location.entity.SysCityArea;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author jiaptti
 * @since 2018-01-04
 */
public interface SysCityAreaMapper extends BaseMapper<SysCityArea> {
    /**
     * 更新城市和区
     * @param cityArea 城市区关联对象
     */
    void updateCityArea(SysCityArea cityArea);
}