package com.viroyal.light.module.user.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.viroyal.light.common.page.DatePage;
import com.viroyal.light.common.page.FrontPage;
import com.viroyal.light.common.utils.NumberUtils;
import com.viroyal.light.module.user.dao.SysRolePermissionMapper;
import com.viroyal.light.module.user.entity.SysPermission;
import com.viroyal.light.module.user.dao.SysPermissionMapper;
import com.viroyal.light.module.user.entity.SysRolePermission;
import com.viroyal.light.module.user.service.ISysPermissionService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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

    @Autowired
    SysRolePermissionMapper sysRolePermissionMapper;

    @Override
    public List<SysPermission> queryAll() {
        return sysPermissionMapper.queryAll();
    }

    @Override
    public DatePage<SysPermission> queryWithCondition(Map<String, Object> params) {
        Page<SysPermission> page = new Page<SysPermission>();
        for (Map.Entry<String, Object> entry : params.entrySet()) {
            if(entry.getKey().toString().equals("pageId")){
                page.setCurrent(Integer.parseInt(entry.getValue().toString()));
            } else if(entry.getKey().toString().equals("pageSize")){
                page.setSize(Integer.parseInt(entry.getValue().toString()));
            } else {
                if(NumberUtils.isNumber(entry.getValue().toString())){
                    params.put(entry.getKey(), Long.valueOf(entry.getValue().toString()));
                }
            }
        }
        page.setRecords(sysPermissionMapper.queryWithCondition(params, page));
        return new DatePage<SysPermission>(page);
    }

    @Transactional
    @Override
    public void savePermission(SysPermission permission) {
        //添加权限
        sysPermissionMapper.save(permission);

        //设置权限角色关系
        SysRolePermission rolePermission = new SysRolePermission();
        rolePermission.setPid(permission.getId());
        rolePermission.setRid(1L);

        sysRolePermissionMapper.insert(rolePermission);
    }

    @Transactional
    @Override
    public void update(SysPermission permission) {
        sysPermissionMapper.update(permission);
    }

    @Transactional
    @Override
    public void deleteBatch(String[] ids) {
        sysPermissionMapper.deleteBatch(ids);
    }
}
