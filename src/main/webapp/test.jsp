<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>BOS管理系统 首页</title>
<link href="favicon.ico" rel="icon" type="image/x-icon" />
<!-- 导入jquery核心类库 -->
<script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="./js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="./js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="./css/default.css">
<script type="text/javascript" src="./js/easyui/jquery.easyui.min.js"></script>
<!-- 导入ztree类库 -->
<link rel="stylesheet" href="./js/ztree/zTreeStyle.css" type="text/css" />
<script src="./js/ztree/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="./js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	//页面的onload函数，页面加载完成后，会执行里面的代码
	$(function() {
		//ZTREE树结构
		/* //基于标准json
		var setting = {};
		var nodes = [ {
			name : '系统管理'
		}, {
			name : '用户管理',
			children : [ {
				name : '增加用户'
			}, {
				name : '修改用户'
			}, {
				name : '删除用户'
			} ]
		}, {
			name : '权限管理'
		} ]; */
		//基于简单json
		var setting = {
			data : {
				simpleData : {
					enable : true
				}
			},
			callback : {
				onClick : function(event, treeId, treeNode) {
					//动态添加选项卡操作
					//判断是否是跟节点，是非根节点才能添加选项卡
					var page = treeNode.page;
					if (undefined != page) {
						//有page属性，是子节点
						//重复的选项卡只能添加一次
						//判断选项卡中是否存在当前添加的选项卡
						var e = $("#tt").tabs("exists", treeNode.name);
						alert(treeNode.page);
						if (e) {
							//已经存在了，选中这个选项卡面板
							$("#tt").tabs("select", treeNode.name);
						} else {
							//动态添加一个选项卡面板
							$("#tt")
									.tabs(
											"add",
											{
												title : treeNode.name,
												closable : true,
												iconCls : 'icon-save',
												content : '<div style="width:100%;height:100%;overflow:hidden;">'
													+ '<iframe src="'
													+ treeNode.page
													+ '" scrolling="auto" style="width:100%;height:100%;border:0;" ></iframe></div>'
									//			content : '<iframe frameborder="0" width="100%" height="100%" src="http://www.baidu.com"></iframe>'
											});
						}
					}
				}
			}
		};
		var nodes = [ {
			id : '1',
			pId : '0',
			name : '系统管理'
		}, {
			id : '2',
			pId : '0',
			name : '用户管理'
		}, {
			id : '21',
			pId : '2',
			name : '用户删除'
		}, {
			id : '22',
			pId : '2',
			name : '用户修改'
		}, {
			id : '23',
			pId : '2',
			name : '用户添加'
		}, ];
		url = "${pageContext.request.contextPath}/data/menu.json"
		$.get(url, {}, function(data) {
			//初始化树
			console.log(data);
			$.fn.zTree.init($('#ztree1'), setting, data);
		}, 'json');

		//页面加载完成后需要为上面的按钮动态绑定单击事件
		$("#mybutton")
				.click(
						function() {
							//判断选项卡是否已经存在了
							var e = $("#tt").tabs("exists", "这是标题");
							alert(e)
							if (e) {
								//已经存在了，选中这个选项卡面板
								$("#tt").tabs("select", "这是标题");
							} else {
								//动态添加一个选项卡面板
								$("#tt")
										.tabs(
												"add",
												{
													title : '这是标题',
													closable : true,
													iconCls : 'icon-save',
													content : '<iframe frameborder="0" width="100%" height="100%" src="http://www.baidu.com"></iframe>'
												});
							}
						});
	});
</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',title:'North Title',split:true"
		style="height: 100px;"></div>
	<div data-options="region:'south',title:'South Title',split:true"
		style="height: 100px;"></div>
	<!-- <div
		data-options="region:'east',iconCls:'icon-reload',title:'East',split:true"
		style="width: 100px;"></div> -->
	<div data-options="region:'west',title:'系统管理',split:true"
		style="width: 200px;">
		<div class="easyui-accordion" fit="true" border="false">
			<div title="Title1" data-options="iconCls:'icon-mini-add'"
				style="overflow: auto">
				<h3 style="color: #0099FF;">Accordion for jQuery</h3>
				<p>Accordion is a part of easyui framework for jQuery. It lets
					you define your accordion component on web page more easily.</p>
			</div>
			<div title="Title2" data-options="iconCls:'icon-mini-add'"
				style="overflow: auto">
				<a id="mybutton" class="easyui-linkbutton">添加一个选项卡</a>


			</div>
			<div title="Title3" data-options="iconCls:'icon-mini-add'"
				style="overflow: auto">
				<ul id="ztree1" class="ztree"></ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center',title:'center title'"
		style="padding: 5px; background: #eee;">
		<div id="tt" class="easyui-tabs" fit="true">
			<!-- <div title="Tab1" style="padding: 20px; display: none;">tab1</div>
			<div title="Tab2" data-options="closable:true"
				style="overflow: auto; padding: 20px; display: none;">tab2</div>
			<div title="Tab3" data-options="iconCls:'icon-reload',closable:true"
				style="padding: 20px; display: none;">tab3</div> -->
		</div>
	</div>
</body>
</html>