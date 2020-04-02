package com.wuhao.service.impl;

import com.wuhao.dao.ShopUserDao;
import com.wuhao.dao.impl.ShopUserDaoImpl;
import com.wuhao.entity.ShopUser;
import com.wuhao.service.ShopUserService;

import java.util.HashMap;
import java.util.Map;

/**
 * 用户服务层实现类
 */
public class ShopUserServiceImpl implements ShopUserService {
    ShopUserDao shopUserDao = new ShopUserDaoImpl();
    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    @Override
    public Map<String, Object> login(String username, String password) {
        ShopUser shopUser = shopUserDao.findUserByUsername(username);
        Map<String,Object> returnMap = new HashMap<>();
        String errMsg = "";
        int flag = 0;
        if (shopUser!=null){
            if (shopUser.getPassword().equals(password)){

            }else {
                errMsg = "密码错误";
                flag = 1;
            }
        }else {
            errMsg = "用户名不存在";
            flag = 1;
        }
        returnMap.put("flag",flag);
        returnMap.put("errMsg",errMsg);
        return returnMap;
    }
}
