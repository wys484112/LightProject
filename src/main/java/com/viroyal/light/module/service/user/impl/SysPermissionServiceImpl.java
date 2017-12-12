package com.viroyal.light.module.service.user.impl;

import com.viroyal.light.module.entity.user.SysPermission;
import com.viroyal.light.module.dao.user.SysPermissionMapper;
import com.viroyal.light.module.service.user.ISysPermissionService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jiaptti
 * @since 2017-12-01
 */
@Service
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionMapper, SysPermission> implements ISysPermissionService {

    @Autowired
    SysPermissionMapper sysPermissionMapper;

    @Override
    public List<SysPermission> getUserPermissions(int id) {
        return sysPermissionMapper.getUserPermissions(id);
    }
}