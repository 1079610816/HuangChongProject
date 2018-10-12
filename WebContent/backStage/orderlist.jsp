<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>订单列表 - 订单管理 - H-ui.admin v3.0</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl">
				<a class="logo navbar-logo f-l mr-10 hidden-xs"
					href="/aboutHui.shtml">H-ui.admin</a> <a
					class="logo navbar-logo-m f-l mr-10 visible-xs"
					href="/aboutHui.shtml">H-ui</a> <span
					class="logo navbar-slogan f-l mr-10 hidden-xs">v3.0</span> <a
					aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
					href="javascript:;">&#xe667;</a>
				<nav class="nav navbar-nav">
					<ul class="cl">
						<li class="dropDown dropDown_hover"><a href="javascript:;"
							class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i
								class="Hui-iconfont">&#xe6d5;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;"
									onclick="article_add('添加订单','article-add.html')"><i
										class="Hui-iconfont">&#xe616;</i> 订单</a></li>
								<li><a href="javascript:;"
									onclick="picture_add('添加订单','picture-add.html')"><i
										class="Hui-iconfont">&#xe613;</i> 图片</a></li>
								<li><a href="javascript:;"
									onclick="product_add('添加订单','product-add.html')"><i
										class="Hui-iconfont">&#xe620;</i> 产品</a></li>
								<li><a href="javascript:;"
									onclick="member_add('添加用户','member-add.html','','510')"><i
										class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
							</ul></li>
					</ul>
				</nav>
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
						<li id="Hui-msg"><a href="#" title="消息"> <span
								class="badge badge-danger">1</span> <i class="Hui-iconfont"
								style="font-size: 18px">&#xe68a;</i></a></li>
						<li id="Hui-skin" class="dropDown right dropDown_hover"><a
							href="javascript:;" class="dropDown_A" title="换肤"><i
								class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="default"
									title="默认（黑色）">默认（黑色）</a></li>
								<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
								</li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a>
								</li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a>
								</li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
								</li>
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
				<dt class="selected">
					<i class="Hui-iconfont">&#xe616;</i> 订单管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd style="display: block">
					<ul>
						<li class="current"><a href="article-list.html" title="订单管理">订单管理</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe613;</i> 图片管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="picture-list.html" title="图片管理">图片管理</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-product">
				<dt>
					<i class="Hui-iconfont">&#xe620;</i> 产品管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="product-brand.html" title="品牌管理">品牌管理</a></li>
						<li><a href="product-category.html" title="分类管理">分类管理</a></li>
						<li><a href="product-list.html" title="产品管理">产品管理</a></li>
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
						<li><a href="http://h-ui.duoshuo.com/admin/" title="评论列表">评论列表</a>
						</li>
						<li><a href="feedback-list.html" title="意见反馈">意见反馈</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-member">
				<dt>
					<i class="Hui-iconfont">&#xe60d;</i> 会员管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="member-list.html" title="会员列表">会员列表</a></li>
						<li><a href="member-del.html" title="删除的会员">删除的会员</a></li>
						<li><a href="member-level.html" title="等级管理">等级管理</a></li>
						<li><a href="member-scoreoperation.html" title="积分管理">积分管理</a>
						</li>
						<li><a href="member-record-browse.html" title="浏览记录">浏览记录</a>
						</li>
						<li><a href="member-record-download.html" title="下载记录">下载记录</a>
						</li>
						<li><a href="member-record-share.html" title="分享记录">分享记录</a>
						</li>
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
						<li><a href="admin-role.html" title="角色管理">角色管理</a></li>
						<li><a href="admin-permission.html" title="权限管理">权限管理</a></li>
						<li><a href="admin-list.html" title="管理员列表">管理员列表</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-tongji">
				<dt>
					<i class="Hui-iconfont">&#xe61a;</i> 系统统计<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="charts-1.html" title="折线图">折线图</a></li>
						<li><a href="charts-2.html" title="时间轴折线图">时间轴折线图</a></li>
						<li><a href="charts-3.html" title="区域图">区域图</a></li>
						<li><a href="charts-4.html" title="柱状图">柱状图</a></li>
						<li><a href="charts-5.html" title="饼状图">饼状图</a></li>
						<li><a href="charts-6.html" title="3D柱状图">3D柱状图</a></li>
						<li><a href="charts-7.html" title="3D饼状图">3D饼状图</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-system">
				<dt>
					<i class="Hui-iconfont">&#xe62e;</i> 系统管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a href="system-base.html" title="系统设置">系统设置</a></li>
						<li><a href="system-category.html" title="栏目管理">栏目管理</a></li>
						<li><a href="system-data.html" title="数据字典">数据字典</a></li>
						<li><a href="system-shielding.html" title="屏蔽词">屏蔽词</a></li>
						<li><a href="system-log.html" title="系统日志">系统日志</a></li>
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
			订单管理 <span class="c-gray en">&gt;</span> 订单列表 <a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
				<div class="text-c">
					是否自动检索：<input type="checkbox" id="autoSearch"> 姓名：<input
						type="text" class="form-controlSearch input-text "
						placeholder="输入姓名" data-column="2" id="col2_filter"
						style="width: 100px;"> 岗位：<input type="text"
						class="form-controlSearch input-text " placeholder="输入岗位"
						data-column="3" id="col3_filter" style="width: 100px;">
					入职时间：<input type="text" class="form-controlSearch input-text Wdate"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						placeholder="输入入职时间" data-column="4" id="col4_filter"
						style="width: 100px;">

				</div>
				<div class="text-c">
					入职时间范围： <input type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						id="datemin" class="input-text Wdate" style="width: 120px;">
					- <input type="text"
						onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
						id="datemax" class="input-text Wdate" style="width: 120px;">
					<input type="text" class="input-text" style="width: 250px"
						placeholder="输入员工姓名、岗位、部门" id="" name="">
					<button type="submit" class="btn btn-success radius" id="" name="">
						<i class="Hui-iconfont">&#xe665;</i> 搜用户
					</button>
				</div>
				<div class="cl pd-5 bg-1 bk-gray mt-20">
					<span class="l"> <a href="javascript:;" onclick="datadel()"
						class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
							批量删除</a> <a class="btn btn-primary radius" data-title="添加订单"
						_href="article-add.html"
						onclick="article_add('添加订单','article-add.html')"
						href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加订单</a>
					</span> <span class="r">共有数据：<strong>54</strong> 条
					</span>
				</div>
				<div class="mt-20">
					<table
						class="table table-border table-bordered table-bg table-hover table-sort"
						id="orderlist" name="orderlist">
						<thead>
							<tr class="text-c">
								<th width="25"><input type="checkbox" name="" value=""></th>
								<th width="80">订单编号</th>
								<th width="120">入住时间</th>
								<th width="120">退房时间</th>
								<th width="80">费用</th>
								<th width="80">订单状态</th>
								<th width="75">民宿编号</th>
								<th width="60">用户编号</th>
								<th width="120">操作</th>
							</tr>
						</thead>
						<tbody>
							<!-- <tr class="text-c">
								<td><input type="checkbox" value="" name=""></td>
								<td>1</td>
								<td>2014-6-11 11:11:42</td>
								<td>2014-6-11 11:11:42</td>
								<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10001')" title="查看">订单标题</u></td>
								<td>200</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td class="td-status"><span class="label label-success radius">已发布</span></td>
								<td class="f-14 td-manage"><a style="text-decoration: none"
									onClick="article_stop(this,'10001')" href="javascript:;"
									title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a
									style="text-decoration: none" class="ml-5"
									onClick="article_edit('订单编辑','orderadd.html','10001')"
									href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
									<a style="text-decoration: none" class="ml-5"
									onClick="article_del(this,'10001')" href="javascript:;"
									title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
							</tr>
							<tr class="text-c">
								<td><input type="checkbox" value="" name=""></td>
								<td>10002</td>
								<td class="text-l"><u style="cursor: pointer"
									class="text-primary"
									onClick="article_edit('查看','article-zhang.html','10002')"
									title="查看">订单标题</u></td>
								<td>行业动态</td>
								<td>H-ui</td>
								<td>2014-6-11 11:11:42</td>
								<td>21212</td>
								<td class="td-status"><span
									class="label label-success radius">草稿</span></td>
								<td class="f-14 td-manage"><a style="text-decoration: none"
									onClick="article_shenhe(this,'10001')" href="javascript:;"
									title="审核">审核</a> <a style="text-decoration: none" class="ml-5"
									onClick="article_edit('订单编辑','article-add.html','10001')"
									href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
									<a style="text-decoration: none" class="ml-5"
									onClick="article_del(this,'10001')" href="javascript:;"
									title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
							</tr> -->
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
		$(function() {

			/* $('.table-sort').dataTable({
			 "aaSorting": [[ 1, "desc" ]],//默认第几个排序
			 "bStateSave": true,//状态保存
			 "aoColumnDefs": [
			 //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			 {"orderable":false,"aTargets":[0,8]}// 不参与排序的列
			 ]
			 }); */

			$('.table-sort tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
		});

		/*订单-添加*/
		function article_add(title, url, w, h) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*订单-编辑*/
		function article_edit(title, url, id, w, h) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*订单-删除*/
		function article_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : '',
					dataType : 'json',
					success : function(data) {
						$(obj).parents("tr").remove();
						layer.msg('已删除!', {
							icon : 1,
							time : 1000
						});
					},
					error : function(data) {
						console.log(data.msg);
					},
				});
			});
		}

		/*订单-审核*/
		function article_shenhe(obj, id) {
			layer
					.confirm(
							'审核文章？',
							{
								btn : [ '通过', '不通过', '取消' ],
								shade : false,
								closeBtn : 0
							},
							function() {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-success radius">已发布</span>');
								$(obj).remove();
								layer.msg('已发布', {
									icon : 6,
									time : 1000
								});
							},
							function() {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-danger radius">未通过</span>');
								$(obj).remove();
								layer.msg('未通过', {
									icon : 5,
									time : 1000
								});
							});
		}
		/*订单-下架*/
		function article_stop(obj, id) {
			layer
					.confirm(
							'确认要下架吗？',
							function(index) {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-defaunt radius">已下架</span>');
								$(obj).remove();
								layer.msg('已下架!', {
									icon : 5,
									time : 1000
								});
							});
		}

		/*订单-发布*/
		function article_start(obj, id) {
			layer
					.confirm(
							'确认要发布吗？',
							function(index) {
								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-success radius">已发布</span>');
								$(obj).remove();
								layer.msg('已发布!', {
									icon : 6,
									time : 1000
								});
							});
		}
		/*订单-申请上线*/
		function article_shenqing(obj, id) {
			$(obj).parents("tr").find(".td-status").html(
					'<span class="label label-default radius">待审核</span>');
			$(obj).parents("tr").find(".td-manage").html("");
			layer.msg('已提交申请，耐心等待审核!', {
				icon : 1,
				time : 2000
			});
		}
	</script>


	<script>
		$(function() {
			//修改密码的超链接单击事件
			$(document).on(
					"click",
					'.changepwd',
					function() {
						var _this = $(this);
						data = _this.parent().siblings();
						var arr = [];
						for (var i = 1; i < data.length; i++) {
							// console.log($(data[i]).text());
							arr.push($(data[i]).text());//拿到点击按钮的当前那条信息的内容 放到一个数组里
						}
						console.log(arr);
						//change-em-password.html

						layer
								.open({
									type : 2,
									area : [ '600px', '270px' ],
									fix : false, //不固定
									maxmin : true,
									shade : 0.4,
									title : '修改密码',
									content : 'change-emp-password.html',
									success : function(layero, index) {
										var body = layer.getChildFrame('body',
												index);//建立父子联系
										var iframeWin = window[layero
												.find('iframe')[0]['name']];

										var _ename = body.find('#ename');
										console.log(_ename + "," + arr[1]);
										$(_ename).html(arr[1]);

									}
								});

					});

			//修改员工信息的超链接单击事件
			$(document).on(
					"click",
					'.empedit',
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
									area : [ '710px', '510px' ], //窗口大小
									fix : false, //不固定
									maxmin : true,
									shade : 0.4,
									title : '编辑员工信息', //显示的标题
									content : 'emp-add.html', //很多种写法 其中之一直接写目标窗口(要弹出来窗口)
									success : function(layero, index) { //success可以不写
										var body = layer.getChildFrame('body',
												index);//建立父子联系
										var iframeWin = window[layero
												.find('iframe')[0]['name']];

										var inputList = body.find('input'); //找所有的input
										for (var j = 0; j < arr.length; j++) {
											$(inputList[j]).val(arr[j]); //arr[j] 数组中的值 赋值给  $(inputList[j])
										}
									}
								});

					});

		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->


	<!-- 从之前datatable案例中移植过来的代码  头部检索以及表格头部信息-->
	<!-- <div class="container">
    是否自动检索：<input type="checkbox" id="autoSearch">
    <br>
    员工编号：<input type="text" class="form-controlSearch" placeholder="请输入关键字查询" data-column="1" id="col1_filter">
    <br>
    姓名：<input type="text" class="form-controlSearch" placeholder="请输入关键字查询" data-column="2" id="col2_filter">
    <br>
    岗位：<input type="text" class="form-controlSearch" placeholder="请输入关键字查询" data-column="3" id="col3_filter">
    <br>
    入职时间：<input type="text" class="form-controlSearch" placeholder="请输入关键字查询" data-column="4" id="col4_filter">
    <br>
    部门编号：<input type="text" class="form-controlSearch" placeholder="请输入关键字查询" data-column="5" id="col5_filter">
    <br>
    编号：<input type="text" class="form-controlSearch" placeholder="请输入关键字查询" data-column="6" id="col6_filter">
    <br>
    <hr>
    <table id="example" class="display">
        <thead>
        <tr>
            <th><input type="checkbox" id="employeeCheckAll"></th>
            <th>员工编号</th>
            <th>姓名</th>
            <th>岗位</th>
            <th>入职时间</th>
            <th>部门编号</th>
        </tr>
        </thead>
    </table>
</div> -->
	<!-- 头部检索以及表格标题头结束 -->
	<!-- <link rel="stylesheet" type="text/css" href="plugin/datatables/jquery.dataTables.min.css"/> -->

	<!-- <style>
  .paginate_button{box-sizing:content-box}
</style> -->


	<script src="plugin/datatables/jquery.dataTables.min.js"></script>

	<script>
		var employee = {};

		employee.property = {
			version : "v1.0",
			name : "employee",
			tableId : "orderlist",//显示数据的容器表格的id
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
		employee.gridInit = {
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
			autoSearch : false
		};

		//路径配置,此处配置的路径是获取数据的重要手段;
		employee.url = "/"; //  这里 / 表示的是localhost/
		employee.requestUrl = {
			queryList : employee.url + "HuangChongProject/os.do" //数据是从servlet一侧返回的 json格式
		};

		employee.search = {
			uuid : ""
		};

		employee.status = [ {
			"searchable" : false,
			"orderable" : false,
			"targets" : 0
		},//第一行不进行排序和搜索
		//        {"targets": [12], "visible": false},    //设置第13列隐藏/显示
		//        {"width": "10%", "targets": [1]},  //设置第2列宽度
		//        {
		//            对第7列内容进行替换处理
		//            targets: 6,
		//            render: function (data, type, row, meta) {
		//                if (data == "1") {
		//                    return employee.table.sexMan;
		//                }
		//                if (data == "0") {
		//                    return employee.table.sexWoman;
		//                }
		//            }
		//        },
		{
			defaultContent : '',
			targets : [ '_all' ]
		} //所有列设置默认值为空字符串
		];
		//对应的返回数据格式

		employee.filed = [
				{ //第一个列
					"data" : "extn",
					"createdCell" : function(nTd, sData, oData, iRow, iCol) {
						$(nTd)
								.html(
										"<input type='checkbox' name='checkList' value='" + sData + "'>");
					}
				}, //这里是返回的json对象中的 属性值   {data : }
				{
					"data" : "orderId"
				},
				{
					"data" : "bookTime"
				},
				{
					"data" : "unsubscribeTime"
				},
				{
					"data" : "fee"
				},
				{
					"data" : "orderStatus"
				},
				{
					"data" : "accomId"
				},
				{
					"data" : "userId"
				},
				{ //创建操作那个列
					"data" : "extn",
					"createdCell" : function(nTd) {
						//表格最后一个列增加很多超链接 启用禁用。 编辑   删除 修改密码
						$(nTd)
								.html(
										'<a style="text-decoration:none" onClick="member_stop(this,\'10001\')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" class="empedit ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="changepwd ml-5"  href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,\'1\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>');
						//$(nTd).html('<a onClick="member_stop(this,\'10001\')">xx<a>');
						//$(nTd).html('<a style="text-decoration:none" onClick="member_stop(this,\'10001\')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" onclick="member_edit(\'编辑\',\'member-add.html\',\'4\',\'\',\'510\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="change_password(\'修改密码\',\'change-password.html\',\'10001\',\'600\',\'270\')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,\'1\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>');
						//$(nTd).html("<td class='td-manage'><a style='text-decoration:none' onClick='member_stop(this,'10001')' href='javascript:;' title='停用'><i class='Hui-iconfont'>&#xe631;</i></a> <a title='编辑' href='javascript:;' onclick='member_edit('编辑','member-add.html','4','','510')' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a> <a style='text-decoration:none' class='ml-5' onClick='change_password('修改密码','change-password.html','10001','600','270')' href='javascript:;' title='修改密码'><i class='Hui-iconfont'>&#xe63f;</i></a> <a title='删除' href='javascript:;' onclick='member_del(this,'1')' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a></td>");
					}
				} ];

		//导航按钮操作
		employee.buttons = '<button class="btn btn-default"  type="button" id="reload" data-toggle="modal" data-target="#employeeModal">刷新表格</button>'
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
										alert("请求失败" + errorMsg);
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
					alert("连接服务器失败！");
				} else if (h == 7) {
					alert("返回数据错误！");
				}
			};

			//回调，如果返回的时候有问题提示信息
			eloancn.table.grid.on('xhr.dt', function(e, settings, json, xhr) {
				console.log("重新加载了数据");
				if (typeof (json.code) != "undefined" && json.code != "0") {
					alert(json.message);
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
				elo.gridInit.autoSearch = $("#autoSearch").prop("checked");
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
							console.log($('#col' + filedValue + '_filter')
									.val());
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
				alert(eloancn.table.statusTitle);
			} else {
				for (var i = 0; i < uuids.length; i++) {
					uuid = uuid + uuids[i].extn + ",";
				}
				alert(uuid);
			}
		}

		//单选
		function selection() {

			if (eloancn.table.grid.rows(".selected").data().length == 1) {
				var uuid = eloancn.table.grid.row(".selected").data().extn;

				if (uuid == "") {
					alert(eloancn.table.statusTitle);
				} else {
					alert(uuid);
				}

			} else {
				alert(eloancn.table.statusTitle);
			}
		}

		//刷新页面
		//重新加载数据
		function reload() {
			eloancn.table.grid.ajax.reload();
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
			dataTablesInit(employee);
		});
	</script>


	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>