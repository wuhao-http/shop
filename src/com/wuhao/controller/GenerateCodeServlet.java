package com.wuhao.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wuhao.util.ImageCodeGeneratorUtil;

/**
 * 验证码servlet
 */
@WebServlet("/generateCodeImage")
public class GenerateCodeServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	/**
	 * 验证码生成方法
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = ImageCodeGeneratorUtil.generateCode(4, ImageCodeGeneratorUtil.VERTIFICATION_CODE);//利用工具类生成code
		ServletOutputStream outputStream = resp.getOutputStream(); //从响应中获取输出流
		ImageCodeGeneratorUtil.generateCodeImage(outputStream, code, 100, 40);//从工具类中或者codeImage
		HttpSession session = req.getSession(); //获取httpSession对象 ，将code放进session对象
		session.setAttribute("code", code);
	}
	
}
