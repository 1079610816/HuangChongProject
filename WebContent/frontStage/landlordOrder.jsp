<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 判断用户有没有登录 
<c:if test="${sessionScope.user==null}">
	<c:redirect url="index.jsp"></c:redirect>
</c:if>
--%>
<%-- 判断是不是从servlet转发过来,如果不是就跳转到servlet--%>
<c:if test="${orderLandlordList==null}">
	<c:redirect url="../ls.action?op=allLandlordOrders"></c:redirect>
</c:if>
    
    
<!DOCTYPE html>
<html>
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content=""/>
<meta name="description" content="" />
<link href="//staticnew.mayi.com/resourcesWeb/css/global.css" rel="stylesheet" type="text/css" />
<link href="//staticnew.mayi.com/resourcesWeb/css/PCenter.css?V=201310081852" rel="stylesheet" type="text/css" />
<link href="//staticnew.mayi.com/resourcesWeb/css/order.css" rel="stylesheet" type="text/css" />
<link href="//staticnew.mayi.com/resourcesWeb/css/default.css" rel="stylesheet" type="text/css" />
<link href="//staticnew.mayi.com/resourcesWeb/css/landlord/manage_pub.css" rel="stylesheet" type="text/css" />
<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/sesame_credit.css" rel="stylesheet" type="text/css"/>
<!-- new header -->
<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/public_element.css" rel="stylesheet"  type="text/css">
<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/fdbx.css" rel="stylesheet"  type="text/css">
<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/fdbx_add.css" rel="stylesheet"  type="text/css">
<style type="text/css">
.alertFd {height: 100%;left: 0;top: 0;width: 100%;z-index:1000;display:none; position: relative;position:fixed;background:rgba(0,0,0,.5) }
.alertFd_page {left:50%;top:50%;margin-left:-225px;margin-top:-125px;position:absolute;width:450px;height:250px;z-index:100;border-radius: 5px;background-color:#fff;}
.alertFd_page .nav{line-height:50px;text-align:center;font-weight:bold;border-bottom:1px solid #f2f2f2;}
.alertContent{padding:20px 30px;text-indent:2em;line-height:25px;}
.close-icon{width:100px;height:30px;background:#22bb62;border-radius:3px;margin:0 auto;text-align:center;line-height:30px;color:#fff;margin-top:20px;cursor:pointer;}
.formCbx{color:#458fce;margin-top:10px;}
.refuse_info .complete_success{background-color:#bdbdbd;}
.refuse_info_input label input{margin-top:-2px;}
.refuse_info_input label{line-height:35px}
.refuse_info .t_area{height:80px;}
.refuse_info_input label.formCbx {line-height: 22px;}
</style>
<title>房东-订单</title>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/zebra_datepicker.js"></script>
<!--   
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/order_uc.js"></script> 
--> 
<script type="text/javascript">
	//初始化样式展示
	$(function(){
		$(".MtList").show();
	});
	
	//操作.... 操作时增加状态验证  zhaopengwei 20150131 add
	function operatingOrder(bookOrderId,update_state,current_state){
		var operSide="landlord";
		var type = -1;
		if(update_state == 2 ||　update_state == 5){//房东确认： 2 房东拒绝：4、5  房客取消：4
			type = 0;
		} else if(update_state == 4){
			"landlord" == operSide ? type = 0 : type = 1;
		}
		$.get("/ordercenter/checkState",{orderId:bookOrderId, type:type},function(data) {
			if(data.result){
				if(update_state==4||update_state==5){
				   //订单信息
				    $('#fttext').text("系统将自动将"+data.checkday+"的房态置为无房");
			   		//showCancleDiv();
			   		 safedetails_show();
			    }if(update_state==2){
			    	showConfirmDiv();
			    }
			    var state=0;
			    var state_type=0;
			    var cotextPath="";
				var userId="870177979";
				var url=cotextPath+"/"+operSide+"/"+userId+"/order"+"/"+bookOrderId+"/oper";
				url+="?state="+state+"&state_type="+state_type+"&update_state="+update_state+"&current_state="+current_state;
				
				var beginCheckInDay=$("#beginCheckInDay").val();
				var endCheckInDay=$("#endCheckInDay").val();
				var orderOrMoblie=$("#orderOrMoblie").val();
				url+="&beginCheckInDay="+beginCheckInDay+"&endCheckInDay="+endCheckInDay+"&orderOrMoblie="+orderOrMoblie;
				$("#url").val(url);
				//window.location.href=url;
			} else {
				layer.alert("订单状态已变更,不能继续操作!", 8, "温馨提示", function reloadPage(){window.location.reload();});
				return;
			}
		},'JSON');
	}
	
	//添加弹层后，处理的逻辑
	function processOrder(){
	    //layer.close(xx);
	    safedetails_show();
		//var url=$("#url").val();
		//window.location.href=url;
	}
		//确认订单
	function processOkOrder(){
		var url=$("#url").val();
		window.location.href=url;
	}
	//弹出确认取消的操作
	var xx;	
	function showCancleDiv(){
		xx = $.layer({
			type : 1,
		    title : false,
			offset:['150px' , ''],
		    border : false,
		    closeBtn:false,
		    area : ['auto','auto'],
		    page : {dom : '#cancleDiv'}
		});
	 	$('#cancleDivClose').on('click',function(){
				layer.close(xx);
		});
		$('.alert-close').on('click',function(){
				layer.close(xx);
		});
	}
		
	var yy;	
	function showConfirmDiv(){
		yy = $.layer({
			type : 1,
		    title : false,
			offset:['150px' , ''],
		    border : false,
		    closeBtn:false,
		    area : ['auto','auto'],
		    page : {dom : '#confirmDiv'}
		});
	 	$('#confirmDivClose').on('click',function(){
				layer.close(yy);
		});
		$('.alert-close').on('click',function(){
				layer.close(yy);
		});
	}	
	
	//查询订单
	function searchOrder(state,op) {
		var url = "ls.action?op=" +op+ "&orderStatus="+state;
		window.location.href = url;
	}
	
	var changePage = function(pageNo) {
		var cotextPath="";
		var operSide="landlord";
		var userId="870177979";
		var state="0";
        var state_type="0";
		var url=cotextPath+"/"+operSide+"/"+userId+"/orders";
		url+="?state="+state+"&state_type="+state_type+"&curPageNo="+pageNo;
		var beginCheckInDay=$("#beginCheckInDay").val();
		var endCheckInDay=$("#endCheckInDay").val();
		var orderOrMoblie=$("#orderOrMoblie").val();
		url+="&beginCheckInDay="+beginCheckInDay+"&endCheckInDay="+endCheckInDay+"&orderOrMoblie="+orderOrMoblie;
		window.location.href=url;
	}
	//房东微店查询
	function searchMicroshop(){
		var cotextPath="";
		var userId="870177979";
		var url=cotextPath+"/user/landlord/microshop"+"/"+userId+"/orders";
		var beginCheckInDay=$("#beginCheckInDay").val();
		var endCheckInDay=$("#endCheckInDay").val();
		var orderOrMoblie=$("#orderOrMoblie").val();
		url+="?beginCheckInDay="+beginCheckInDay+"&endCheckInDay="+endCheckInDay+"&orderOrMoblie="+orderOrMoblie;
		window.location.href=url;
	}
	$(function(){
		//日历
		$('#beginCheckInDay').Zebra_DatePicker({
		  pair: $('#endCheckInDay')
		});

		$('#endCheckInDay').Zebra_DatePicker();
		//我是房东订单管理蚂蚁改版提示信息
		$('.alert-warn-close').click(function(){
			$(this).parent().slideUp();
		});
	});
	
	//已评价房东查看评论 zhaopengwei 20150130 add
	function seeComment(id){
		window.open("/room/" + id + "#pingjia");
	}
	
	//求评价 zhaopengwei 20150130 add
	function requestComment(ownerid, orderId){
		//int -2 催评短信发送失败 -1 订单不存在 0 已催评 1催评成功
		$.get("/ordercenter/promptComment",{ownerid:ownerid, orderId:orderId},function(data) {
			if(data.result == -2){
				layer.alert("求评价短信发送失败", 8, "温馨提示");
			} else if(data.result == -1){
				layer.alert("订单号不存在", 8, "温馨提示");
			} else if(data.result == 0){
				layer.alert("已发送过求评价短信", 8, "温馨提示", function reloadPage(){window.location.reload();});
			} else if(data.result == 2){
				layer.alert("房客已经评论了此订单", 1, "温馨提示", function reloadPage(){window.location.reload();});
			} else{
				//求评价成功刷新页面
				layer.alert("已经将请求评价的短信发给房客，请关注房客评价!", 1, "温馨提示", function reloadPage(){window.location.reload();});
			}
		},'JSON');
	}
	
	//房东拒绝
	function refuse_cancel(){
		 safedetails_hide();
		 
	}
	
	function refuse_ok(){
		if($("input[name='state']:checked").length == 1){	
			safedetails_hide();
			//change_fangtai();
			var url=$("#url").val();
			//拒绝原因
			var reason = $('input:radio[name="state"]:checked').val();
			var otherReason = $("#reason").val();
			if(reason == 7){
			   if(otherReason == null || otherReason == "" || otherReason == undefined){
			    otherReason = "其他";
			   }
			}
			//是否置成无房
			var change_fangtai = $("#change_fangtai").is(':checked')?0:1;
			url+="&reason="+reason+"&change_fangtai="+change_fangtai+"&otherReason="+otherReason;
		    window.location.href=url;	
		}
		 else
		 	return false;
	}
	
	function safedetails_hide(){
		$('.safedetails').hide();
	}
	
	function safedetails_show(){
		$('.safedetails').show();
	}
	function change_fangtai(){
		if($("#changeFt input").prop('checked')){
			alert("已置为无房");
			}
	}
	
	$(function(){
		$(".refuse_info_input label").click(function(){
			if($("input[name='state']:checked").length == 1){
				$(".complete_success").css("background-color","#ff5d51");
			}else{
				$(this).attr("disabled", "disabled");
			}
		})	
		$("input[name='state']").click(function(){
			if($(this).attr("value")=="7")
				$(".t_area").show();
			else
				$(".t_area").hide();
		});  
	});
</script>
</head>
<body>
	<!-- Header -->
<!-- 拉新入口 -->
<link href="//staticnew.mayi.com/resourcesWeb/v201612/headpub/css/laxin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/searchlist/index_searchlist_public.js?V=20180704"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/pub/list_header.js"></script>
<!-- 房东权限相关 -->
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/js/landlordConfig.js"></script>
<style>	
.logo58{background:url(//staticnew.mayi.com/resourcesWeb/images/index/58logo.png) no-repeat;left:14px !important;top:16px !important;}
.logomayi{left:200px !important;}
.alert-box1{width:100%;height: 100%;z-index: 300000;position: absolute;display:none;line-height:40px;}
.surveYY1{background: #000;width:100%;height:100%;opacity: 0.7;position: fixed;top: 0px;left: 0px;}
.offmax_no{width:400px;height:186px;position:fixed;top:50%;margin-top:-93px;left:50%;margin-left:-200px;background-color:#fff;z-index:999;text-align:center;box-shadow:0px 0px 4px #ccc;border-radius:2px;} 
.offmax_no p{padding:0 20px;line-height:25px;}
.alert_tit1{border-bottom:1px solid #e0e0e0;font-size:18px;margin-bottom:20px;}
.close-alert1{cursor:pointer;width:50%;margin:20px auto;background-color:#22bb62;text-align:center;color:#fff;border-radius:2px;}

.alert-box2{width:100%;height: 100%;z-index: 300000;position: absolute;display:none;line-height:40px;}
.surveYY2{background: #000;width:100%;height:100%;opacity: 0.7;position: fixed;top: 0px;left: 0px;}
.offmax_no2{width:400px;height:186px;position:fixed;top:50%;margin-top:-93px;left:50%;margin-left:-200px;background-color:#fff;z-index:999;text-align:center;box-shadow:0px 0px 4px #ccc;border-radius:2px;} 
.offmax_no2 p{padding:0 20px;line-height:25px;}
.alert_tit2{border-bottom:1px solid #e0e0e0;font-size:18px;margin-bottom:20px;}
.close-alert2{cursor:pointer;width:50%;margin:20px auto;background-color:#22bb62;text-align:center;color:#fff;border-radius:2px;}

</style>
<input  type="hidden" name="ctx" id="ctx" value="" />
<div class='header relave'>
		    
		<div class='head_cnt relave'> 	
			<ul class="nav_R asote nav_right">
				
            	 <li style="margin-left:-100px;">
	                <div class="showinfo">
	                    <a href="javascript:menufrozen(870177979,'/tenant/870177979/orders','user')" target="_self"><img src="https://i1.mayi.com/mayi57/M84/CP/NN/AUHL3K6R738JWQE3T59CJHZW99F9E8.jpg_35x35c.jpg" id="aaa" class="user_img">                	
	                    <span class="name" id="head_nickname"></span></a>
	                    <div class="head_pop">
	                        <div class="pop_column">
	                            <p><a href="javascript:menufrozen(870177979,'/tenant/870177979/orders','user')" target="_self" id="myorder" rel="nofollow" _mayi_rp="webaround|userinfo|order">我的订单</a></p>
	                            <p><a href="javascript:menufrozen(870177979,'/user/tenant/accountmanager','user')" target="_self" id="myorder" rel="nofollow" class="slideactive" _mayi_rp="webaround|userinfo|account">我的账户</a></p>
	                            <p><a href="javascript:menufrozen(870177979,'/user/tenant/mycollection','user')" target="_self" id="mycollect" rel="nofollow" _mayi_rp="webaround|userinfo|collection">我的收藏</a></p>
	                            <p><a href="javascript:menufrozen(870177979,'/user/tenant/msgmanager','user')" target="_self" id="mymsg" rel="nofollow" _mayi_rp="webaround|userinfo|inform">消息通知</a></p>
	                            <p class="Invite_friends" _mayi_rp="webaround|userinfo|invite">邀请好友</p>
	                            <p class="textCt"><a href="javascript:void(0)" id="loginoutbut" target="_self" class="stclick" clicktag="1_6">退出登录</a></p>
	                        </div>
	                    </div>
	                </div>
               </li>          
            	<li>
	            	<div class="showinfo" id="s_islandlord" >
	            		<a href="javascript:loginowner(870177979)" target="_self" class="stclick">我是房东</a>
	                	<div class="head_pop">
		                	<div class="pop_column plr10">
		                        <p><a href="ls.action?op=allLandlordOrders&orderStatus=-1">订单管理</a></p>
		                        <p><a href="ls.action?op=allPublish&accomStatus=-1">房源管理</a></p>
		   
		                    </div>
	                	</div>
	                </div>
                </li>  
            	
            	
             <li >
             <a rel="nofollow" href="javascript:publish(870177979)" class="room-btn  t-center"  _mayi_rp="webaround|activity|freepublish">免费发布房源</a> 
             <!--   
                <a rel="nofollow" href="javascript:publish(870177979)" class="room-btn f16 t-center" _mayi_rp="webaround|activity|freepublish">免费发布房源</a>
             -->
             </li>
            </ul>
            
		</div>
		
	</div>
	<!--公共头部结束-->
	<div class="alert-box1">
	    <div class="surveYY1"></div> 	
	    <div class="offmax_no">
	        <div class="alert_tit1">温馨提示</div>
	        <p class="frozeninfo">对不起，房东账号被封禁</p>
	        <p>如有疑问，请联系蚂蚁短租客服400-028-6868</p>
	        <div class="close-alert1">我知道了</div>
	    </div>
	</div>
	


<input  type="hidden" name="ctx1" id="ctx1" value="//staticnew.mayi.com" />
<input  type="hidden" name="uid" id="uid" value="870177979" />
<input  type="hidden" name="loginurl" id="loginurl" value="none" />
<input type="hidden" name="head_userName" id="head_userName" value="咸鱼">
<script type='text/javascript' src='//webchat.7moor.com/javascripts/7moorInit.js?accessId=73859f20-f357-11e6-b43e-3b18b16942dc&autoShow=false' async='async'></script>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><html xmlns:wb="http://open.weibo.com/wb">
<head>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/c.js"></script>   
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/sdk/strophe.js"></script> 
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/sdk/easemob.im-1.1.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/sdk/easemob.im-1.1.shim.js"></script>
<script type='text/javascript' src='//staticnew.mayi.com/resourcesWeb/im1/easemob.im.config.js'></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/bootstrap.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/add_reply.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/jquery-ui.js"></script>  
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/IM.js"></script>  
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/account/ajaxfileupload.js"></script>  
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/operator.js"></script>  
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/chat.js"></script>  
<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/im/css/IM.css" />  
<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/im/css/jquery-ui.css" />  

<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/swfupload2/swfupload.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/swfupload2/plugins/swfupload.queue.js?v=20160225"></script>

</head> 
<body>   
		<input type="hidden" id="MAYIUID" value="870177979" />

<style>
	#layer_settimeout{width:280px;height:60px;border-radius:5px;background:rgba(0,0,0,.7);color:#fff;position:fixed;top:300px;left:50%;margin-left:-140px;z-index:999999999;line-height:60px;text-align:center;display:none}
</style>

<input type="hidden" name="btnCanGo" id="btnCanGo" value="1" />

	
<style>
.im_sfz_tan{
	position:fixed;
	left:0;
	top:0;
	width:100%;
	height:100%;
	background:rgba(0,0,0,0.6);
	z-index: 1000001;
	line-height:100%;
	text-align: center;
	display:none;
	
}
.im_sfz_tan span{
	display:inline-block;
	height:100%;
	vertical-align:middle;
}
.im_sfz_tan img{
	display:inline;
	max-width:1190px;
	max-height:700px;
	min-width:600px;
	min-height:220px;
	vertical-align: middle;
	border:10px solid #fff;
}
</style>
</body> 
<script>
	var uid=$('#MAYIUID').val();
	if(uid!='')
	{
		$('.IM_btn').css('display','block');
	}
	//弹窗关闭
	$('.abnormal-tips-btn-close,.abnormal-tips-close').on('click',function () {
        $('.abnormal-tips-mask,.abnormal-tips').fadeOut();
    });
    //
    $('.abnormal-tips-mask').click(function(){
    	return false;
    });
	
</script>
</html>		
	
	
	 <!--挂件开始  -->
    <!--挂件结束  -->
    
	<!-- Content -->
	<div class="main">
		
		<ul class="breadcrumb clearfix">
			<li><a href="ls.action?op=allLandlordOrders&orderStatus=-1">我是房东</a> <span class="divider">》</span></li>
			<li>订单管理</li>  
		</ul>
		<input id="ownerId" type="hidden" value="870177979" />
		<div class="personalCenter clearfix">
         <ul class="center-sidebar">
			<li><a class="slideactive"  href="ls.action?op=allLandlordOrders&orderStatus=-1">订单管理<span class="ddgl_current" ></span></a></li>
		<li><a href="ls.action?op=allPublish&accomStatus=4">房源管理<span class="fygl" ></span></a></li>
		<li><a   href="frontStage/landlordAuthentication.jsp">身份验证<span  class="sfyz" ></span></a></li>
		
	
</ul>
<script type="text/javascript">
	//初始化样式展示
	
	
	
</script>
			<div class="centerCon">
				<div class="landlord-order">
					<div class="fl pos-rel">
						<label>按入住日期</label>
						<input class="inputcolor" type="text" id="beginCheckInDay" name="beginCheckInDay" value="" /> - 
						<input class="inputcolor" type="text" id="endCheckInDay" name="endCheckInDay"  value="" />
					</div>
					<div class="fr">
						<label>按订单号或手机号</label>
						<input class="inputcolor" type="text" id="orderOrMoblie" name="orderOrMoblie" value=""/>
						<input class="small-btn" type="button" name="" onclick='searchOrder("0","0")' value="搜索"/>
					</div>
				</div>
				<ul class="centerTab">
				    <li id="all" onclick="searchOrder('-1','allLandlordOrders')">全部订单</li>
					<li id="paying" onclick="searchOrder('0','payingList')">待支付订单</li>
					<li id="payed" onclick="searchOrder('1','payedList')">已支付订单</li>
					<li id="tradedefeat" onclick="searchOrder('2','tradedefeatList')">交易失败订单</li>
					<li id="refund" onclick="searchOrder('3','refundList')">退款订单</li>
					
					<script>
				//设置激活状态
					if(${orderStatus==0}){
						 $("#paying").addClass("active");
					}else if(${orderStatus==1}){
						$("#payed").addClass("active");
					}else if(${orderStatus==2}){
						$("#tradedefeat").addClass("active");
					}else if(${orderStatus==3}){
						$("#refund").addClass("active");
					}else{
						$("#all").addClass("active");
					}
				</script>
				</ul>
<div class="accountMt clearfix">
			<div class="MtList pd00">
			
			<!-- 订单循环显示 -->
				<c:forEach items="${orderLandlordList}" var="ol">
				    <div class="order-box ">
					    <div class="order-info ">
							<div class="fl ">
								<span>订单号：${ol.orderId}</span>
							</div>									
						</div>
						<div class="order-con clearfix ">
							<div class="order-img ">
								<a href="# " rel="nofollow "><img src="${pageContext.request.contextPath }/../img/${ol.accomId }/Head.jpg" width="112" height="112" alt=" " /></a>
							</div>
							<div class="order-title ">
								<h2><a href="#">${ol.accomTitle}</a></h2>
								<p class="adress ">${ol.accomAddress}</p>
							</div>
							<div class="order-book ">
								<p class="book ">入住时间：<br/>${ol.bookTime}</p>
								<p class="book ">退房时间：<br/>${ol.unsubscribeTime}</p>
							</div>
							<div class="order-money ">	
							    	<p class="money mgtp10 ">订单总额：${ol.fee}</p>
							</div>
							<div class="order-feedback ">
								<p class="feedbackp mgtp30 ">
									<span class="feedback">${ol.orderStatus == 0 ? "未付款" : ol.orderStatus == 1?"已付款":"交易失败" }  </span>
								</p>
								<p class="feedbackp "><a href="javascript:void(0)">订单详情</a></p>
							</div>
							<div class="order-handle " style="overflow:visible;position:relative; ">
    	  	    				<p class="textcenter " style="line-height:111px; "><a class="blue " href="javascript:void(0)">查看评价</a></p>
							</div>
					    </div>
					 </div>
					 </c:forEach>
					 <!-- 订单循环结束 -->
			</div>
	</div>
			
				<!-- Page -->
<script type="text/javascript">
$(document).ready(function(){
    
    $('.page').each(function() {
    	if($(this).text() == 1) {
    		$(this).addClass("active");
    	}
    });
    
});
</script>
<div class="pager">
</div>				<!-- Page END -->
			</div>
		</div>
	</div>
	<!-- 取消订单 -->
	<div id="cancleDiv" class="alert-box">
	    <input type="hidden" id="url"/>
		<div class="alert-title">
			拒绝订单
			<a class="alert-close" href="javascript:void(0)" rel="nofollow"></a>
		</div>
		<div class="alert-con">
			<div class="removetext">
				你确定要拒绝订单吗？
			</div>
			<div class="btn-box">
				<input type="button" class="warn-btn" name="" value="确定" onclick="processOrder();">
				<input type="button" id="cancleDivClose" class="gray-btn" name="" value="以后再说">
			</div>
		</div>
	</div>
	<!-- 取消订单 END -->
	<!-- 确认订单  start-->
	<div id="confirmDiv" class="alert-box">
		<div class="alert-title">
			确认订单
			<a class="alert-close" href="javascript:void(0)" rel="nofollow"></a>
		</div>
		<div class="alert-con">
			<div class="removetext">
				你确定要确认订单吗？
			</div>
			<div class="btn-box">
				<input type="button" class="warn-btn" name="" value="确定" onclick="processOkOrder();">
				<input type="button" id="confirmDivClose" class="gray-btn" name="" value="以后再说">
			</div>
		</div>
	</div>
	<!-- 确认订单 END -->
	    <!----房东拒绝-->
    <div class="safedetails" style="display:none;">
        <div class="surveYY"></div> 	
        <div class="offmax refuse_info">
        	<div class="dp_header">
            	请选择拒绝理由
            	<p class="decoration">准确填写拒绝理由有助于我们更好地为您服务</p>
        	</div>
        	<div class="dp_daypicker" style="padding-top:10px;">
            <form  class="refuse_info_input">
               <label><input type="radio" name="state" value="0" class="no_room" />无房</label><br />
               <label><input type="radio" name="state" value="1"  class="no_gengxin" />蚂蚁上的房价未更新</label><br />
               <label><input type="radio" name="state" value="2" />预订天数太少</label><br />
               <label><input type="radio" name="state" value="3" />预订日期太远</label><br />
               <label><input type="radio" name="state" value="5" />不符合本房源的接待要求</label><br />
               <label><input type="radio" name="state" value="4" />房屋无法正常使用</label><br />
               <label><input type="radio" name="state" value="6" />临时有事无法接待</label><br />
               <label><input type="radio" name="state" value="7" />其他</label><br />                                  
               
               <textarea class="t_area" id="reason" placeholder="具体说明（选填信息）"></textarea> 
               <label id="changeFt" class="formCbx clearfloat"><!--<input type="checkbox" checked id="change_fangtai">--><span id="fttext"></span></label>
               <input type="button" value="拒绝订单" onclick="refuse_ok();" class="complete_success" />
               <input type="button" value="取消" onclick="refuse_cancel();" class="complete_cancel">
            </form>                                           
        	</div> 
        </div>
    </div>
	<!--房东拒绝结束  -->
	<!-- 更新提示 start -->
	<div class="alertFd" id="alertFd_shade" style="display:none">
    	<div class="alertFd_page">
        	<p class="nav">小提示</p>
            <p class="alertContent">房源信息模块改版啦，新增了户型、可提供服务、押金和一些配套设施等~为保证您的房源信息准确性，快点击‘房源管理->修改资料’去更新吧！</p>
            <div class="close-icon" id="close-icon" onclick="$('#alertFd_shade').hide()">我知道了</div>
        </div>
	</div>
<!--弹窗,在相应需要展示的页面添加以下js,css,html   -->
   <script>
     $(function(){
     	 });
     </script>       
<style>
#fdshop_stop{background:#fff;width:490px;height:306px;padding:40px 40px 0;box-sizing:border-box;}
.checknow{background:#22bb62;color:#fff;text-align:center;height:36px;width:140px;line-height:36px;margin-left:30px;cursor:pointer;}
.deallate{border:1px solid #ccc;text-align:center;height:36px;width:140px;line-height:36px;box-sizing:border-box;cursor:pointer;}
.two_button{width:312px;margin:20px auto 0;}
</style>
<div id="fdshop_stop" style="display:none">
	<div class="c22bb62 t-center f24 mb20" style="font-size:24px">微店暂时关停</div>
    <p class="f18 c322c27">为保证微店房源真实性，您的微店暂时无法使用。请您先验证身份和房源信息，审核通过后微店将重新自动开通。</p>
    <p class="mt20 c777776"><input type="checkbox" id="noagain" />    不再出现此弹层</p>
    <div class="two_button clearfloat">
    	<div class="deallate c322c27 fl" id="fdshopclose">稍后处理</div>
    	<div class="checknow fl" id="checkfornow">立即验证</div>
    </div>
</div>      
            
     <!--弹窗,不在此页显示end   -->    	<!-- 更新提示 end -->
	<!-- Content END -->
	<!-- Footer -->
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/login.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    function getCookie(objName) {
        var arrStr = document.cookie.split("; ");
        for(var i = 0;i < arrStr.length;i ++){
            var temp = arrStr[i].split("=");
            if(temp[0] == objName) return unescape(temp[1]);
        }
    }
    
    function deleteCookie(name, path) {
        var name = escape(name);
        var expires = new Date(0);
        path = path == "" ? "" : ";path=" + path;
        document.cookie = name + "=" + ";expires=" + expires.toUTCString() + path;
    }

    //修正cookie中的MayiUserInfo
    var user = getCookie('MayiUserInfo');
    if (user != null) {
        var pattern = new RegExp(/^\".+\"$/);
        if (pattern.exec(user)) {
            user = user.substring(1,user.length-1);
            deleteCookie('MayiUserInfo', '/');
            document.cookie = "MayiUserInfo=" + escape(user) + ";path=/;domain=.mayi.com";
        }
    }
    //未登录的登录后才能显示站内信
});

function sinaWeibo(){
	window.open("http://widget.weibo.com/dialog/follow.php?fuid=2357071361");
}
</script>
<div class="foot index-foot clearfloat">
	<div class="w1190 pb20 clearfloat">
        	<div class="link_end">
    <p class="t-center f12 c777776">客户服务：500-065-6668 |<a href="http://www.mayi.com/tenantlogin/" target="_blank" class="c777776">&nbsp;帮助中心&nbsp;|</a><a href="http://www.mayi.com/aboutcompany/" target="_blank" class="c777776">&nbsp;公司信息&nbsp;|</a><a href="/sitemap" target="_blank" class="c777776">&nbsp;网站地图&nbsp;|</a><a href="http://www.mayi.com/activity/app50" target="_blank" class="c777776">&nbsp;app下载&nbsp;|</a>关注我们
        <span class="mr10 cursorpt showinfo relave" style="display:inline-block;vertical-align:middle;">
            <img src="//staticnew.mayi.com/resourcesWeb/images/weixin_logo_s.png">
            <img src="http://staticnew.mayi.com/resourcesWeb/v201510/images/index_own/weixin.jpg" class="head_pop absot" style="bottom:24px;left:-32px;">
        </span>
        <span class="cursorpt" style="display:inline-block;vertical-align:middle;">
            <img src="//staticnew.mayi.com/resourcesWeb/images/xinlang_logo_s.png" onclick="sinaWeibo();">
        </span>
    </p>
    <!--公司切换-->
    <p class="t-center f12 c777776">网站备案/许可证号：京ICP证130021号 <a class="c777776" href="https://i1.mayi.com/mayi41/M99/YJ/EZ/UFM6JS6W3CJCKVTKB7XZBH7QEPN4ZY.jpg" target="_blank">营业执照编号：102585576</a> 易云游网络技术（北京）有限公司</p>
   
</div>
     </div>
</div>
<!--[statistics start]-->
	<!-- Footer END -->
<!-- 登录弹窗 -->
	<div class="loginbox" id="loginboxdiv" nexturl="none"
		name="loginboxdiv" style="display: none;">
		<a class="login-colse" id="loginclose" name="loginclose" onClick=""
			href="javascript:void(0)"></a>
		<div class="login-ways clearfloat">
			<div class="fl phone-account">
				<ul class="c322c27 clearfloat f18">
					<li class="phoneway_current" id="changeloginbyma">手机验证码登录</li>
					<li class="mayiway" id="changeloginbyup">帐号密码登录</li>
				</ul>
				<div class="login-phone-account">
					<!-- 手机登陆 -->
					<div class="login-input" id="loginbymadiv" name="loginbymadiv">
						<input type="hidden" id="li_num" value="0"> <input
							type="hidden" id="code_num" value="86">
						<div class="input">
							<span class="phone-icon"></span> 
							<input class="dlargeinput"
								type="text" id="telNum" name="telNum" placeholder="手机号" value=""
								id="introduce"
								onafterpaste="mobileRepAndSetPos(this,/[^\d.]/g,'')"
								onkeyup="mobileRepAndSetPos(this,/[^\d.]/g,'')" maxlength="11" />
						</div>
						<div class="largeinputbox small-top clearfix">
							<div class="dinput fl">
								<span class="verification-icon"></span> <input
									class="dsmallinput" type="text" id="validationCode1"
									placeholder="图形验证码" value="" />
							</div>
							<div class="yz-code fr">
								<img id="validationCode_img1" alt="点击刷新" title="点击刷新"
									src="" width=130px height=38>
							</div>
						</div>
						<div class="largeinputbox small-top clearfix" id="maerrordiv">
							<div class="dinput fl" id="maerrordiv">
								<span class="password-icon"></span> <input class="dsmallinput"
									type="text" id="loginCode" name="loginCode" placeholder="短信验证码"
									value="" />
							</div>
							<div class="yz-code fr">
								<input class="sendnumber defaultsend" type="button"
									id="getLoginCode" name="getLoginCode" value="获取验证码" />
							</div>
						</div>
						<div class="logincheckbox large-top clearfix">
							<label class="fl"> <input class="selectcheckbox"
								type="checkbox" name="rememberloginstate" checked="checked"
								value="" />自动登录
							</label>
						</div>
						<div class="logincheckbox large-top clearfix">
							<font>未注册的手机号将自动创建为黄虫短租帐户</font>
						</div>
						<div class="btn-wrap btnpdt20">
							<a href="javascript:void(0)" id="loginByTelNum">登录</a>
						</div>
					</div>
					<!-- 手机登陆 end  -->

					<!-- 密码登陆 start -->
					<div class="login-input" id="loginbyupdiv" name="loginbyupdiv"
						style="display: none;">
						<div class="input">
							<span class="user-icon"></span> <input class="dlargeinput"
								type="text" id="userName" name="userName" placeholder="手机号/账号"
								value="" autocomplete="off" />
						</div>
						<div class="input small-top">
							<span class="password-icon"></span> <input class="dlargeinput"
								type="password" id="userPwd" name="userPwd" placeholder="密码"
								value="" />
						</div>
						<div class="largeinputbox small-top clearfix" id="uperrordiv">
							<div class="dinput fl" id="yui_3_5_1_1_1434542056373_108">
								<span class="verification-icon"></span> <input type="text"
									class="dsmallinput" id="validationCode" placeholder="图形验证码"
									value="">
							</div>
							<div class="yz-code fr">
								<img id="validationCode_img" alt="点击刷新" title="点击刷新"
									src="" width=130px height=38>
							</div>
						</div>
						<div class="logincheckbox large-top clearfix">
							<label class="fl"> <input class="selectcheckbox"
								type="checkbox" name="rememberpass" checked="checked" value="" />自动登录
							</label>
						</div>
						<div class="btn-wrap btnpdt20">
							<a href="javascript:void(0)" id="loginByPassword"
								_mayi_rp="web|condition|loginc">登录</a>
						</div>
						<p class="otherwaytitle mt20">
							没有账号密码请 <a href="javascript:void(0)" id="changeloginbymwa">使用手机验证码登录</a>
						</p>
					</div>
					<!-- 密码登陆 end -->


				</div>
			</div>
			<div class="fl t-center third-party">
				<h3 class="f16 mb10">关注我们</h3>
				<img src="${pageContext.request.contextPath}/frontStage/img/loginewm.jpg" style="width: 200px; height: 200px;">
			</div>
		</div>
	</div>

	<!-- 登录弹窗 END -->

<!--公共尾部结束-->
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js"></script>
<script src="${pageContext.request.contextPath}/frontStage/js/loginpc2.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){
    function getCookie(objName) {
        var arrStr = document.cookie.split("; ");
        for(var i = 0;i < arrStr.length;i ++){
            var temp = arrStr[i].split("=");
            if(temp[0] == objName) return unescape(temp[1]);
        }
    }
    
    function deleteCookie(name, path) {
        var name = escape(name);
        var expires = new Date(0);
        path = path == "" ? "" : ";path=" + path;
        document.cookie = name + "=" + ";expires=" + expires.toUTCString() + path;
    }

    //修正cookie中的MayiUserInfo
    var user = getCookie('MayiUserInfo');
    if (user != null) {
        var pattern = new RegExp(/^\".+\"$/);
        if (pattern.exec(user)) {
            user = user.substring(1,user.length-1);
            deleteCookie('MayiUserInfo', '/');
            document.cookie = "MayiUserInfo=" + escape(user) + ";path=/;domain=.mayi.com";
        }
    }
    //未登录的登录后才能显示站内信
});

function sinaWeibo(){
	window.open("http://widget.weibo.com/dialog/follow.php?fuid=2357071361");
}
</script>
<style type="text/css">
.email{ position:fixed; bottom:0px; right:0px; width:190px; height:35px; line-height:35px; background:#e8e8e8; border:1px #CCCCCC solid; border-right:none; z-index:400000000;}
.email a{ padding-left:10px; float:left; font-weight:normal; font-family:"宋体"; font-size:12px; width:120px; box-shadow:1px 0px 0px 0px #ccc; border-right:1px #fff solid;}
.email a img{ margin:12px 3px 0px 0px; float:left; width:16px; height:12px;}
.imjs-status{color:#55aa39 !important}
#webIM ul.tab-im .offline-icon,#webIM ul.tab-im .online-icon{background-position:0 !important}
#webIM .all-list a.on, #webIM .all-list a.off{background-position:-239px -297px !important;color:#2883C3 !important}
#webIM ul.tab-im a{color:#2883C3 !important}
</style> 
<script src="//tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	
	$(".help").mouseover(function () {
		$("#helpUser").css("display","block");
	});
	$(".help").mouseout(function () {
		$("#helpUser").css("display","none");
	});
	
	$(".Service").mouseover(function () {
		$("#Service").css("display","block");
	});
	$(".Service").mouseout(function () {
		$("#Service").css("display","none");
	});
	if(${user!=null}){
		$("#loginshow").css("display","none");
		$(".login-info").css("display","block");
		
		$(".user-action").mouseover(function () {
			$("#info").css("display","block");
		});
		$(".user-action").mouseout(function () {
			$("#info").css("display","none");
		});
			 
	}else{
		$("#loginshow").css("display","block");
	}
	
	
	function fdMenu () {	
			$("#fangdong").css("display","block");
	}
	</script>
</body>
</html>
