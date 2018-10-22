<%@ page language="java" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>登录界面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/login.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/tooltips.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/style.js" type="text/javascript"></script>
</head>

<body>
	<div class="page-container">
		<div class="main_box" style="height: 500px">
			<div class="login_box">
				<div class="login_logo">
					<img src="images/logo.png">
				</div>

				<div class="login_form">
					<form>
						<div class="form-group">
							<label for="adminName" class="t">用户名：</label> <input id="adminName"
								value="" name="adminName" type="text" required="required"
								class="form-control x319 in" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="adminPwd" class="t">密 码：</label> <input id="adminPwd"
								value="" name="adminPwd" type="password" required="required"
								class="adminPwd form-control x319 in">
						</div>
						<div class="row cl">
	
						 <div id="slideBar" class="formControls col-xs-8 col-xs-offset-3">
                                          </div>
						</div>

						<div class="form-group space">
							<label class="t"></label> <span></span> 
							<input type="button"class="btn btn-primary btn-lg" 
								id="loginform_submit" value="登&nbsp;&nbsp;录" />
								
								<input type="button"class="btn btn-primary btn-lg"
								id="loginform_reset" value="重置" />
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<!-- Javascript -->

	<script src="js/supersized.3.2.7.min.js"></script>
	<script src="js/supersized-init.js"></script>
	<script src="js/scripts.js"></script>

	<script type="text/javascript">
var result=false;
var dataList = ["0","1"];
var options = {
    dataList: dataList,
    success:function(){  
        result=true;
    },
    fail: function(){
    }
};
SliderBar("slideBar", options);

$("#loginform_reset").click(function(){
	result=false;
	$("#adminName").val("");
	$("#adminPwd").val("");
});

$("#loginform_submit").click(function(){
	if(result==false){
		return false;
	}else{
		var adminName=$("#adminName").val();
		var adminPwd=$("#adminPwd").val();
		$.post("../as.do?op=login","adminName="+adminName+"&adminPwd="+adminPwd,function(data,status){
			if("true"==data){
				location.href="index.html";
			}else{
				layer.msg("账号密码错误!", {
					icon : 1,
					time : 3000
				});
				result=false;
				$("#adminName").val("");
				$("#adminPwd").val("");
			}
		});
	}
	
});
</script>
</body>
</html>