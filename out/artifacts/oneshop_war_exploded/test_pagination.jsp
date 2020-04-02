<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String basePath =request.getContextPath();
%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>pagination.js - 分页</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/lib/pagination/pagination.css" media="screen">
</head>

<body>
 
    <div class="m-style M-box2"></div>
              
               
                
      
      


    <script src="<%=basePath %>/js/jquery-3.4.1.min.js"></script>
    <script src="<%=basePath %>/lib/pagination/jquery.pagination.js"></script>
    <script>
        $(function () {
           
            
            $('.M-box2').pagination({
                coping: true,
                homePage: '首页',
                endPage: '末页',
                prevContent: '上页',
                nextContent: '下页'
            });

          
        });
    </script>
</body>

</html>