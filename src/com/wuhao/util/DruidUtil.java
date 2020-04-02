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

/**
 * 数据库连接工具
 */
public class DruidUtil {
	private static DataSource ds  = null;
	//加载配置文件
	static {
		try {
			Properties properties = new Properties();
			InputStream is = DruidUtil.class.getClassLoader().getResourceAsStream("druid.properties");
			properties.load(is);
			ds = DruidDataSourceFactory.createDataSource(properties);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 获取连接
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	/**
	 * 关闭连接，释放资源
	 * @param rs
	 * @param stmt
	 * @param conn
	 */
	 public static void release(ResultSet rs ,Statement stmt,Connection conn) {
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
	 * 获取数据源
	 * @return
	 */
	public static DataSource getDataSource() {
		return ds;
	}

	/**
	 * 测试连接
	 * @throws SQLException
	 */
	@Test
	public void test() throws SQLException {
		System.out.println(ds);
	}
}
