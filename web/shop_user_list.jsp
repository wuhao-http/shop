<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
 String basePath =request.getContextPath();
%>       
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<link rel="stylesheet" type="text/css" href="<%=basePath %>/lib/pagination/pagination.css" media="screen">
<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<span id="pageCount" style="display:none;">${map.totalSize }</span>
	<span id="pageNo" style="display:none;">${map.pageNo }</span>
	<div class="text-c">
		<form action="users_param" method="post">
		<input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="realName" name="realName" value="${map.realName }">
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
		<i class="Hui-iconfont">&#xe6e2;</i> 
		批量删除</a> 
		<a href="javascript:;" onclick="user_add('添加管理员','shop_user_add.jsp','800','500')" 
			class="btn btn-primary radius">
			<i class="Hui-iconfont">&#xe600;</i> 添加管理员
		</a></span> 
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">员工列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="40">ID</th>
				<th width="150">登录名</th>
				<th width="90">真实姓名</th>
				<th width="150">身份证号</th>
				<th width="40">性别</th>
				<th width="100">是否已启用</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach items="${map.users}" var="user">
				<tr class="text-c">
					<td><input type="checkbox" value="${user.id }" name="id"></td>
					<td>${user.id }</td>
					<td>${user.username }</td>
					<td>${user.realName }</td>
					<td>${user.idcard }</td>
					<td>${user.sex==0?'男':'女' }</td>
					<td class="td-status"><span class="label label-success radius">已启用</span></td>
					<td class="td-manage">
						<a style="text-decoration:none" onClick="admin_stop(this,'10001')" href="javascript:;" title="停用">
							<i class="Hui-iconfont">&#xe631;</i>
						</a> 
						<a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','find_user_id',${user.id},'800','500')" class="ml-5" style="text-decoration:none">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						<a title="删除" href="javascript:;" onclick="admin_del(this,${user.id})" class="ml-5" style="text-decoration:none">
							<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
					</td>
				</tr>
			</c:forEach>
			
			
		</tbody>
	</table>

</div>
<div class="m-style M-box2" style="float:right;margin-right:20px;"></div>
<!--_footer 作为公共模版分离出去-->
<script src="<%=basePath %>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<script src="<%=basePath %>/lib/pagination/jquery.pagination.js"></script>
<!--请在下方写此页面业务相关的脚本-->


<script type="text/javascript">
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function user_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'delete_user',
			dataType: 'json',
			data:{id:id},
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
				parent.location.reload();
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url+"?id="+id,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}
</script>
<script type="text/javascript" src="<%=basePath%>/lib/pagination/jquery.pagination.js"></script>
<script type="text/javascript">
$(function () {
    

    $('.M-box2').pagination({
    	pageCount:$("#pageCount").text(),
   	    jump: true,
   	    coping: true,
   	    homePage: '首页',
   	    endPage: '末页',
   	    prevContent: '上页',
   	    nextContent: '下页',
   	    current:$("#pageNo").text(),
   	    callback: function (api) {
   	        console.log(api.getCurrent())
   	        location.href="users_param?pageNo="+api.getCurrent()+"&realName="+$("#realName").val();
   	    }
    });

  
});
</script>
</body>
</html>