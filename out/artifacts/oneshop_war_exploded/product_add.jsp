<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="/OneShopManager/css/sku_style.css" />
<!-- 灯箱Css -->
<link href="lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css" >
<!-- ztree 的css -->
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
<!-- kindedit css -->
<link rel="stylesheet" href="/OneShopManager/themes/default/default.css" />
<link rel="stylesheet" href="/OneShopManager/plugins/code/prettify.css" />

<script charset="utf-8" src="/OneShopManager/js/jquery-3.3.1.min.js"></script>
<script charset="utf-8" src="/OneShopManager/js/kindeditor-all.js"></script>
<script charset="utf-8" src="/OneShopManager/lang/zh-CN.js"></script>
<script charset="utf-8" src="/OneShopManager/plugins/code/prettify.js"></script>
<!-- ztree -->
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="js/jquery.ztree.exedit.js"></script>
<style>
#groupDiv .input-text{
width:200px;

}
#groupDiv .row.cl{
margin-left:10px;
}
</style>
</head>
<body>

<!--sku模板,用于克隆,生成自定义sku-->
<div id="skuCloneModel" style="display: none;">
	<div class="clear"></div>
	<ul class="SKU_TYPE">
		<li is_required='0' propid='' sku-type-name="">
			<a href="javascript:void(0);" class="delCusSkuType">移除</a>
			<input type="text" class="cusSkuTypeInput" />：
		</li>
	</ul>
	<ul>
		<li>
			<input type="checkbox" class="model_sku_val" propvalid='' value="" />
			<input type="text" class="cusSkuValInput" />
		</li>
		<button class="cloneSkuVal">添加自定义属性值</button>
	</ul>
	<div class="clear"></div>
</div>
<!--单个sku值克隆模板-->
<li style="display: none;" id="onlySkuValCloneModel">
	<input type="checkbox" class="model_sku_val" propvalid='' value="" />
	<input type="text" class="cusSkuValInput" />
	<a href="javascript:void(0);" class="delCusSkuVal">删除</a>
</li>
<div class="clear"></div>
<div class="page-container">
	<form  action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" name="goodName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">简略标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  name="goodNameSimple">
			</div>
		</div>
		<div class="row cl" id="cateDiv">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
			<div class="formControls col-xs-8 col-sm-9" style="position:relative;" id="selectId"> 
				<input type="text" class="input-text" value="" placeholder="" id="cateName" name="cateName">
				<input type="hidden" class="input-text" value="" placeholder="" id="cateId" name="goodCateId">
				<ul id="treeDemo" class="ztree" style="position:absolute;z-index:18;background:#ffffff;display:none;"></ul>
			</div>
		</div>
		<div class="row cl" id="attrDiv" style="display:none;">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品属性：</label>
			<div class="formControls col-xs-8 col-sm-9"  > 
				<div id="groupDiv">
						
 				</div>
			</div>
		</div>
		<div class="row cl" id="attrDiv2" style="display:none;">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品规格：</label>
			<div class="formControls col-xs-8 col-sm-9"  > 
				<div id="groupDiv2" >
						
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">是否热门：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="check-box">
					<input type="checkbox" id="checkbox-1" name="isSail" value="1">
					<label for="checkbox-1">&nbsp;</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">允许评论：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="check-box">
					<input type="checkbox" id="checkbox-1" name="isComment" value="0">
					<label for="checkbox-1">&nbsp;</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">销售开始时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="goodSailTime" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:180px;">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">销售结束时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="goodSailEndTime" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'datemin\')}' })" id="datemax" class="input-text Wdate" style="width:180px;">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品关键字：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="goodMainWords"  placeholder="多个关键字用英文逗号隔开，限10个关键字" value="" class="input-text">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品摘要：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="goodSimpleDesc"  class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品主图：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<div id="fileList" class="portfolio-area" style="margin:10px;">
						<a href="images/add.jpg" id="mainData" data-lightbox="gallery" data-title=""><img id="mainPid" src="images/add.jpg" style="width:100px;height:100px;"></a>
						<input type="hidden" id="goodMainImg" name="goodMainImg"/>
					</div>
				</div>
					
					<button id="image3" type="button" class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品缩略图：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<div id="fileList1" class="portfolio-area" style="margin:10px;">
						<a href="images/add.jpg" id="mainData1" data-lightbox="gallery" data-title=""><img id="mainPid1" src="images/add.jpg" style="width:100px;height:100px;"></a>
						<a href="images/add.jpg" id="mainData2" data-lightbox="gallery" data-title=""><img id="mainPid2" src="images/add.jpg" style="width:100px;height:100px;"></a>
						<a href="images/add.jpg" id="mainData3" data-lightbox="gallery" data-title=""><img id="mainPid3" src="images/add.jpg" style="width:100px;height:100px;"></a>
						<a href="images/add.jpg" id="mainData4" data-lightbox="gallery" data-title=""><img id="mainPid4" src="images/add.jpg" style="width:100px;height:100px;"></a>
						<a href="images/add.jpg" id="mainData5" data-lightbox="gallery" data-title=""><img id="mainPid5" src="images/add.jpg" style="width:100px;height:100px;"></a>
						<a href="images/add.jpg" id="mainData6" data-lightbox="gallery" data-title=""><img id="mainPid6" src="images/add.jpg" style="width:100px;height:100px;"></a>
					</div>
					<input type="hidden" id="goodSimpleImgs" name="goodSimpleImgs"/>
				</div>
					<button id="image4" type="button" class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品详情：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="content1" name="goodDetail" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button id="subBtn" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
		<input type="hidden" name="attr1" id="attr1"/>
		<input type="hidden" name="attr2" id="attr2"/>
		<input type="hidden" name="skus" id="skus"/>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<!-- 灯箱Js -->
<script type="text/javascript" src="lib/lightbox2/2.8.1/js/lightbox.min.js"></script> 
<script type="text/javascript" src="js/createSkuTable.js"></script>
<script type="text/javascript" src="js/customSku.js"></script>
<script type="text/javascript" src="js/getSetSkuVals.js"></script>
<script type="text/javascript">
var zTreeObj;
$(function(){
	$(".portfolio-area li").Huihover();
	   //ztree节点点击调用函数
	   function zTreeBeforeClick(treeId, treeNode, clickFlag) {
	   	    if(treeNode.isParent!=true){
	   	    	$("#treeDemo").hide();
		   	    $("#cateName").val(treeNode.cateName);	
		   	 	$("#cateId").val(treeNode.id);
		   	 	$("#groupDiv2").empty();
	   	 		$("#groupDiv").empty();
	   	 		$("#attrDiv").hide();
	   	 		$("#attrDiv2").hide();
	   	 		var str2="";
		   	 	var groupStr = treeNode.attrTemplate;
		   	 	//判断一下是否有模板
		   	 	if(groupStr!=undefined&&groupStr!=""){
		   	 	//转换json格式的字符串为json对象
			   	 	var groupJson = JSON.parse(groupStr);
			   	 	//属性domstr;
			   	 	var str="";
			   	 	
			   	 	var flag=false;
			   	 	var flag2 = false;
			   	 	$.each(groupJson,function(index0,group){
			   	 		str+='<div style="border:1px solid red;width:700px;margin-bottom:10px;" tid="0">';
				   	    str+='<div class="row cl" firstid="groupAttrDiv">';
				   	    str+='<label class="groupName">'+group.groupName+'</label>';
						var attrNameVals = group.attrNameVals;
						$.each(attrNameVals,function(index1,attrNameVal){
							if(attrNameVal.attrType==0){
								flag=true;
								str+='<div style="margin-top:5px;" aid="0" thirdid="attrNameValDiv">';
								str+='<label>'+attrNameVal.attrName+'</label>:';
								str+='<div style="display:inline-block;" forthid="attrNameDiv" attrid="'+attrNameVal.attrShowType+'">';
								var attrVals = attrNameVal.attrVals;
								if(attrNameVal.attrShowType==0){
									str+='<select name="name'+index1+'">';
									$.each(attrVals,function(index2,attrVal){
										str+='<option>'+attrVal+'</option>';
									});
									str+='</select>';
								}else if(attrNameVal.attrShowType==1){
									$.each(attrVals,function(index2,attrVal){
										str+='&nbsp;'+attrVal+'<input name="name'+index1+'" type="radio" value="'+attrVal+'"/>';
									});
								}else if(attrNameVal.attrShowType==2){
									$.each(attrVals,function(index2,attrVal){
										str+='&nbsp;'+attrVal+'<input name="name'+index1+'" type="checkbox" value="'+attrVal+'"/>';
									});
								}
									
								str+='</div>';
								str+='</div>';
							}else{
								flag2=true;
								str2+='<ul class="SKU_TYPE">';
								str2+='<li is_required="0"  sku-type-name="'+attrNameVal.attrName+'">'+attrNameVal.attrName+'：</li>';
								str2+='</ul>';
								str2+='<ul>';
								var attrVals = attrNameVal.attrVals;
								$.each(attrVals,function(index2,attrVal){
									str2+='<li><label><input type="checkbox" class="sku_value"  value="'+attrVal+'" />'+attrVal+'</label></li>';
								});
								str2+='</ul>';
								str2+='<div class="clear"></div>';
							}
						});
						str+='</div>';
						str+='</div>';
			   	 	});
			   	 	
			   	 	if(flag){
						$("#groupDiv").append(str);
				   		$("#attrDiv").show();
			   	 	}
		   	 	}
		   	 	str2+='<button class="cloneSku" type="button">添加自定义sku属性</button>';
		   		str2+='<div class="clear"></div>';
		   	 	str2+='<div id="skuTable"></div>';
		   	 	$("#groupDiv2").append(str2);
		   		$("#attrDiv2").show();
			   
		   	 	return false;
	   	    }else{
	   	    	
	   	    }
	   	   
	   	   
		};
	   //设置ztree的相关属性	
	   var setting = {
			callback:{
				beforeClick:zTreeBeforeClick,
			},
			data: {
				key: {
					name: "cateName",
					url:"url1"
				}
			}
	   };
	   
	   
	   //通过ajax获取ztree数据，并且初始化ztree
	   var zNodes = null;
	   $.ajax({
			url:"/OneShopManager/good_cates",
			dataType:"json",
			data:$("#form").serialize(),
			type:"POST",
			success:function(result){
				 zNodes=result;
				 zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
			}
		});
	   	//点击cateName文本框显示树		
		  $("#cateName").click(function(){
			  $("#treeDemo").show();
		  });
	   	//当鼠标一开selectId区域。ztree隐藏
		 $("#selectId").mouseleave(function(){
			 $("#treeDemo").hide(); 
		 });
	   	
	 //设置kindeditor相关属性 ，显示富文本框	
	 var editor1;
	 KindEditor.ready(function(K) {
		 editor1 = K.create('textarea[name="goodDetail"]', {
				basePath:'/OneShopManager/',
				cssPath : '/OneShopManager/plugins/code/prettify.css',
				uploadJson : '/OneShopManager/upload',
				allowFileManager : true,
				
			});
			prettyPrint();
		});
		
	 //设置kindeditor相关属性 ，单文件上传功能	
		KindEditor.ready(function(K) {
			var editor = K.editor({
				allowFileManager : true,
				basePath:'/OneShopManager/',
				cssPath : '/OneShopManager/plugins/code/prettify.css',
				uploadJson : '/OneShopManager/upload'
			});
			K('#image3').click(function() {
				editor.loadPlugin('image', function() {
					editor.plugin.imageDialog({
						showRemote : false,
						imageUrl : K('#url3').val(),
						clickFn : function(url, title, width, height, border, align) {
							$("#mainPid").attr("src",url);
							$("#mainData").attr("src",url);
							$("#mainData").attr("href",url);
							$("#goodMainImg").val(url);
							editor.hideDialog();
						}
					});
				});
			});
		});
		//设置kindeditor相关属性 ，多文件上传功能	
		 KindEditor.ready(function(K) {
			var editor2 = K.editor({
				allowFileManager : true,
				basePath:'/OneShopManager/',
				imageUploadLimit:6,
				basePath:'/OneShopManager/',
				pluginsPath:'/OneShopManager/plugins/',
				uploadJson : '/OneShopManager/upload'
			});
			
			K('#image4').click(function() {
				editor2.loadPlugin('multiimage', function() {
					editor2.plugin.multiImageDialog({
						clickFn : function(urlList) {
							var imgs ="";
							for(var i=0;i<urlList.length;i++){
								imgs+=urlList[i]["url"]+",";
								$("#mainPid"+(i+1)).attr("src",urlList[i]["url"]);
								$("#mainData"+(i+1)).attr("src",urlList[i]["url"]);
								$("#mainData"+(i+1)).attr("href",urlList[i]["url"]);
							}
							$("#goodSimpleImgs").val(imgs);
							editor2.hideDialog();
						}
					});
				});
			});
		});
		
		//上传相关信息到后台
		 $("#subBtn").click(function(){
			 	//同步富文本框的值到textarea中
				editor1.sync();
			 	
			 	var cateId = $("#cateId").val();
			 	if(cateId==""){
			 		alert("请选择商品分类");
			 		return;
			 	}
			 	var groupAttrVals = [];
			 	$("#groupDiv div[tid='0']").each(function(index0,e0){
			 		var groupAttrDiv = $(this).children("div[firstid='groupAttrDiv']");
			 		var groupName = groupAttrDiv.children("label").text();
			 		var attrNameVals = [];
			 		var attrNameValDiv = groupAttrDiv.children("div[thirdid='attrNameValDiv']");
			 		attrNameValDiv.each(function(index1,attrNameVal){
			 			var attrName =$(attrNameVal).children("label").text();
			 			var forthid=$(this).children("div[forthid='attrNameDiv']").attr("attrid");
			 			var attrNameDiv =$(this).children("div[forthid='attrNameDiv']");
			 			var valsArray = [];
			 			if(forthid==0){
			 				valsArray.push(attrNameDiv.find("select").val())
			 			}else if(forthid==1){
			 				valsArray.push(attrNameDiv.find("input[type='radio']:checked").val())
			 			}else if(forthid==2){
			 				var vals =attrNameDiv.find("input[type='checkbox']:checked");
			 				vals.each(function(){
			 					valsArray.push($(this).val());
			 				});
			 			}
			 			attrNameVals.push({
			 				"attrName":attrName,
			 				"attrVals":valsArray
			 			});
			 		});
			 		groupAttrVals.push({
			 			"groupName":groupName,
			 			"attrNameVals":attrNameVals
			 		});
			 	});
			 	
			 	var attrsStr = JSON.stringify(groupAttrVals);
			 	var attrNamesVals = [];
			 	$("div[id='groupDiv2'] .SKU_TYPE").each(function(index,e){
			 		var attrName = $(this).children().first().attr("sku-type-name");
			 		var attrValsEle  = $(this).next().find("input[type='checkbox']:checked");
			 		var attrVals = [];
			 		attrValsEle.each(function(index,attrVal){
			 			attrVals.push($(attrVal).val());
			 		});
			 		var temp = {};
			 		temp.attrName=attrName;
			 		temp.attrVals = attrVals;
			 		if(attrVals.length>0){
			 			attrNamesVals.push(temp);
			 		}
			 		
			 	});
			 	var attrsStr2 = JSON.stringify(attrNamesVals);
			 	var skuArray = [];
			 	$("#skuTable tr[class='sku_table_tr']").each(function(){
			 		var sku = $(this).attr("propvalnames");
			 		var sku_price = $(this).find("input[class='setting_sku_price']").val();
			 		var sku_stock = $(this).find("input[class='setting_sku_stock']").val();
			 		skuArray.push({
			 			"sku":sku,
			 			"sku_price":sku_price,
			 			"sku_stock":sku_stock
			 		});
			 	});
			 	var attrsStr3 = JSON.stringify(skuArray);
			 	$("#attr1").val(attrsStr);
			 	$("#attr2").val(attrsStr2);
			 	$("#skus").val(attrsStr3);
				 $.ajax({
					url:"/OneShopManager/add_good",
					dataType:"json",
					type:"post",
					data:$("#form-article-add").serialize(),
					success:function(result){
						var flag = result.flag;
						alert(result.msg);
					}
				}); 
				
			})	
	
});
</script>
</body>
</html>