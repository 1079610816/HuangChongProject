<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户显示界面</title>

<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript">
   $(function(){
	   
	   //完成ajax请求 获取json数据并显示
	   $.get("BackStageUsersServlet",{"page":1,"pageSize":10,"pename":""},function(pd,status){
		   
		   //遍历pd中data
		   $.each(pd.data,function(index,users){
			   
		   });
		   
		   
	   });
	   
	   
   });
</script>

</head>
<body>

</body>
</html>