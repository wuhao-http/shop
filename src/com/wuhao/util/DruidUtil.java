package com.wuhao.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.junit.Test;

import com.alibaba.druid.pool.DruidDataSourceFactory;

public class DruidUtil {
	private static DataSource ds  = null;
	private Connection connection;
	static {
		Properties properties = new Properties();
//		FileInputStream is  = new FileInputStream("src/druid.properties");
		InputStream is = DruidUtil.class.getClassLoader().getResourceAsStream("druid.properties");
		try {
			properties.load(is);
			ds = DruidDataSourceFactory.createDataSource(properties);
		} catch (IOException e) {
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 从连接池中获取连接
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	/**
	 * 释放连接的使用权，把连接交回池中
	 * @param rs
	 * @param stmt
	 * @param conn
	 */
	public static void disResource(ResultSet rs ,Statement stmt,Connection conn) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(stmt!=null) {
				stmt.close();
			}
			if(conn!=null) {
				conn.close();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 返回数据源
	 * @return
	 */
	public static DataSource getDataSource() {
		return ds;
	}
	@Test
	public void test() throws SQLException {
		System.out.println(getConnection());
	}
}
