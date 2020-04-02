package com.wuhao.service;

import java.util.Map;

/**
 * 用户服务层
 */
public interface ShopUserService {
    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    Map<String,Object> login(String username,String password);
}
