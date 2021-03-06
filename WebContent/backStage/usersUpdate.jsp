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

<title>编辑用户</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<article class="cl pd-20">
		<form action="../us.do?op=updateUsers" method="post" class="form form-horizontal" enctype="multipart/form-data"
			id="form-member-add">			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">用户编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="1234" placeholder=""
						id="userId" name="userId" required="required"
						readonly="readonly" style=border:0px;background:none>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>用户名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="userName" name="userName">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>用户昵称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="nickName" name="nickName">
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>手机号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder=""
						id="telNum" name="telNum">
				</div>
			</div>
			
           <div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>上传图片：</label>
				<div class="formControls col-xs-8 col-sm-9">
	
					提示:点击头像进行修改<br />
				   <input type="text" class="input-text" value="" placeholder=""
						id="" name="" style="display: none;">
					 <input type="text" class="input-text" value="" placeholder=""
						id="" name="" style="display: none;">
				     <img src="" id="img" width="100px" height="100px"/><br/>
				     
				      <input type="text" class="input-text" value="" placeholder=""
						id="" name="" style="display: none;">
				    <input type="text" class="input-text" value="" placeholder=""
						id="" name="" style="display: none;">
				   <input type="file" accept="image/*" id="file" name="file" style="display: none;" onChange="play()"/><br/>
					
					
				</div>
			</div>				

        
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit" value="提交" />
				</div>
			</div>
		</form>
	</article>

 <script type="text/javascript">
 
	 $("#img").click(function() {
	 	$("#file").click();
	 });
		
       function play(){
      var file = document.getElementById('file').files[0];
       var url = URL.createObjectURL(file);
       document.getElementById("img").src = url;
       }
</script>



	<!--_footer 作为公共模版分离出去-->
	
	
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.page.js"></script>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<!--ajax提交表单需要引入jquery.form.js-->
	<!-- 	<script type="text/javascript"
		src="http://malsup.github.io/jquery.form.js"></script> -->
	<script type="text/javascript">
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

			/*validate验证和 ajax 的方式完成表单提交 */
			$("#form-member-add")
					.validate(
							{
								rules : {
									empno : {
										required : true,
										minlength : 4,
										maxlength : 4
									},
									ename : {
										required : true,
									}
								},
								onkeyup : false,
								focusCleanup : true,
								success : "valid",
								submitHandler : function(form) {
									alert("submit" + form);
									//$(form).ajaxSubmit();
									//var index = parent.layer.getFrameIndex(window.name);
									//parent.$('.btn-refresh').click();
									//parent.layer.close(index);
									$(form)
											.ajaxSubmit(
													{
														//type : 'post',
														//url : "EmpServlet",
														success : function(data) {
															layer
																	.msg(
																			'操作成功!',
																			{
																				icon : 1,
																				time : 1000
																			},
																			function() {
																				//获取父层					
																				var index = parent.layer
																						.getFrameIndex(window.name);
																				//刷新父层					
																				parent.location
																						.reload();
																				//关闭弹出层			
																				parent.layer
																						.close(index);

																			});

														},
														error : function(
																XmlHttpRequest,
																textStatus,
																errorThrown) {
															console
																	.log(errorThrown
																			+ ","
																			+ XmlHttpRequest.responseText);
															layer
																	.msg(
																			'ERROR!'
																					+ errorThrown,
																			{
																				icon : 2,
																				time : 1000
																			});
														}
													});
									//ajaxSubmit结束
									return false; // 阻止表单自动提交事件

								}
							});
		});
	</script>


	<!-- <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script> -->
	<!-- <script type="text/javascript">
		$(function() {

			$.get("EmpServlet?op=load", function(data) {
				//得到的data应该是一个string类型满足 json对象
				$.each(data, function(i, d) {
					$("#deptno").append(
							"<option value="+d.DEPTNO+">" + d.DNAME
									+ "</option>");
				});

			});

		});
	</script> -->

	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>