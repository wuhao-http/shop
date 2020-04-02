package com.wuhao.dao.impl;

import com.wuhao.dao.ShopUserDao;
import com.wuhao.entity.ShopUser;
import com.wuhao.util.DruidUtil;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

/**
 * 用户dao实现类
 */
public class ShopUserDaoImpl implements ShopUserDao {
    //创建jdbc对象
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(DruidUtil.getDataSource());
    /**
     * 根据用户名查找用户信息
     * @param username
     * @return
     */
    @Override
    public ShopUser findUserByUsername(String username) {
        String sql = "select * from shop_user where username =?";
        List<ShopUser> users = jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(ShopUser.class),username);
        ShopUser shopUser = null;
        if (users.size()>0){
            shopUser = users.get(0);
        }
        return shopUser;
    }
}
