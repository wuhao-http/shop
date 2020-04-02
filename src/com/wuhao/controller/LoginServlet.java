package com.wuhao.controller;

import com.wuhao.service.ShopUserService;
import com.wuhao.service.impl.ShopUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    ShopUserService shopUserService = new ShopUserServiceImpl();
    /**
     * 用户登录方法
     * @param req 请求
     * @param resp 相应
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String,Object> map = new HashMap<>(); //创建map对象，用来存放对象
        int flag = 0; //标记
        String errMsg = ""; //错误信息
        String userName = req.getParameter("username");  //从请求中拿用户名
        String password = req.getParameter("password");  //从请求中拿密码
        String validateCode = req.getParameter("validateCode");  //从请求中拿验证码
        //如果用户名或者密码或者验证码为空或者空字符串，则将flag标记和错误信息errMsg放进map对象，在将map放进请求request对象中 然后转发原来的jsp页面
        if ((userName==null||userName.equals("")||(password==null)||password.equals("")||(validateCode==null)||validateCode.equals(""))){
            flag = 1;
            errMsg = "用户名和密码不能为空";
            map.put("flag",flag);
            map.put("errMsg",errMsg);
            req.setAttribute("map",map);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
            return;
        }
        Object object = req.getSession().getAttribute("code");//从session中拿code封装进对象
        String sessionCode = "";
        if (object!=null){
            sessionCode = String.valueOf(object);//code有值则赋值给sessionCode
        }
        if (!sessionCode.equalsIgnoreCase(validateCode)){ //将生成的code和前台拿到用户输入的code进行比较，不相同则返回错误信息，转发至登录页面
            flag = 1;
            errMsg = "验证码错误";
            map.put("flag",flag);
            map.put("errMsg",errMsg);
            req.setAttribute("map",map);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
            return;
        }
        Map<String,Object> returnMap = shopUserService.login(userName,password);//用map对象存放返回的结果集
        Object tempFlag = returnMap.get("flag");//从结果集中获取标记
        if (String.valueOf(tempFlag).equals("0")){//如果获取的标记和0相同 则将返回的对象放进session，然后重定向到index.jsp
            HttpSession session = req.getSession();
            session.setAttribute("user",returnMap.get("user"));
            resp.sendRedirect("index.html");
            return;
        }else {
            if(returnMap.get("errMsg").equals("密码错误")){//如果不相同，则提示密码错误，将用户名放进放回结果集中
                returnMap.put("username",userName);
            }
            req.setAttribute("map",returnMap);//将结果集放进request请求中
            req.getRequestDispatcher("login.jsp").forward(req,resp);//转发至登录页面
            return;
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
