package com.viroyal.light.module.dao;

import com.viroyal.light.module.entity.SysPermission;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author jiaptti
 * @since 2017-12-01
 */

@Mapper
public interface SysPermissionMapper extends BaseMapper<SysPermission> {
    public List<SysPermission> getUserPermissions(String uid);
}