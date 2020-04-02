<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!-- sku插件的css -->
<link rel="stylesheet" href="lib/sku/css/sku_style.css" />
<!-- 这个是ztree的css -->
<link rel="stylesheet" href="lib/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">	
<!-- 这个是kindeditor的css -->
<link rel="stylesheet" href="lib/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="lib/kindeditor/plugins/code/prettify.css" />


</head>
<body>
<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<input type="hidden" name="attr1" id="attr1"/>
		<input type="hidden" name="attr2" id="attr2"/>
		<input type="hidden" name="skuStr" id="skuStr"/>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="" name="good_name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">简略标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="" name="good_name_simple">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商品分类：</label>
			<div class="formControls col-xs-8 col-sm-9" id="selectId">
				<input type="text" class="input-text" id="cateName" >
				<input type="hidden" class="input-text"  id="cateId" name="good_category_id">
				<ul id="treeDemo" class="ztree"></ul>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商品属性：</label>
			<div class="formControls col-xs-8 col-sm-9" style="width:700px;margin-left:17px;padding:0px;" id="groupDiv">
					
					
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商品规格：</label>
			<div class="formControls col-xs-8 col-sm-9" >
					<div id="skuDiv">
						
						
					</div>
					
					
								
					<button class="cloneSku" type="button">添加自定义sku属性</button>
					
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
							<button class="cloneSkuVal" type="button">添加自定义属性值</button>
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
					<div id="skuTable"></div>
					
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">是否热门：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="check-box">
					<input type="checkbox" id="checkbox-1" name="is_sail" value="1">
					<label for="checkbox-1">&nbsp;</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">允许评论：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="check-box">
					<input type="checkbox" id="checkbox-1" name="is_comment" value="1">
					<label for="checkbox-1">&nbsp;</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">销售开始时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="good_sail_time" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:180px;">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">销售结束时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="good_sail_end_time" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'datemin\')}' })" id="datemax" class="input-text Wdate" style="width:180px;">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品关键字：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="good_main_words" id="" placeholder="多个关键字用英文逗号隔开，限10个关键字" value="" class="input-text">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品摘要：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="good_simple_desc" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
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
				<textarea id="goodDetail" name="good_detail" cols="100" rows="8" style="width:920px;height:200px;visibility:hidden;"></textarea>
				
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button  class="btn btn-primary radius" type="button" id="submitBtn"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
				<button  class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button>
				<button  class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<!-- 这个是kindeditor的js -->
<script charset="utf-8" src="lib/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="lib/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="lib/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<!-- ztree的js -->
<script type="text/javascript" src="lib/zTree_v3/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="lib/zTree_v3/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="lib/zTree_v3/js/jquery.ztree.exedit.js"></script>
<!-- sku的js -->
<script type="text/javascript" src="lib/sku/js/createSkuTable.js"></script>
<script type="text/javascript" src="lib/sku/js/customSku.js"></script>
<script type="text/javascript">
//直接访问该页面，kindeditor效果出现不了，KindEditor的执行顺序优先于jquery
var editor1;

$(function(){
	$("#submitBtn").click(function(){
		
		//获取分组属性，会返回多组
		var groupNameDivs = $("#groupDiv div[tid='0']");
		var groupAttrVals =[]; 
		$.each(groupNameDivs,function(index0,obj0){
			var groupAttrDiv= $(this).find("div[firstid='groupAttrDiv']");
			var groupNameDiv =groupAttrDiv.find("label[class='groupName']");
		    //获取到了分组名称
		    var groupName = groupNameDiv.text();
		   	//获取属性值的div容器，返回一个数组
		    var attrNameValsDiv = groupAttrDiv.find("div[thirdid='attrNameValDiv']");
		   	var groupAttrNameVals=[];
		   	$.each(attrNameValsDiv,function(index1,obj1){
		   		var attrName = $(this).find("label").text();
		   		
		   		var attrNameValDiv  = $(obj1).find("div[forthid='attrNameDiv']") ;
		   		var attrShowType =attrNameValDiv.attr("attrid");
		   		var attrNameVals=[];
		   		if(attrShowType==0){
		   			//下拉框
		   			var attrVal = attrNameValDiv.find("select").val();
		   			attrNameVals.push(attrVal);
		   		}else if(attrShowType==1){
		   			//单选
		   			var attrVal = attrNameValDiv.find("input[type='radio']").val();
		   			attrNameVals.push(attrVal);
		   		}else if(attrShowType==2){
		   			//多选
		   			var attrVals  = attrNameValDiv.find("input[type='checkbox']:checked");
		   			$.each(attrVals,function(index2,obj2){
		   				attrNameVals.push($(obj2).val());
		   			})
		   		}
		   		groupAttrNameVals.push({
		   			"attrName":attrName,
		   			"attrVals":attrNameVals,
		   			"attrShowType":attrShowType
		   		});
		   		
		   	});
		   	
			groupAttrVals.push({
		   		"groupName":groupName,
		   		"attrNameVals":groupAttrNameVals
		   	})
		});
		var tempStr = JSON.stringify(groupAttrVals);
		$("#attr1").val(tempStr);
		
		//获取规格商品信息
		var skuTrs =$("#skuTable").find("tr[class='sku_table_tr']");
		var skus=[];
		$.each(skuTrs,function(index,obj){
			var sku  = $(obj).attr("propvalnames");
			var skuStock = $(obj).find("input[class='setting_sku_stock']").val();
			var skuPrice  =$(obj).find("input[class='setting_sku_price']").val();
			skus.push({
				"sku":sku,
				"stock":skuStock,
				"price":skuPrice
			});
		});
		var skusStr = JSON.stringify(skus);
		$("#skuStr").val(skusStr);
		//同步富文本框的值到textarea中
		editor1.sync();
		$.ajax({
			url:"/hxosm/add_good",
			dataType:"json",
			type:"post",
			data:$("#form-article-add").serialize(),
			success:function(data){
				if(data.flag){
					alert("添加成功");
				}
			}
		});
	});
	
	//以下代码时ztree代码
	function zTreeBeforeClick(treeId, treeNode, clickFlag){
		$("#groupDiv").html("");
		if(!treeNode.isParent){
			$("#treeDemo").hide();
		  	$("#cateName").val(treeNode.cateName);	
			$("#cateId").val(treeNode.id);
			var cateTemplate = treeNode.attrTemplate;
			//转换为js对象
			var jsObjs = JSON.parse(cateTemplate);
			var tempStr = "";
			var tempStr2 = "";
			$.each(jsObjs,function(index0,obj0){
				tempStr+='<div tid="0" style="width:100%;margin-top:10px;border:1px solid red;padding:18px;">';
					tempStr+='<div class="row cl" firstid="groupAttrDiv">';
						tempStr+='<label class="groupName">'+obj0.groupName+'</label>';
						var attrNameVals = obj0.attrNameVals;
						 
						$.each(attrNameVals,function(index1,obj1){
							if(obj1.attrType==0){
								tempStr+='<div style="margin-top:5px;" aid="0" thirdid="attrNameValDiv">';
									tempStr+='<label>'+obj1.attrName+'</label>';
									tempStr+='<div style="display:inline-block;" forthid="attrNameDiv" attrid="'+obj1.attrShowType+'">';
										if(obj1.attrShowType==1){
											//单选
											var attrVals =obj1.attrVals;
											$.each(attrVals,function(index2,obj2){
													tempStr+='&nbsp;&nbsp;'+obj2+'&nbsp;&nbsp;<input type="radio" name="name1" value="'+obj2+'">';
											});
											
										}else if(obj1.attrShowType==2){
											//多选
											var attrVals =obj1.attrVals;
											$.each(attrVals,function(index2,obj2){
												tempStr+='&nbsp;&nbsp;'+obj2+'&nbsp;&nbsp;<input type="checkbox" name="name2" value="'+obj2+'">';
											});
										}else if(obj1.attrShowType==0){
											//下拉框
											tempStr+='<select name="name0">';
												var attrVals =obj1.attrVals;
												$.each(attrVals,function(index2,obj2){
													tempStr+='<option>'+obj2+'</option>';
												});
											tempStr+='</select>';
										}
									tempStr+='</div>';
								tempStr+='</div>';
							}else{
								var attrName = obj1.attrName;
								tempStr2+='<ul class="SKU_TYPE">';
									tempStr2+='<li is_required="1" propid="1" sku-type-name="'+attrName+'"><em>*</em>'+attrName+'</li>';
								tempStr2+='</ul>';
								tempStr2+='<ul>';
								
								//多选
								var attrVals =obj1.attrVals;
								$.each(attrVals,function(index2,obj2){
									tempStr2+='<li style="line-height: 30px;float:left"><label><input type="checkbox"  class="sku_value" propvalid="" value="'+obj2+'" />'+obj2+'</label></li>';
								});
								
								tempStr2+='</ul>'
								tempStr2+='<div class="clear"></div>'
							}
							
							
						})
					tempStr+='</div>';
				tempStr+='</div>';
				
			});
			
			
			$("#groupDiv").html(tempStr);
			$("#skuDiv").append(tempStr2);
		
		}
	}

	$("#skuDiv").on("change","input[type='checkbox']",function(){
		getAttr2();
	});
	function getAttr2(){
		var skuDivs =$("#skuDiv").find("ul[class='SKU_TYPE']");
		var goodAttrs2=[];
		$.each(skuDivs,function(index,obj){
			var skuAttrName  = $(obj).text();
			var brother  = $(obj).next();
			var childs = brother.find("input[type='checkbox']:checked");
			var attrVals=[];
			$.each(childs,function(index1,obj1){
				attrVals.push($(obj1).val());
			});
			if(attrVals.length>0){
				goodAttrs2.push({
					"attrName":skuAttrName,
					"attrVals":attrVals
				});
			}
		});
		$("#attr2").val(JSON.stringify(goodAttrs2));
	}
	var setting = {
		callback:{
			beforeClick:zTreeBeforeClick
		},
		data: {
			key: {
				name: "cateName",
				children:"childCates",
				url:"url1"
			}
		}
	};
	
	 /* 给添加分组按钮绑定事件 */
	   $("#cateName").click(function(){
		   // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
		   $.ajax({
					type: 'POST',
					url: 'good_cates',
					dataType: 'json',
					success: function(data){
						
						  zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
						  $("#treeDemo").show();
					},
					error:function(data) {
						console.log(data.msg);
					},
		   });
	   });
	   /* ztree消失事件 */
	   $("#selectId").mouseleave(function() {
		   $("#treeDemo").hide();
	   });
	
	
});

KindEditor.ready(function(K) {
	 editor1 = K.create('textarea[name="good_detail"]', {
			basePath:'/hxosm/lib/kindeditor/',
			cssPath : '/hxosm/lib/kindeditor/plugins/code/prettify.css',
			uploadJson:'/hxosm/upload_file',
			
			
		});
		prettyPrint();
});

$("#image3").click(function(){
	editor1.loadPlugin('image', function() {
		editor1.plugin.imageDialog({
			showRemote : false,
			clickFn : function(url, title, width, height, border, align) {
				$("#mainPid").attr("src",url);
				$("#mainData").attr("href",url);
				$("#goodMainImg").val(url);
				editor1.hideDialog();
			}
		});
	});
});
$("#image4").click(function(){
	editor1.loadPlugin('multiimage', function() {
		editor1.plugin.multiImageDialog({
			showRemote : false,
			imageUploadLimit:6,
			clickFn : function(urlList) {
				var tempStr ="";
				var tempStr2="";
				
				$.each(urlList,function(index,obj){
					
					
					tempStr+='<a href="'+obj.url+'" id="mainData1" data-lightbox="gallery" data-title="">';
					tempStr+='<img id="mainPid1" src="'+obj.url+'" style="width:100px;height:100px;">';
					tempStr+='</a>';
					tempStr2+=obj.url+",";
				});
				tempStr2=tempStr2.substring(0,tempStr2.length-1);
				$("#goodSimpleImgs").val(tempStr2);
				$("#fileList1").html(tempStr);
				editor1.hideDialog();
			}
		});
	});
	
	
	
});



</script>


	




</body>
</html>