package com.viroyal.light.module.user.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.viroyal.light.common.page.FrontPage;
import com.viroyal.light.module.user.entity.SysUser;
import com.baomidou.mybatisplus.service.IService;
import com.viroyal.light.module.user.entity.UserOnlineBo;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jiaptti
 * @since 2017-12-01
 */
public interface ISysUserService extends IService<SysUser> {
    //分页获得用户列表
    Page<UserOnlineBo> getPagePlus(FrontPage<UserOnlineBo> frontPage);

    //logout 踢出异地登录
    void kickout(Serializable sessionId);

    //logout 用户退出
    void logout(Serializable sessionId);

    //后台存储用户
    void saveUser(SysUser user, String isEffective);

    //app存储用户
    void save(SysUser user);

    //获得用户列表
    List<SysUser> getAllUser();

    //后台更新用户
    void updateUser(SysUser user, String isEffective);

    //app更新
    void update(SysUser user);

    //删除用户
    int deleteBatch(String[] userId);
}
