package com.wuhao.dao;

import com.wuhao.entity.ShopUser;

import java.util.List;

/**
 * 用户dao
 */
public interface ShopUserDao {
    /**
     * 根据用户名查找用户信息
     * @param username
     * @return
     */
    ShopUser findUserByUsername(String username);
}
