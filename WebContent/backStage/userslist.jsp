﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>用户列表 - 用户管理 -</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">

<style type="text/css">
.table>tbody>tr>td {
	text-align: center;
}
</style>


</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl">
				<a class="logo navbar-logo f-l mr-10 hidden-xs"
					href="#">黄虫短租</a><span
					class="logo navbar-slogan f-l mr-10 hidden-xs"></span> <a
					aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
					href="javascript:;">&#xe667;</a>
			
				<nav id="Hui-userbar"
					class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li>超级管理员</li>
						<li class="dropDown dropDown_hover"><a href="#"
							class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
								<li><a href="#">切换账户</a></li>
								<li><a href="#">退出</a></li>
							</ul></li>
						<li id="Hui-msg"><a href="#" title="消息"><span
								class="badge badge-danger">1</span><i class="Hui-iconfont"
								style="font-size: 18px">&#xe68a;</i></a></li>
						<li id="Hui-skin" class="dropDown right dropDown_hover"><a
							href="javascript:;" class="dropDown_A" title="换肤"><i
								class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="default"
									title="默认（黑色）">默认（黑色）</a></li>
								<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
								<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!--/_header 作为公共模版分离出去-->

	<!--_menu 作为公共模版分离出去-->
	<aside class="Hui-aside">

		<div class="menu_dropdown bk_2">
			<dl id="menu-article">
				<dt>
					<i class="Hui-iconfont">&#xe616;</i> 订单管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="orderlist.jsp" title="订单管理">订单管理</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe613;</i> 民宿管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="homestay-list.jsp" title=" 民宿管理">民宿列表</a></li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-comments">
				<dt>
					<i class="Hui-iconfont">&#xe622;</i> 评论管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="commentlist.jsp" title="评论列表">评论列表</a></li>

					</ul>
				</dd>
			</dl>
			<dl id="menu-member">
				<dt class="selected">
					<i class="Hui-iconfont">&#xe60d;</i> 用户管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd style="display: block;">
					<ul>
						<li><a href="userslist.jsp" title="用户列表">用户列表</a></li>
					
					</ul>
				</dd>
			</dl>
			<dl id="menu-admin">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						
						<li><a href="adminlist.jsp" title="管理员列表">管理员列表</a></li>
					</ul>
				</dd>
			</dl>
	
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<!--/_menu 作为公共模版分离出去-->

	<section class="Hui-article-box">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			用户中心 <span class="c-gray en">&gt;</span> 用户列表<a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="Hui-article">

			<article class="cl pd-20">
				<div class="text-c">
					<!-- 是否自动检索：<input type="checkbox" id="autoSearch">  -->
					姓名：<input type="text" class="form-controlSearch input-text "
						placeholder="输入姓名" data-column="2" id="col2_filter"
						style="width: 100px;"> 昵称：<input type="text"
						class="form-controlSearch input-text " placeholder="输入昵称"
						data-column="3" id="col3_filter" style="width: 100px;">
					手机号：<input type="text" class="form-controlSearch input-text "
						placeholder="输入手机号" data-column="4" id="col4_filter"
						style="width: 100px;">


				</div>

				<div class="cl pd-5 bg-1 bk-gray mt-20">
					<span class="l"><a href="javascript:;" id="plsc"
						class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
							批量删除</a> <a href="javascript:;"
						onclick="member_add('添加用户','usersAdd.jsp','450','400')"
						class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
							添加用户</a></span> <span class="r">共有数据：<strong><span
							id="datarowcount"></span></strong> 条
					</span>
				</div>
				<div class="mt-20">
					<table id="example"
						class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">
								<th width="25"><input type="checkbox" id="employeeCheckAll"
									name="employeeCheckAll"></th>
								<th>用户编号</th>
								<th>用户名</th>
								<th>用户昵称</th>
								<th>手机号</th>
								<th>头像地址</th>
								<th>审核状态</th>
								<th style="display: none;">真实姓名</th>
								<th style="display: none;">身份证号码</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</article>
		</div>
	</section>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.page.js"></script>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
	<!--
		$(function() {
			/*单击数据行 被选中，再次单击取消选中*/
			$('.table-sort tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
		});
		/*用户-添加*/
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-查看*/
		function member_show(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-停用*/
		function member_stop(obj, id) {
			layer
					.confirm(
							'确认要停用吗？',
							function(index) {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-defaunt radius">已停用</span>');
								$(obj).remove();
								layer.msg('已停用!', {
									icon : 5,
									time : 1000
								});
							});
		}

		/*批量删除*/
		$("#plsc").click(function() {
			batchIds();
		});

		/*用户-启用*/
		function member_start(obj, id) {
			layer
					.confirm(
							'确认要启用吗？',
							function(index) {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-success radius">已启用</span>');
								$(obj).remove();
								layer.msg('已启用!', {
									icon : 6,
									time : 1000
								});
							});
		}
		/*用户-编辑*/
		function member_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*密码-修改*/
		function change_password(title, url, id, w, h) {
			//layer_show(title,url,w,h);	

			layer.open({
				type : 2,
				area : [ '600px', '270px' ],
				fix : false, //不固定
				maxmin : true,
				shade : 0.4,
				title : title,
				content : url,
				success : function(layero, index) {
					var body = layer.getChildFrame('body', index);//建立父子联系
					var iframeWin = window[layero.find('iframe')[0]['name']];
					// console.log(arr); //得到iframe页的body内容
					// console.log(body.find('input'));
					var inputList = body.find('input');
					for (var j = 0; j < inputList.length; j++) {
						$(inputList[j]).val(arr[j]);
					}
				}
			});
		}
		/*用户-删除*/
		function member_del(obj, id) {
			layer.confirm('确认要删除吗？', function() {
				$.ajax({
					type : 'POST',
					url : '../us.do?op=delUser&userId=' + id,
					dataType : 'json',
					success : function(data) {
						layer.msg('已删除!', {
							icon : 1,
							time : 1000
						});
						reload();
					},
					error : function(data) {
						layer.msg('删除失败!', {
							icon : 2,
							time : 1000
						});
					},
				});
			});

		}
		
		

		/*用户重置密码*/
			function resetPwd(obj, id) {
				layer.confirm('确认要重置密码吗？', function() {
					$.ajax({
						type : 'POST',
						url : '../us.do?op=resetPassword&userId=' + id,
						dataType : 'json',
						success : function(data) {
							layer.msg('重置密码成功!', {
								icon : 1,
								time : 1000
							});
							reload();
						},
						error : function(data) {
							layer.msg('重置失败!', {
								icon : 2,
								time : 1000
							});
						},
					});
				});

			}
	</script>

	<script>
		$(function() {
			//修改用户信息的超链接单击事件
			$(document).on(
					"click",
					'.usersedit',
					function() {
						var _this = $(this); //当前对象 编辑的超链接
						data = _this.parent().siblings(); //_this.parent() 得到td   siblings(); 当前行的其他td
						var arr = [];
						for (var i = 1; i < data.length; i++) { //1 从1开始 从姓名开始
							arr.push($(data[i]).text());//每一个td中的内容() 放到一个数组里
						}
						// console.log(arr);
						//change-password.html

						//打开新窗口 编辑窗口
						layer
								.open({
									type : 2,
									area : [ '400px', '510px' ], //窗口大小
									fix : false, //不固定
									maxmin : true,
									shade : 0.4,
									title : '编辑用户信息', //显示的标题
									content : 'usersUpdate.jsp', //很多种写法 其中之一直接写目标窗口(要弹出来窗口)
									success : function(layero, index) { //success可以不写
										var body = layer.getChildFrame('body',
												index);//建立父子联系
										var iframeWin = window[layero
												.find('iframe')[0]['name']];
										//img的元素
										var imgList = body.find('img');//找所有的img
										$(imgList[0]).attr("src", arr[4]);

										var inputList = body.find('input'); //找所有的input
										for (var j = 0; j < arr.length; j++) {
											$(inputList[j]).val(arr[j]); //arr[j] 数组中的值 赋值给  $(inputList[j])
										}
									}
								});

					});

			$(document).on(
					"click",
					'.userCheck',
					function() {
						var _this = $(this); //当前对象 编辑的超链接
						data = _this.parent().siblings(); //_this.parent() 得到td   siblings(); 当前行的其他td
						var arr = [];
						for (var i = 1; i < data.length; i++) { //1 从1开始 从姓名开始
							arr.push($(data[i]).text());//每一个td中的内容() 放到一个数组里
						}
						// console.log(arr);
						//change-password.html

						//打开新窗口 编辑窗口
						layer
								.open({
									type : 2,
									area : [ '400px', '300px' ], //窗口大小
									fix : false, //不固定
									maxmin : true,
									shade : 0.4,
									title : '编辑用户验证信息', //显示的标题
									content : 'usersCheck.html', //很多种写法 其中之一直接写目标窗口(要弹出来窗口)
									success : function(layero, index) { //success可以不写
										var body = layer.getChildFrame('body',
												index);//建立父子联系
										var iframeWin = window[layero
												.find('iframe')[0]['name']];
										var inputList = body.find('input'); //找所有的input
										$(inputList[0]).val(arr[5]);
										$(inputList[1]).val(arr[6]);

										var selectList = body.find('select'); //找所有的select

										$(selectList[0]).find(
												"option:contains("
														+ $(this).find("span")
																.text() + ")")
												.attr("selected", true);

									}
								});

					});

		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->


	<script src="plugin/datatables/jquery.dataTables.min.js"></script>

	<script>
		var users = {};

		users.property = {
			version : "v1.0",
			name : "users",
			tableId : "example",//显示数据的容器表格的id
			checkAllId : "employeeCheckAll",
			buttonId : "employeeButtonId",
			formId : "employeeForm",
			corporateFormId : "employeeForm",
			returnStatus : "SUCCESS",
			returnTitle : "操作成功",
			statusTitle : "请选择一条数据！",
			idFailure : "获取id失败",
			prompt : "提示",
			pleaseConfirm : "请确认！",
			wantToDelete : "您确定要删除吗?",
			sexMan : "男",
			sexWoman : "女",
			isTest : "是",
			noTest : "否",
			banned : "禁用",
			enable : "启用"
		};

		//初始化配置
		users.gridInit = {
			searching : true,
			lengthChange : true,
			paging : true,
			scrollCollapse : true,
			serverSide : false,
			search : true,
			processing : true,
			scrollY : 500,
			scrollX : "100%",
			scrollXInner : "100%",
			scrollCollapse : true,
			jQueryUI : false,
			autoWidth : true,
			autoSearch : true
		};

		//路径配置,此处配置的路径是获取数据的重要手段;
		users.url = "/"; //  这里 / 表示的是localhost/
		users.requestUrl = {
			queryList : users.url + "HuangChongProject/us.do?op=queryAll" //数据是从servlet一侧返回的 json格式
		};

		users.search = {
			uuid : ""
		};

		users.status = [ {
			"searchable" : false,
			"orderable" : false,
			"targets" : 0
		},//第一行不进行排序和搜索
		{
			defaultContent : '',
			targets : [ '_all' ]
		} //所有列设置默认值为空字符串
		];
		//对应的返回数据格式

		users.filed = [
				{ //第一个列
					"data" : "extn",
					"createdCell" : function(nTd, sData, oData, iRow, iCol) {
						$(nTd)
								.html(
										"<input type='checkbox' name='checkList' value='" + oData.userId + "'>");
					}
				}, //这里是返回的json对象中的 属性值   {data : }
				{
					"data" : "userId"
				},
				{
					"data" : "userName"
				},
				{
					"data" : "nickName"
				},
				{
					"data" : "telNum"
				},
				{
					"data" : "imgUrl"
				},
				{
					"createdCell" : function(nTd, sData, oData, iRow, iCol) {
						if (oData.state == 1) {
							$(nTd)
									.html(
											'<a href="javascript:;" class="userCheck"><span class="label label-success radius">已审核</span></a>');
						} else if (oData.state == 2) {
							$(nTd)
									.html(
											'<a href="javascript:;" class="userCheck"><span class="label label-success radius">待审核</span></a>');
						} else {
							$(nTd)
									.html(
											'<a href="javascript:;"><span class="label label-success radius">未填写</span></a>');
						}
					}
				},

				{
					"createdCell" : function(nTd, sData, oData, iRow, iCol) {
						$(nTd).css("display", "none")
						$(nTd).html(oData.realName);
					}
				},
				{
					"createdCell" : function(nTd, sData, oData, iRow, iCol) {
						$(nTd).css("display", "none")
						$(nTd).html(oData.identityCard);
					}
				},
				{
					//创建操作那个列
					"data" : "extn",
					"createdCell" : function(nTd, sData, oData, iRow, iCol) {
						//表格最后一个列增加很多超链接 启用禁用。 编辑   删除 修改密码
						$(nTd)
								.html(
										' <a title="编辑" href="javascript:;" class="usersedit ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class=" ml-5"  href="javascript:;" onclick="resetPwd(this,'
												+ oData.userId
												+ ')" title="重置密码"><i class="Hui-iconfont">&#xe63f;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'
												+ oData.userId
												+ ')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>');
					}
				} ];

		//导航按钮操作
		users.buttons = '<button class="btn btn-default"  type="button" id="reload" data-toggle="modal" data-target="#employeeModal">刷新表格</button>'
				+ '<button class="btn btn-primary" type="button" id="batchIds" style="margin-left:20px;" data-toggle="modal" >多选</button>'
				+ '<button class="btn btn-success" type="button" id="selection" style="margin-left:20px;" data-toggle="modal" >单选</button>'
				+ '<button class="btn btn-success" type="button" id="search" style="margin-left:20px;" data-toggle="modal" >查询</button>'
				+ '<button class="btn btn-success" type="button" id="clearSearch" style="margin-left:20px;" data-toggle="modal" >重置</button>';
	</script>

	<script>
		var eloancn = {};

		eloancn.table = {
			grid : "",
			statusTitle : "请选择一条数据！"
		};

		//dataTables方法封装
		function dataTablesInit(elo) {

			eloancn.table.grid = $('#' + elo.property.tableId)
					.DataTable(
							{
								ajax : {
									url : elo.requestUrl.queryList,//请求后台路径
									type : 'get', //ajax的get	请求获取数据
									data : elo.search,
									dataType : 'json',//获取数据格式为json
									error : function(jqXHR, textStatus,
											errorMsg) {
										layer.msg("请求失败" + errorMsg, {
											icon : 1,
											time : 3000
										});
									}

								},
								"searching" : elo.gridInit.searching,//搜索框，默认是开启
								"lengthChange" : elo.gridInit.lengthChange,//是否允许用户改变表格每页显示的记录数，默认是开启
								"paging" : elo.gridInit.paging,//是否开启本地分页，默认是开启
								"processing" : elo.gridInit.processing,//是否显示中文提示
								"scrollCollapse" : elo.gridInit.scrollCollapse, //是否开启DataTables的高度自适应，当数据条数不够分页数据条数的时候，插件高度是否随数据条数而改变
								"serverSide" : elo.gridInit.serverSide, //开启服务器模式，默认是关闭
								"scrollY" : elo.gridInit.scrollY,//设置高
								"scrollX" : elo.gridInit.scrollX,//设置宽度
								"scrollXInner" : elo.gridInit.scrollXInner,//设置内宽度
								"scrollCollapse" : elo.gridInit.scrollCollapse,//设置折叠
								"jQueryUI" : elo.gridInit.jQueryUI,//jquery 风格
								"autoWidth" : elo.gridInit.autoWidth, //是否自适应宽度
								"columns" : elo.filed,//字段
								"columnDefs" : elo.status,//列表状态
								"language" : {
									"sProcessing" : "处理中...",
									"sLengthMenu" : "显示 _MENU_ 项结果",
									"sZeroRecords" : "没有匹配结果",
									"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
									"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
									"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
									"sInfoPostFix" : "",
									"sSearch" : "搜索:",
									"sUrl" : "",
									"sEmptyTable" : "未搜索到数据",
									"sLoadingRecords" : "载入中...",
									"sInfoThousands" : ",",
									"oPaginate" : {
										"sFirst" : "首页",
										"sPrevious" : "上页",
										"sNext" : "下页",
										"sLast" : "末页"
									},
									"oAria" : {
										"sSortAscending" : ": 以升序排列此列",
										"sSortDescending" : ": 以降序排列此列"
									}
								},
								"dom" : "<'row'<'col-sm-2'l><'#"+elo.property.buttonId+".col-sm-10'><'col-sm-6'f>r>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
								"initComplete" : function() {
									$("#" + elo.property.buttonId).append(
											elo.buttons);
									if (elo.gridInit.search) {
										$search = $("input[type='search']");
										//隐藏默认的搜索框
										$search.parent().hide();
									}
									//加载完成之后 初始化checkbox
									checkbox(elo.property.tableId);

									$("#reload").click(function() {
										reload();
									});

									$("#batchIds").click(function() {
										batchIds();
									});

									$("#selection").click(function() {
										selection();
									});
									$("#search").click(function() {
										search();
									});
									$("#clearSearch").click(function() {
										clearSearch("form-controlSearch");
									});

									//checkbox全选

									$("#" + elo.property.checkAllId)
											.click(
													function() {
														if ($(this).prop(
																"checked")) {
															$(
																	"input[name='checkList']")
																	.prop(
																			"checked",
																			true);
															$("tr").addClass(
																	'selected');
														} else {
															$(
																	"input[name='checkList']")
																	.prop(
																			"checked",
																			false);
															$("tr")
																	.removeClass(
																			'selected');
														}
													});

									//得到总记录数，显示在表格的右上角位置
									$("#datarowcount")
											.text(
													$(
															'#'
																	+ elo.property.tableId)
															.DataTable().page
															.info().recordsTotal);

								}
							});

			//错误信息提示
			$.fn.dataTable.ext.errMode = function(s, h, m) {
				if (h == 1) {
					layer.msg("连接服务器失败", {
						icon : 1,
						time : 3000
					});
				} else if (h == 7) {
					layer.msg("数据返回错误", {
						icon : 1,
						time : 3000
					});
				}
			};

			//回调，如果返回的时候有问题提示信息
			eloancn.table.grid.on('xhr.dt', function(e, settings, json, xhr) {
				if (typeof (json.code) != "undefined" && json.code != "0") {
					layer.msg(json.message, {
						icon : 1,
						time : 3000
					});
				}
			});

			//鼠标经过高亮
			var lastIdx = null;
			eloancn.table.grid
					.on('mouseover', 'td',
							function() {

								if (typeof (eloancn.table.grid.cell(this)
										.index()) != "undefined") {
									var colIdx = eloancn.table.grid.cell(this)
											.index().column;
									if (colIdx !== lastIdx) {
										$(eloancn.table.grid.cells().nodes())
												.removeClass('highlight');
										$(
												eloancn.table.grid.column(
														colIdx).nodes())
												.addClass('highlight');
									}
								}
							});

			eloancn.table.grid.on('mouseleave', function() {
				$(eloancn.table.grid.cells().nodes()).removeClass('highlight');
			});

			//自动搜索方法
			$('.form-controlSearch').on('keyup change', function() {
				// elo.gridInit.autoSearch = $("#autoSearch").prop("checked");
				if (elo.gridInit.autoSearch) {
					filterColumn($(this).attr('data-column'));
				}
			});
		}

		//选中一行 checkbox选中
		function checkbox(tableId) {
			//每次加载时都先清理
			$('#' + tableId + ' tbody').off("click", "tr");
			$('#' + tableId + ' tbody').on("click", "tr", function() {
				$(this).toggleClass('selected');
				if ($(this).hasClass("selected")) {
					$(this).find("input").prop("checked", true);
				} else {
					$(this).find("input").prop("checked", false);
				}
			});

		}

		//按钮搜索方法
		function search() {

			var oSettings = "";
			$("[data-column]").each(
					function() {
						var filedValue = $(this).attr('data-column');
						if (filedValue != "") {
							oSettings = eloancn.table.grid.column(filedValue)
									.search(
											$('#col' + filedValue + '_filter')
													.val());
						}
					});
			//搜索的数据一次条件，节省资源
			eloancn.table.grid.draw(oSettings);
		}

		//搜索
		function filterColumn(i) {

			eloancn.table.grid.column(i)
					.search($('#col' + i + '_filter').val()).draw();
		}

		//清理搜索数据
		function clearSearch(id) {

			$("." + id).each(function() {
				$(this).val("");
			});
			//清空查询条件重新读取数据
			eloancn.table.grid.columns().search("").draw();
		}

		//获取所有选中行的UUID
		function batchIds() {

			var uuid = '';
			var uuids = eloancn.table.grid.rows(".selected").data();
			if (uuids.length == 0) {
				layer.msg('请选择一条数据!', {
					icon : 1,
					time : 3000
				});
			} else {
				// 上面是自带的语句,大概意思就是判断有没有选数据,没有的话进行提示
				// 下面是选中数据后
				// 创建一个数组empId的数组进行存放选中行所对应要操作的empId
				var userId = new Array();
				// 循环往数组里添加数据
				for (var i = 0; i < uuids.length; i++) {
					userId.push(uuids[i]['userId']);
				}
				layer.confirm('确认要删除吗？', function() {
					//这里进行ajax
					$.ajax({
						type : 'POST',
						url : '../us.do?op=batchDel',
						// 传递数组
						data : {
							'userId' : userId
						},
						// 设置traditional: true后才能传到servlet里面去
						traditional : true,
						dataType : 'text',
						success : function(data) {
							layer.msg('删除成功!', {
								icon : 1,
								time : 1000
							});
							// 不管是否操作成功都进行页面刷新,重新加载数据
							reload();
						},
						error : function(data) {
							layer.msg('删除失败!', {
								icon : 2,
								time : 1000
							});
						},
					});

				});
			}
		}

		//单选
		function selection() {

			if (eloancn.table.grid.rows(".selected").data().length == 1) {
				var uuid = eloancn.table.grid.row(".selected").data().extn;

				if (uuid == "") {
					layer.msg(eloancn.table.statusTitle, {
						icon : 1,
						time : 3000
					});
				} else {
					layer.msg(uuid, {
						icon : 1,
						time : 3000
					});
				}

			} else {
				layer.msg(eloancn.table.statusTitle, {
					icon : 1,
					time : 3000
				});
			}
		}

		//刷新页面
		//重新加载数据
		function reload() {
			eloancn.table.grid.ajax.reload();
			//用jquery实现点击一次
			$("#employeeCheckAll").click();

		}

		//销毁table
		function destroyDataTable(tableId) {

			var dttable = $('#' + tableId).DataTable();
			dttable.destroy();
		}
	</script>

	<script>
		// 初始化数据
		$(document).ready(function() {
			dataTablesInit(users);
		});
	</script>


</body>
</html>