<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 判断用户有没有登录 --%>
<c:if test="${sessionScope.user==null}">
	<c:redirect url="index.jsp"></c:redirect>
</c:if>

<%-- 判断是不是从servlet转发过来,如果不是就跳转到servlet--%>
<c:if test="${orderList==null}">
	<c:redirect url="../os.action?op=allUserOrders&userId=${user.userId }"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link href="//staticnew.mayi.com/resourcesWeb/css/global.css" rel="stylesheet" type="text/css" />
		<link href="//staticnew.mayi.com/resourcesWeb/css/PCenter.css" rel="stylesheet" type="text/css" />
		<link href="//staticnew.mayi.com/resourcesWeb/css/order.css" rel="stylesheet" type="text/css" />
		<link href="//staticnew.mayi.com/resourcesWeb/css/collection.css" rel="stylesheet" type="text/css">
		<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/sesame_credit.css" rel="stylesheet" type="text/css" />
		<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/public_element.css" rel="stylesheet" type="text/css">
		<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/fdbx.css" rel="stylesheet">
		<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/orderrefund.css" rel="stylesheet">
		<style type="text/css">
			.refuse_info .complete_success {
				background-color: #bdbdbd;
			}
		</style>
		<title>订单-房客</title>
		<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/comment_div.js?V=201310162028"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/lottery.js"></script>
		<script src="${pageContext.request.contextPath}/frontStage/js/loginpc2.js" type="text/javascript" charset="utf-8"></script>
		<!--wt20161103-->
		<style>
			.yx_shishui_btn {
				color: #458fce;
				line-height: 24px;
				cursor: pointer;
				margin-top: 16px;
			}
			
			.yx_shishui_tan {
				display: none;
				position: fixed;
				padding: 0 20px 28px;
				left: 50%;
				top: 50%;
				width: 500px;
				background: #fff;
				margin-left: -250px;
				margin-top: -194px;
				border: 1px solid #ebebeb;
				box-sizing: border-box;
				box-shadow: 0 0 6px #ebebeb;
				z-index: 260;
			}
			
			.mark {
				display: none;
				width: 100%;
				height: 100%;
				position: fixed;
				left: 0;
				top: 0;
				background: #000;
				opacity: 0.6;
				filter: Alpha(opacity=60);
				z-index: 9;
			}
			
			.close_yx_tan {
				position: absolute;
				top: 10px;
				right: 10px;
				display: block;
				width: 20px;
				height: 20px;
				background-image: url(http://staticnew.mayi.com/resourcesWeb/v201510/images/commom/login_icon.png);
				background-repeat: no-repeat;
				background-position: -18px -20px;
				cursor: pointer;
			}
			
			.yx_shishui_1 strong,
			.yx_shishui_2 strong {
				display: block;
			}
			
			.yx_shishui_1 strong {
				color: #279d2d;
				font-size: 18px;
				padding: 20px 0 12px;
				line-height: 40px;
			}
			
			.yx_shishui_1 p {
				padding: 6px 10px;
				line-height: 20px;
				color: #279d2d;
				<!--width: 292px;
				-->text-align: left;
				box-sizing: border-box;
				background: #f3fcf4;
			}
			
			.yx_shishui_2 strong {
				padding-top: 18px;
				line-height: 56px;
				font-size: 18px;
				color: #333;
			}
			
			.yx_shishui_2 p {
				line-height: 20px;
				text-align: left;
				color: #333;
			}
			
			.hover_name {
				position: absolute;
				display: none;
				background: #fff;
				padding: 6px 9px;
				box-sizing: border-box;
				top: 25px;
				left: 60px;
				border: 1px solid #ddd;
				border-radius: 6px;
				-webkit-border-radius: 6px;
				-moz-border-radius: 6px;
				z-index: 10;
			}
			
			.trangle {
				position: relative;
				width: 0;
				height: 0;
				border-style: solid;
				border-width: 8px;
				border-color: transparent transparent #ddd transparent;
				margin-top: -22px;
				margin-bottom: 5px;
			}
			
			.trangle:after {
				content: '';
				display: block;
				position: absolute;
				border-style: solid;
				border-width: 7px;
				border-color: transparent transparent #fff transparent;
				top: -6px;
				left: -7px;
			}
		</style>
		<script>
			$(function() {
				$('.close_yx_tan').click(function() {
					$('.mark').hide();
					$(this).parent().hide();
				})
			})
		</script>
		<script type="text/javascript">
			//初始化样式展示
			$(function() {
				
				$(".MtList").show();
				$("#state_type").val("0");
			});

			//去付款
			function goPaying(bookOrderId) {

				$.ajax({
					type: 'get',
					url: "/order/checkstate/" + bookOrderId,
					async: false,
					dataType: 'json',
					success: function(re) {
						if(re.error != null) {
							layer.alert(re.error.message, 5, "温馨提示", function index() {
								location.reload();
							});
						} else {
							var url = "/order/waitpay/" + bookOrderId;
							window.open(url);
							return false;
						}
					},
					error: function() {
						layer.alert("支付失败,请稍候重试!", 5, "温馨提示", function index() {
							location.reload();
						});
					}
				});
			}

			//操作订单  操作时增加状态验证  zhaopengwei 20150131 add
			function operatingOrder(bookOrderId, update_state, current_state, notSupportRefund) {
				var operSide = "tenant";
				var type = -1;
				if(update_state == 2 || update_state == 5) { //房东确认： 2     房东拒绝：4、5     房客取消：4
					type = 0;
				} else if(update_state == 4) {
					"landlord" == operSide ? type = 0 : type = 1;
				}
				$.get("/ordercenter/checkState", {
					orderId: bookOrderId,
					type: type
				}, function(data) {
					if(data.result) {
						if(update_state == 4) {
							/* if(operSide == "tenant" && data.partRefund){	//房客取消部分退款
								$("#lodgeunitid").val(data.lodgeunitid);
								showCanclePartDiv();
							}else{ }*/
							if(operSide == "tenant" && data.statetype) {
								refuse_ok_show1(data);
							} else {
								refuse_ok_show();
							}
						}
						var state = 0;
						var state_type = 0;
						var cotextPath = "";
						var userId = "870177979";
						var url = cotextPath + "/" + operSide + "/" + userId + "/order" + "/" + bookOrderId + "/oper";
						url += "?state=" + state + "&state_type=" + state_type + "&update_state=" + update_state + "&current_state=" + current_state;
						$("#url").val(url);
						//window.location.href=url;
					} else {
						layer.alert("订单状态已变更,不能继续操作!", 8, "温馨提示", function reloadPage() {
							window.location.reload();
						});
						return;
					}
				}, 'JSON');
			}

			//添加弹层后，处理的逻辑
			function processOrder() {
				layer.close(partAlert);
				//refuse_ok_show();
				refuse_ok_show1();
				//var url=$("#url").val();
				//window.location.href=url;
			}

			//弹出确认取消的操作
			var xx;

			function showCancleDiv(notSupportRefund, current_state) {
				$('#refundAlert').hide();
				$('#notRefundAlert').hide();
				xx = $.layer({
					type: 1,
					title: false,
					offset: ['150px', ''],
					border: false,
					closeBtn: false,
					area: ['auto', 'auto'],
					page: {
						dom: '#cancleDiv'
					},
					success: function(layer) {
						if(notSupportRefund == 'true' && current_state == 3) {
							$('#notRefundAlert').show();
						} else {
							$('#refundAlert').show();
						}
					} //创建成功后的回调
				});
				$('#cancleDivClose').on('click', function() {
					layer.close(xx);
				});
				$('.alert-close').on('click', function() {
					layer.close(xx);
				});
			}

			//弹出取消部分扣款的操作
			var partAlert;

			function showCanclePartDiv() {
				partAlert = $.layer({
					type: 1,
					title: false,
					offset: ['150px', ''],
					border: false,
					closeBtn: false,
					area: ['auto', 'auto'],
					page: {
						dom: '#canclePartDiv'
					},
				});
				$('#cancleDivClose').on('click', function() {
					layer.close(partAlert);
				});
				$('.alert-close').on('click', function() {
					layer.close(partAlert);
				});
			}

			//查询订单
			function searchOrder(state,op) {
				var url = "os.action?op=" +op+ "&orderStatus="+state+"&userId="+${user.userId};
				console.log(url);
				window.location.href = url;
			}

			//分页调用js
			var changePage = function(pageNo) {
				var cotextPath = "";
				var operSide = "tenant";
				var userId = "870177979";
				var state = $("#state").val();
				var state_type = $("#state_type").val();
				var url = cotextPath + "/" + operSide + "/" + userId + "/orders";
				url += "?state=" + state + "&state_type=" + state_type + "&curPageNo=" + pageNo;
				window.location.href = url;
			}

			//显示房东交易规则
			function showTradeRule() {
				window.open("/room/" + $("#lodgeunitid").val() + "#rules");
			}

			//已评价房东查看评论 zhaopengwei 20150302 add
			function seeComment(id) {
				window.open("/room/" + id + "#pingjia");
			}

			//房客取消订单原因开始
			function refuse_cancel() {
				$('#safedetails').hide();
			}

			function refuse_ok() {
				if($("input[name='state']:checked").length == 1) {
					refuse_cancel();
					var url = $("#url").val();
					//拒绝原因
					var reason = $('input:radio[name="state"]:checked').val();
					var otherReason = "";
					url += "&reason=" + reason + "&otherReason=" + otherReason;
					window.location.href = url;
				} else {
					return false;
				}
			}

			function refuse_ok_show() {
				$('#safedetails').show();
			}
			//房客已支付房东已确认订单 取消订单原因开始
			function refuse_ok1() {
				var reason_id = $("#reason_id").val();
				if(reason_id == "") {
					return false;
				} else {
					$('.make_sure_layer').hide();
					$('.safedetails1').hide();
					var url = $("#url").val();
					var otherReason = "";
					url += "&reason=" + reason_id + "&otherReason=" + otherReason;
					window.location.href = url;
				}
				//退款详情页显示
				/* if($("input[name='state1']:checked").length == 1){
					refuse_cancel1();
					var url=$("#url").val();
						//拒绝原因
						var reason = $('input:radio[name="state1"]:checked').val();
						var otherReason ="";
						url+="&reason="+reason+"&otherReason="+otherReason;
					    window.location.href=url;
				}else{
						return false;
				} */
			}

			function refuse_ok_show1(data) {
				if(data.tj_totalamount != null) {
					$("#tj_totalamount").html("<i>¥</i>" + data.tj_totalamount / 100);
				}
				if(data.tj_refundDesc != null) {
					$("#tj_refundDesc").html(data.tj_refundDesc);
				}
				var tj_refundInfo_str = "";
				if(data.tj_roomamount != null) {
					tj_refundInfo_str += "<li>房费<span class='fr'><i>￥</i>" + data.tj_roomamount / 100 + "</span></li>";
				}
				if(data.tj_couponamount != null && data.tj_couponamount != 0) {
					tj_refundInfo_str += "<li>优惠券<span class='fr'><i>￥</i>" + data.tj_couponamount / 100 + "</span></li>";
				}
				if(data.tj_depositamount != null && data.tj_depositamount != 0) {
					tj_refundInfo_str += "<li>押金<span class='fr'><i>￥</i>" + data.tj_depositamount / 100 + "</span></li>";
				}
				if(data.tj_insuranceamount != null && data.tj_insuranceamount != 0) {
					tj_refundInfo_str += "<li>住宿意外险<span class='fr'><i>￥</i>" + data.tj_insuranceamount / 100 + "</span></li>";
				}
				if(data.tj_taxamount != null && data.tj_taxamount != 0) {
					tj_refundInfo_str += "<li>手续费<span class='fr'><i>￥</i>" + data.tj_taxamount / 100 + "</span></li>";
				}
				if(data.tj_postageamount != null && data.tj_postageamount != 0) {
					tj_refundInfo_str += "<li>配送服务费<span class='fr'><i>￥</i>" + data.tj_postageamount / 100 + "</span></li>";
				}
				if(tj_refundInfo != "") {
					$("#tj_refundInfo").html(tj_refundInfo_str);
				}
				var refunddesc_str = "";
				if(data.retunddesc0 != null) {
					refunddesc_str += "<li>" + data.retunddesc0 + "</li>";
				}
				if(data.retunddesc1 != null) {
					refunddesc_str += "<li>" + data.retunddesc1 + "</li>";
				}
				if(data.retunddesc2 != null) {
					refunddesc_str += "<li>" + data.retunddesc2 + "</li>";
				}
				if(refunddesc_str != "") {
					$("#retunddesc").html(refunddesc_str);
				}
				$('#safedetails1').show();
			}

			$(function() {
				$(".discountManageUl").click(function() {
					window.location.href = "/user/landlord/accountmanager";
				});
				$("#refuse_info_input label").click(function() {
					if($("input[name='state']:checked").length == 1) {
						$("#complete_success").css("background-color", "#ff5d51");
					} else {
						$(this).attr("disabled", "disabled");
					}
				})
				$("#refuse_info_input1 label").click(function() {
					if($("input[name='state1']:checked").length == 1) {
						$("#complete_success1").css("background-color", "#ff5d51");
					} else {
						$(this).attr("disabled", "disabled");
					}
				})
				//房客取消订单原因结束  

				//新版退款相关js
				//以后再说 按钮
				$('.talk_later').click(function() {
					$('#safedetails1').hide()
				})
				//确认取消按钮
				$('.sure_cancle ').click(function() {
					var reason_id = $("#reason_id").val();
					if(reason_id == "") {
						alert("请选择取消原因！");
						return false;
					} else {
						$('.make_sure_layer').show();
					}
				})
				//再想想 按钮
				$('#think_again ').click(function() {
					$('.make_sure_layer').hide();
				})
				//确认取消第二个弹层
				$('#sure_cancle_btn').click(function() {
					refuse_ok1();
				})
				//退款详情页隐藏
				$('.sure_tk_detail').click(function() {
					$('.tk_detail_layer').hide();
				})
				$(".noramal_input").click(function(event) {
					event.stopPropagation();
					$(".select_box").toggle();
					$(this).removeClass("sj_down").addClass('sj_up');
					$(this).toggleClass('sj_up');
				});
				$("body").on("click", ".select_box li", function(e) {
					$(this).parent().siblings(".noramal_input").removeClass("sj_up").addClass('sj_down');
					$(this).parent().siblings(".noramal_input").text($(this).text()).end().slideUp("fast");
					$(this).parent().siblings(".noramal_input").val($(this).text()).end().slideUp("fast");
					$("#reason_id").val($(this).val());
				});
			});
			//退款详情按钮
			function refundinfo(bookOrderId) {
				$.get("/ordercenter/refundinfo", {
					orderId: bookOrderId
				}, function(data) {
					if(data.refundDesc != null) {
						$("#tk_refundDesc").html(data.refundDesc)
					}
					if(data.refundReason != null) {
						$("#tk_refundReason").html(data.refundReason)
					}
					if(data.tj_totalamount != null) {
						$("#tk_totalamount").html("<i>¥</i>" + data.tj_totalamount / 100);
					}
					var tk_refundInfo_str = "";
					if(data.tj_roomamount != null) {
						tk_refundInfo_str += "<li>房费<span class='fr'><i>￥</i>" + data.tj_roomamount / 100 + "</span></li>";
					}
					if(data.tj_couponamount != null && data.tj_couponamount != 0) {
						tk_refundInfo_str += "<li>优惠券<span class='fr'><i>￥</i>" + data.tj_couponamount / 100 + "</span></li>";
					}
					if(data.tj_depositamount != null && data.tj_depositamount != 0) {
						tk_refundInfo_str += "<li>押金<span class='fr'><i>￥</i>" + data.tj_depositamount / 100 + "</span></li>";
					}
					if(data.tj_insuranceamount != null && data.tj_insuranceamount != 0) {
						tk_refundInfo_str += "<li>住宿意外险<span class='fr'><i>￥</i>" + data.tj_insuranceamount / 100 + "</span></li>";
					}
					if(data.tj_taxamount != null && data.tj_taxamount != 0) {
						tk_refundInfo_str += "<li>手续费<span class='fr'><i>￥</i>" + data.tj_taxamount / 100 + "</span></li>";
					}
					if(data.tj_postageamount != null && data.tj_postageamount != 0) {
						tk_refundInfo_str += "<li>配送服务费<span class='fr'><i>￥</i>" + data.tj_postageamount / 100 + "</span></li>";
					}
					if(tj_refundInfo != "") {
						$("#tk_refundInfo").html(tk_refundInfo_str);
					}
					var tk_cancelDate_str = "";
					if(data.cancelDate != null) {
						tk_cancelDate_str += "<li>取消时间：" + data.cancelDate + "</li>";
					}
					tk_cancelDate_str += "<li>如果您对以上退款规则有疑问，请致电蚂蚁客服400-028-6868，提供订单号，我们将协助您解决问题。</li>";
					$("#tk_cancelDate").html(tk_cancelDate_str);
				}, 'JSON');

				$('.tk_detail_layer').show();
			}

			function showLodgeunitName(obj, num) {
				if(obj == 0) {
					$('#' + num).hide();
				} else {
					$('#' + num).show();
				}
			}
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
			.logo58 {
				background: url(//staticnew.mayi.com/resourcesWeb/images/index/58logo.png) no-repeat;
				left: 14px !important;
				top: 16px !important;
			}
			
			.logomayi {
				left: 200px !important;
			}
			
			.alert-box1 {
				width: 100%;
				height: 100%;
				z-index: 300000;
				position: absolute;
				display: none;
				line-height: 40px;
			}
			
			.surveYY1 {
				background: #000;
				width: 100%;
				height: 100%;
				opacity: 0.7;
				position: fixed;
				top: 0px;
				left: 0px;
			}
			
			.offmax_no {
				width: 400px;
				height: 186px;
				position: fixed;
				top: 50%;
				margin-top: -93px;
				left: 50%;
				margin-left: -200px;
				background-color: #fff;
				z-index: 999;
				text-align: center;
				box-shadow: 0px 0px 4px #ccc;
				border-radius: 2px;
			}
			
			.offmax_no p {
				padding: 0 20px;
				line-height: 25px;
			}
			
			.alert_tit1 {
				border-bottom: 1px solid #e0e0e0;
				font-size: 18px;
				margin-bottom: 20px;
			}
			
			.close-alert1 {
				cursor: pointer;
				width: 50%;
				margin: 20px auto;
				background-color: #22bb62;
				text-align: center;
				color: #fff;
				border-radius: 2px;
			}
			
			.alert-box2 {
				width: 100%;
				height: 100%;
				z-index: 300000;
				position: absolute;
				display: none;
				line-height: 40px;
			}
			
			.surveYY2 {
				background: #000;
				width: 100%;
				height: 100%;
				opacity: 0.7;
				position: fixed;
				top: 0px;
				left: 0px;
			}
			
			.offmax_no2 {
				width: 400px;
				height: 186px;
				position: fixed;
				top: 50%;
				margin-top: -93px;
				left: 50%;
				margin-left: -200px;
				background-color: #fff;
				z-index: 999;
				text-align: center;
				box-shadow: 0px 0px 4px #ccc;
				border-radius: 2px;
			}
			
			.offmax_no2 p {
				padding: 0 20px;
				line-height: 25px;
			}
			
			.alert_tit2 {
				border-bottom: 1px solid #e0e0e0;
				font-size: 18px;
				margin-bottom: 20px;
			}
			
			.close-alert2 {
				cursor: pointer;
				width: 50%;
				margin: 20px auto;
				background-color: #22bb62;
				text-align: center;
				color: #fff;
				border-radius: 2px;
			}
		</style>
		<input type="hidden" name="ctx" id="ctx" value="" />
		<div class='header relave'>
			<div class='head_cnt relave'>
				<span class='search'></span>
				<ul class="nav_R asote nav_right">
					<li style="margin-left:-211px;">
						<b class="mayi_tel_top"><img src="//staticnew.mayi.com/resourcesWeb/v201510/images/commom/tel_green_icon.png"><span style="font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, &quot;微软雅黑&quot; !important;font-size: 14px;" hiragino="" sans="" gb",="" arial,="" verdana,="" tahoma,="" "微软雅黑"="" !important;font-size:="" 14px;"="">客服电话：</span>400-028-6868</b>
					</li>
					<li>
						<div class="showinfo">
							<a href="javascript:menufrozen(870177979,'/tenant/870177979/orders','user')" target="_self"><img src="${user!=null?user.imgUrl:' '}" class="user_img">
								<span class="name" id="head_nickname"></span></a>
							<div class="head_pop">
								<div class="pop_column">
									<p>
										<a href="javascript:searchOrder('-1','allUserOrders')" target="_self" id="myorder" rel="nofollow" _mayi_rp="webaround|userinfo|order">我的订单</a>
									</p>
									<p>
										<a href="${pageContext.request.contextPath }/frontStage/userinfo.jsp" target="_self" id="myorder" rel="nofollow" class="slideactive" _mayi_rp="webaround|userinfo|account">我的账户</a>
									</p>
									<p class="textCt">
										<a href="javascript:void(0)" id="loginoutbut" target="_self" class="stclick" clicktag="1_6">退出登录</a>
									</p>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="showinfo" id="s_islandlord">
							<a href="javascript:loginowner(870177979)" target="_self" class="stclick">我是房东</a>
							<div class="head_pop">
								<div class="pop_column plr10">
									<p>
										<a href="frontStage/landlordOrder.jsp">订单管理</a>
									</p>
									<p>
										<a href="frontStage/landlordPublish.jsp">房源管理</a>
									</p>
								</div>
							</div>
						</div>
					</li>
					<li>
						<a rel="nofollow" href="${pageContext.request.contextPath }/frontStage/relHouse.jsp" class="room-btn f16 t-center" _mayi_rp="webaround|activity|freepublish">免费发布房源</a>
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
		<!-- 免费发布房源提示 -->
		<div class="alert-box2">
			<div class="surveYY2"></div>
			<div class="offmax_no2">
				<div class="alert_tit2">温馨提示</div>
				<p class="frozeninfo2"></p>
				<p>非常抱歉，发布房源功能已关闭，请前往途家房东端发布新房源！</p>
				<div class="close-alert2">我知道了</div>
			</div>
		</div>
		<input type="hidden" name="subdomain" id="subdomain" value="" />
		<input type="hidden" name="mainsite" id="mainsite" value="" />
		<input type="hidden" name="ctx" id="ctx" value="" />
		<input type="hidden" name="ctx1" id="ctx1" value="//staticnew.mayi.com" />
		<input type="hidden" name="uid" id="uid" value="870177979" />
		<input type="hidden" name="loginurl" id="loginurl" value="none" />
		<input type="hidden" name="head_userName" id="head_userName" value="${user!=null?user.nickName:' '}">
		<script type='text/javascript' src='//webchat.7moor.com/javascripts/7moorInit.js?accessId=73859f20-f357-11e6-b43e-3b18b16942dc&autoShow=false' async='async'></script>
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<html xmlns:wb="http://open.weibo.com/wb">

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
				#layer_settimeout {
					width: 280px;
					height: 60px;
					border-radius: 5px;
					background: rgba(0, 0, 0, .7);
					color: #fff;
					position: fixed;
					top: 300px;
					left: 50%;
					margin-left: -140px;
					z-index: 999999999;
					line-height: 60px;
					text-align: center;
					display: none
				}
			</style>

			<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/tentantIndex/js/fk_index.js"></script>

			<input type="hidden" name="btnCanGo" id="btnCanGo" value="1" />

			<div class="report-alert-box t-center" id="jubao1" name="jubao1Boxdiv" style="display:none;">
				<div class="report-alert-title mb30">匿名举报该房客</div>
				<ul class="jubao">
					<li class="mb20" id="jubaochat">该房客在聊天过程中有不良行为</li>
					<li class="mb30" id="jubaorz">该房客在入住过程中有不良行为</li>
				</ul>
			</div>

			<div class="report-alert-box t-center" id="jubaochatChoice" name="jubaochatChoiceBoxdiv" style="display:none;">
				<div class="report-alert-title mb30">匿名举报该房客</div>
				<ul class="jubao chat">
					<li class="mb10">出言辱骂</li>
					<li class="mb10">坚持要求看房 / 线下交易</li>
					<li class="mb10">发布垃圾广告、淫秽色情信息</li>
					<li class="mb10">不订房，频繁骚扰</li>
					<li class="mb30">其他短租平台工作人员</li>
				</ul>
				<p class="tc_submit mb20">下一步</p>
			</div>

			<!--上传图片证据-->
			<div class="report-alert-box t-center" id="jubaochatUpImage" name="jubaochatUpImageBoxdiv" style="display: none;">
				<div class="report_host">
					<p>匿名举报该房客</p>
				</div>
				<div class="report_add_pic">
					<p class="f16 mt20 up_img">请上传图片证据</p>
					<p class="f14 chat_desc">请上传聊天记录截图，现场图片等证据（选填），方便工作人员进行审核</p>
					<ul class="img_box" id="IMImageList">
						<li id="li_IM_upload">
							<div class="uploading add_btn">
								<span id="uploadIMImage" class="uploading-btn"></span>
							</div>
						</li>
					</ul>
				</div>
				<div class="tc_submit mb20 report_btn_checked">提交</div>
			</div>

			<!--主体结束-->
			<div class="report-alert-box t-center" id="jubaorzChoice" name="jubaorzChoice" style="display:none;">
				<div class="report-alert-title mb30">匿名举报该房客</div>
				<ul class="jubao ruzhu">
					<li class="mb10">在房内从事黄赌毒等不法行为</li>
					<li class="mb10">利用房子进行诈骗</li>
					<li class="mb10">非法传销</li>
					<li class="mb10">恶意损坏、偷窃家具</li>
					<li class="mb10">利用差评威胁房东</li>
					<li class="mb30">素质低下辱骂房东</li>
				</ul>
				<p class="tc_submit mb20">下一步</p>
			</div>

			<div class="report-alert-box t-center" id="jubaoSuccess" name="jubaoSuccess" style="display:none;">
				<div class="c22bb62 f16 mb20">
					<img src="//staticnew.mayi.com/resourcesWeb/tentantIndex/images/check-img.png" class="mr10" style="vertical-align: middle;">提交成功，请勿重复举报
				</div>
				<p class="report-t-left">感谢您抽出时间举报此用户，您的参与有助于蚂蚁短租建设成一个安全、值得信赖的平台。</p>
				<p class="report-t-left">您的举报内容如果经过核查属实，我们会对该用户处以蚂蚁短租全站禁言或禁止登录的惩罚。</p>
				<div id="jubaoSuccessBoxclose" class="report-green-btn f16" style="vertical-align: middle;background-image: none;">确定</div>
			</div>

			<div id="layer_settimeout" style="display:none;">您不是房东，无权举报</div>
			<div id="point" class="contacts_landlord clearfloat IM_content ui-draggable" style="display:none;">
				<span class="right_open_btn"></span>
			</div>
			<div class='im_sfz_tan'>
				<span></span>
				<img src="" alt="" />
			</div>

			<!--弹窗start-->
			<div class="abnormal-tips-wrapper">
				<div class="abnormal-tips" style="display: none;position: fixed;left: 50%;top: 50%;z-index: 1001;margin-left: -243px;margin-top: -141px;width: 486px;height: 282px;background: #fff;">
					<div class="abnormal-tips-title" style="box-sizing: border-box;position: relative;height: 60px;line-height: 60px;text-align: center;border: 1px solid #DCDEE0;border-top-left-radius: 3px;border-top-right-radius: 3px;font-size: 18px;color: #5E646B;">
						<span>异常提示</span>
						<div class="abnormal-tips-close" style="position: absolute;top: 20px;right: 30px;width: 19px;height: 19px;background: url('//staticnew.mayi.com/resourcesWeb/im1/images/close.png') no-repeat center;cursor: pointer;">
						</div>
					</div>
					<div class="abnormal-tips-content" style="padding: 0 48px;">
						<div id="messageError" class="abnormal-tips-text" style="padding: 50px 0;line-height: 22px;text-align: center;font-size: 16px;color: #2B2F33;">在线聊天登录失败，请点击重新打开或刷新页面后重试</div>
						<div class="abnormal-tips-btn" style="font-size: 0;">
							<div class="abnormal-tips-btn-close" style="display: inline-block;box-sizing: border-box;width: 180px;height: 50px;line-height: 50px;margin-right: 30px;text-align: center;border: 1px solid #B4B9BF;border-radius: 3px;font-size: 18px;color: #5E646B;cursor: pointer;">关闭</div>
							<div class="abnormal-tips-btn-open" style="display: inline-block;box-sizing: border-box;width: 180px;height: 50px;line-height: 50px;text-align: center;border: 1px solid #3EB382;border-radius: 3px;font-size: 18px;color: #3EB382;cursor: pointer;">重新打开</div>
						</div>
					</div>
				</div>
				<div class="abnormal-tips-mask" style="display: none;position: fixed;left: 0;top: 0;z-index: 1000;width: 100%;height: 100%;opacity: 0.7;background: #000000;"></div>
			</div>
			<!--弹窗end-->

			<style>
				.im_sfz_tan {
					position: fixed;
					left: 0;
					top: 0;
					width: 100%;
					height: 100%;
					background: rgba(0, 0, 0, 0.6);
					z-index: 1000001;
					line-height: 100%;
					text-align: center;
					display: none;
				}
				
				.im_sfz_tan span {
					display: inline-block;
					height: 100%;
					vertical-align: middle;
				}
				
				.im_sfz_tan img {
					display: inline;
					max-width: 1190px;
					max-height: 700px;
					min-width: 600px;
					min-height: 220px;
					vertical-align: middle;
					border: 10px solid #fff;
				}
			</style>
		</body>
		<script>
			var uid = $('#MAYIUID').val();
			if(uid != '') {
				$('.IM_btn').css('display', 'block');
			}
			//弹窗关闭
			$('.abnormal-tips-btn-close,.abnormal-tips-close').on('click', function() {
				$('.abnormal-tips-mask,.abnormal-tips').fadeOut();
			});
			//
			$('.abnormal-tips-mask').click(function() {
				return false;
			});
		</script>
		<!-- Header END -->
		<!-- Content -->
		<div class="main">
			<ul class="breadcrumb clearfix">
				<li>
					<a href="/tenant/870177979/orders" ">我是房客</a> <span class="divider">》</span>
				</li>
				<li>订单管理<span class="divider "></span></li>
			</ul> 
			<div class="personalCenter clearfix ">
				<ul class="center-sidebar ">
					<li><a class="slideactive "  href="javascript:searchOrder('-1','allUserOrders')">订单管理<span class="ddgl_current " ></span></a></li>
					<li><a    href="frontStage/userinfo.jsp">账户管理<span class="zhgl " ></span></a></li>
				</ul>
			<div class="centerCon ">
				<ul class="centerTab ">
					<input type="hidden " id="state "/>
					<input type="hidden " id="state_type "/>
					<li id="all" onclick="searchOrder('-1','allUserOrders')">全部订单</li>
					<li id="payed" onclick="searchOrder('0','payed') " >待支付</li>
					<li id="paying" onclick="searchOrder('1','paying') ">已支付</li>
					<li id="fail" onclick="searchOrder('2','fail') ">交易失败</li>
				</ul>
				
				<script>
				//设置激活状态
					if(${orderStatus==0}){
						 $("#payed").addClass("active");
					}else if(${orderStatus==1}){
						$("#paying").addClass("active");
					}else if(${orderStatus==2}){
						$("#fail").addClass("active");
					}else{
						$("#all").addClass("active");
					}
				</script>
	<div class="accountMt clearfix ">
			<div class="MtList pd00 ">
			<!-- 订单循环显示 -->
				<c:forEach items="${orderList}" var="o">
				    <div class="order-box ">
					    <div class="order-info ">
							<div class="fl ">
								<span>订单号：${o.orderId}</span>
							</div>									
						</div>
						<div class="order-con clearfix ">
							<div class="order-img ">
								<a href="http://www.mayi.com/room/851850411 " rel="nofollow "><img src="${pageContext.request.contextPath }/../img/${o.accomId }/Head.jpg" width="112" height="112" alt=" " /></a>
							</div>
							<div class="order-title ">
								<h2><a href="http://www.mayi.com/room/851850411 ">${o.accomTitle}</a></h2>
								<p class="adress ">${o.accomAddress}</p>
							</div>
							<div class="order-book ">
								<p class="book ">入住时间：<br/>${o.bookTime}</p>
								<p class="book ">退房时间：<br/>${o.unsubscribeTime}</p>
							</div>
							<div class="order-money ">	
							    	<p class="money mgtp10 ">订单总额：${o.fee}</p>
							</div>
							<div class="order-feedback ">
								<p class="feedbackp mgtp30 ">
									<span class="feedback">${o.orderStatus == 0 ? "未付款" : o.orderStatus == 1?"已付款":"交易失败" }  </span>
								</p>
								<p class="feedbackp "><a href="javascript:void(0)">订单详情</a></p>
							</div>
							<div class="order-handle " style="overflow:visible;position:relative; ">
    	  	    				<p class="textcenter " style="line-height:111px; "><a class="blue " href="javascript:void(0)">评价</a></p>
							</div>
					    </div>
					 </div>
				  </c:forEach>
					 <!-- 订单循环结束 -->
			</div>
	</div>
			
				<!-- Page -->
<script type="text/javascript ">
$(document).ready(function(){
    
    $('.page').each(function() {
    	if($(this).text() == 1) {
    		$(this).addClass("active ");
    	}
    });
    
});
</script>
<div class="pager ">
</div>				<!-- Page END -->
			</div>
	</div>
	</div>
	
	<!-- Content END -->
	<!-- 评论弹出层 start -->
<!-- 发表评论 -->
	<div id="sendComment " class="alert-box ">
	    <input type="hidden " id="sanitation "  value="5 "/>
	    <input type="hidden " id="security "  value="5 "/>
	    <input type="hidden " id="description "  value="5 "/>
	    <input type="hidden " id="location "  value="5 "/>
	    <input type="hidden " id="performance " value="5 "/>
	    <input type="hidden " id="bookOrderId "/>
		<div class="alert-title ">
			<span id="commentLodgTitle "></span>
            <font style="float:right;margin-right:78px; "><em id="commentPrice "></em>/晚</font>
			<a href="javascript:void(0); " class="alert-close stclick "  id="alert-close2 "></a>
		</div>
		<div class="alert-con ">
			<div class="comment ">
				<p class="comment-title mgtp10 ">入住感受：</p>
				<ul class="rating-star-box clearfix ">
					<li>
						<label>设施环境</label>
						<span class="rating-star " type="description ">
							<span class="star-1 "><a href="# " rel="nofollow "value="1 "></a></span>
							<span class="star-2 "><a  href="# " rel="nofollow "value="2 "></a></span>
							<span class="star-3 "><a  href="# " rel="nofollow "value="3 "></a></span>
							<span class="star-4 "><a  href="# " rel="nofollow "value="4 "></a></span>
							<span class="star-5 "><a class="rating-cur " value="5 " href="# " rel="nofollow "></a></span>
						</span>
					</li>
					<li>
						<label>整洁卫生</label>
						<span class="rating-star " type="sanitation ">
							<span class="star-1 "><a href="# " rel="nofollow " value="1 "></a></span>
							<span class="star-2 "><a  href="# " rel="nofollow " value="2 "></a></span>
							<span class="star-3 "><a  href="# " rel="nofollow "value="3 "></a></span>
							<span class="star-4 "><a  href="# " rel="nofollow "value="4 "></a></span>
							<span class="star-5 "><a class="rating-cur " value="5 " href="# "></a></span>
						</span>
					</li>
					<li>
						<label>房东服务</label>
						<span class="rating-star " type="security ">
							<span class="star-1 "><a href="# " rel="nofollow " value="1 "></a></span>
							<span class="star-2 "><a  href="# " rel="nofollow " value="2 "></a></span>
							<span class="star-3 "><a  href="# " rel="nofollow "value="3 "></a></span>
							<span class="star-4 "><a  href="# " rel="nofollow "value="4 "></a></span>
							<span class="star-5 "><a class="rating-cur " value="5 " rel="nofollow " href="# "></a></span>
						</span>
					</li>
					<li>
						<label>交通位置</label>
						<span class="rating-star " type="location ">
							<span class="star-1 "><a href="# "rel="nofollow " value="1 "></a></span>
							<span class="star-2 "><a  href="# "rel="nofollow " value="2 "></a></span>
							<span class="star-3 "><a  href="# " rel="nofollow "value="3 "></a></span>
							<span class="star-4 "><a  href="# " rel="nofollow "value="4 "></a></span>
							<span class="star-5 "><a class="rating-cur " value="5 " rel="nofollow " href="# "></a></span>
						</span>
					</li>
					<li>
						<label>性 价 比</label>
						<span class="rating-star " type="performance ">
							<span class="star-1 "><a href="# "rel="nofollow " value="1 "></a></span>
							<span class="star-2 "><a  href="# " rel="nofollow "value="2 "></a></span>
							<span class="star-3 "><a  href="# " rel="nofollow "value="3 "></a></span>
							<span class="star-4 "><a  href="# " rel="nofollow "value="4 "></a></span>
							<span class="star-5 "><a class="rating-cur " value="5 "rel="nofollow " href="# "></a></span>
						</span>
					</li>
				</ul>
				<p class="comment-title mgtp10 ">评论内容：</p>
				<textarea class="comment-textarea mgtp10 " id="comment_content " >可以围绕住宿感受、环境、交通、服务等多个方面评价，您的评价对其他朋友有狠狠狠大滴帮助哦~~~</textarea>
                <p class="ticket " style="text-align:center;font-size:18px;line-height:50px;color:#4C4C4C; ">评价即可获得<font style="color:#f80; ">彩票红包</font>哦~</p>
				<div class="btn-box ">
					<input type="button " value="提交 " name=" " onclick="publishComment(); " class="checking-btn mid-btn stclick " clicktag="2_1 ">
				</div>
			</div>
		</div>
	</div>
	<!-- 发表评论 END -->
	
	<div class="pjsuccess " id="comment_success ">
        <a href="javascript:void(0); " class="pjsucc-close " id="pjsucc-close "></a>
    	<div class="pjsuccessWord "><p>成功分享后</p><p>您可以和您的朋友进入QQ空间或新浪微博</p><font>点击分享链接即可领取红包</font></div>
        <ul class="share ">
        	<li><a class="a1 " href="javascript:skipShareZone(); "></a></li>
            <li><a class="a2 " href="javascript:skipShareWeixin(); "></a></li>
            <li><a class="a3 " href="javascript:skipShareSina(); "></a></li>
        </ul>
    </div>
	
	<!-- 发表评论成功
	<div id="comment_success "  class="alert-box ">
		<div class="alert-title ">
			发布评论
			<a href="# " class="alert-close "></a>
		</div>
		<div class="alert-con ">
 			<dl class="proving pdlt140 ">
				<dt class="succeed "></dt>
				<dd>发布成功！</dd>
			</dl>	
			<div class="btn-box ">
				<input type="button " id="success " value="我知道了 " name=" " class="checking-btn large-btn ">
			</div>
		</div>
	</div> -->
	<!-- 发表评论成功 END -->
	<!-- 发布评论失败 -->
	<div id="comment_error " class="alert-box ">
		<div class="alert-title ">
			发布评论
			<a href="# " class="alert-close "></a>
		</div>
		<div class="alert-con ">
			<dl class="proving ">
				<dt class="fail "></dt>
				<dd class="fail ">发布失败！</dd>
			</dl>	
			<div class="btn-box ">
				<input type="button " value="重新发布 " onclick="repeatShowPublishComment(); " name=" "  class="checking-btn large-btn ">
			</div>
		</div>
	</div>
	<!-- 发布评论失败 END -->
	<!-- 已经发布评论 -->
	<div id="comment_repetition " class="alert-box ">
		<div class="alert-title ">
			发布评论
			<a href="# " class="alert-close "></a>
		</div>
		<div class="alert-con ">
			<dl class="proving ">
				<dt class="fail "></dt>
				<dd class="fail ">您已经提交过评价了！</dd>
			</dl>	
			<div class="btn-box ">
				<input type="button " id="repetition " value="我知道了 " name=" " class="checking-btn large-btn ">
			</div>
		</div>
	</div>
	<!-- 已经发布评论 END -->
	<script type="text/javascript ">
		$(".comment-textarea ").focus(function(){
			var txt_value = $(this).val();
			if(txt_value == this.defaultValue){
				$(this).val(" ");
				$(this).css("color ","#333 ");
			}	
		})
		$(".comment-textarea ").blur(function(){
			var txt_value = $(this).val();
			if(txt_value == " "){
				$(this).val(this.defaultValue);
				$(this).css("color ","#666 ");
			}	
		})
	</script>	<!-- 评论弹出层 end -->
	
	<!-- 取消订单部分扣款 -->
	<div id="canclePartDiv " class="alert-box ">
	    <input type="hidden " id="lodgeunitid "/>
		<div class="alert-title ">
			取消订单
			<a class="alert-close " href="javascript:void(0) "rel="nofollow "></a>
		</div>
		<div class="alert-con ">
			<div class="removetext o-cancel " id="partRefund ">
				<p class="f16 " >若取消订单，我们将按照房东的交易规则扣除对应款项，您确定要取消订单吗？</p>
			</div>
			<div class="btn-box ">
				<input type="button " class="gray-btn " name=" " value="查看交易规则 " onclick="showTradeRule(); ">
				<input type="button " class="warn-btn " name=" " value="继续取消 " onclick="processOrder(); ">
			</div>
		</div>
	</div>
	<!-- 取消订单 END -->
	<!--房客取消订单原因开始-->
	<div class="safedetails " id="safedetails " style="display:none; ">
        <div class="surveYY "></div> 	
        <div class="offmax refuse_info ">
        	<div class="dp_header ">
            	请选择取消原因
            	<p class="decoration ">准确填写取消原因有助于我们更好地为您服务</p>
        	</div>
        	<div class="dp_daypicker " style="padding-top:10px; ">
            <form action="/example/html/form_action.asp " method="get " id="refuse_info_input " class="refuse_info_input lineheight ">
               <label><input type="radio " name="state " value="0 " />房东说无房了</label><br />
               <label><input type="radio " name="state " value="1 " />房东涨价</label><br />
               <label><input type="radio " name="state " value="2 " />房东一直不回复消息</label><br />
               <label><input type="radio " name="state " value="3 " />行程改变</label><br />
               <label><input type="radio " name="state " value="4 " />网上支付不成功</label><br />
               <label><input type="radio " name="state " value="5 " />其他</label><br />               
               <input type="button " value="确认取消 " onclick="refuse_ok(); " class="complete_success " id="complete_success "/>
               <input type="button " value="以后再说 " onclick="refuse_cancel(); " class="complete_cancel ">
                
            </form>                                           
        	</div> 
        </div>
    </div>
	<!--房客取消订单原因结束-->
	<!--房客已支付并且房东已经确认    取消订单原因开始 -->
	<div class="safedetails " style="display:none; ">
        <div class="surveYY "></div> 	
        <div class="offmax refuse_info ">
        	<div class="dp_header ">
            	请选择取消原因
            	<p class="decoration ">准确填写取消原因有助于我们更好地为您服务</p>
        	</div>
        	<div class="dp_daypicker " style="padding-top:10px; ">
            <form action="/example/html/form_action.asp " method="get " id="refuse_info_input1 " class="refuse_info_input lineheight ">
               <label><input type="radio " name="state1 " value="1001 " />行程有变了</label><br />
               <label><input type="radio " name="state1 " value="1002 " />协商更换入住时间</label><br />
               <label><input type="radio " name="state1 " value="1003 " />房源室内设施损坏</label><br />
               <label><input type="radio " name="state1 " value="1004 " />房东说没房了</label><br />
               <label><input type="radio " name="state1 " value="1005 " />房东涨价</label><br />
               <label><input type="radio " name="state1 " value="1006 " />交通晚点，无法到达</label><br />
               <label><input type="radio " name="state1 " value="1007 " />不可抗力因素导致不能正常入住</label><br />
               <label><input type="radio " name="state1 " value="1008 " />未使用优惠券</label><br />
               <label><input type="radio " name="state1 " value="1009 " />重复下单</label><br />
               <label><input type="radio " name="state1 " value="1010 " />其他</label><br /> 
               <input type="button " value="确认取消 " onclick="refuse_ok1(); " class="complete_success " id="complete_success1 "/>
               <input type="button " value="以后再说 " onclick="refuse_cancel1(); " class="complete_cancel " >
            </form>                                           
        	</div> 
        </div>
    </div>
	<!--房客已支付并且房东已经确认    取消订单原因开始-->
	<!--房客已支付并且房东已经确认  房客取消订单原因开始(新)-->
	<div class="safedetails " id="safedetails1 " style="display:none ">
        <div class="surveYY "></div> 	
        <div class="offmax fk_refuse_info ">
        	<div class="dp_header ">
				取消订单
        	</div>
        	<div class="dp_daypicker ">
              <div class="reason_select relave mt20 ">
		 	      <label class="font_bold f18 c_2b2f33 ">请选择取消原因</label>
				  <input type="text " placeholder="请选择 " class="noramal_input sj_down " readonly/>
				  <input type="hidden " id= "reason_id " >
		 	      <ul class="select_box " style="display: none ">
					  <li value="1001 ">行程有变了</li>
					  <li value="1002 ">协商更换入住时间</li>
					  <li value="1003 ">房源室内设施损坏</li>
					  <li value="1004 ">房东说没房了</li>
					  <li value="1005 ">房东涨价</li>
					  <li value="1006 ">交通晚点，无法到达</li>
					  <li value="1007 ">不可抗力因素导致不能正常入住</li>
					  <li value="1008 ">未使用优惠券</li>
					  <li value="1009 ">重复下单</li>
					  <li value="1010 ">其他</li>
				</ul>
		     </div>
				<p class="decoration ">准确选择取消原因有助于我们更好的为您服务</p>

				<!--退款信息-->
				<div class="tk_total ">
					<div class="total_words mt20 ">
						<span class="amount_title ">退款总金额</span>
						<span class="amount_num fr " id="tj_totalamount "></span>
					</div>
					<div class="tk_refunds " id="tj_refundDesc "></div>
					<div class="refunds_list mt10 ">
						<ul class="clearfloat " id="tj_refundInfo ">
						</ul>
					</div>
					<div class="spacial_remind mt20 ">
						<ul class="clearfloat " id="retunddesc ">
						</ul>
					</div>
					<div class="bottom_btn_list mt20 ">
						<ul class="clearfloat ">
							<li class="sure_cancle mar_r_80 ">确认取消</li>
							<li class="talk_later ">以后再说</li>
						</ul>
					</div>
				</div>
        	</div>

        </div>
    </div>
	<!--房客已支付并且房东已经确认  房客取消订单原因结束(新)-->
	<!--确定取消订单弹层开始(新)-->
	<div class="make_sure_layer " style="display:none; ">
		<div class="cancle_layer "></div>
		<div class="makeSure_cancle ">
			<p class="f16 ">订单取消后将无法恢复，您确认要取消吗？</p>
			<ul class="clearfloat cancle_btn_ul mt30 ">
				<li class="f16 mr20 " id="sure_cancle_btn ">确认取消</li>
				<li class="f16 " id="think_again ">我再想想</li>
			</ul>
		</div>
	</div>
	<!--确定取消订单弹层结束(新)-->
	<!--退款 详情页-->
	<div class="tk_detail_layer " style="display:none ">
		<div class="surveYY "></div>
		<div class="tk_page_cont ">
			<div class="dp_header ">
				退款详情
			</div>
			<div class="tk_main_cont ">
				<p class="return_redmin " id="tk_refundDesc "></p>
				<div class="tk_reason_show c_2b2f33 f18 mt20 font_bold ">
					取消原因：<span class="reason_show_list c_b4b9bf " id="tk_refundReason "></span>
				</div>
             	<!--退款金额-->
				<div class="total_words mt20 ">
					<span class="amount_title ">退款总金额</span>
					<span class="amount_num fr " id="tk_totalamount "></span>
				</div>
				<div class="tk_refunds ">含房费、押金、住宿意外险等费用</div>
				<div class="refunds_list mt20 border_b pb20 ">
					<ul class="clearfloat " id="tk_refundInfo ">
					</ul>
				</div>
				<div class="spacial_remind mt10 ">
					<ul class="clearfloat " id="tk_cancelDate ">
                    </ul>
				</div>
				<div class="sure_tk_detail ">确认</div>
			</div>
		</div>
	</div>
	<!--退款详情页-->
	<!-- 取消订单 -->
	<div id="cancleDiv " class="alert-box ">
	    <input type="hidden " id="url "/>
		<div class="alert-title ">
			取消订单
			<a class="alert-close " href="javascript:void(0) "rel="nofollow "></a>
		</div>
		<div class="alert-con ">
			<div class="removetext o-cancel " id="notRefundAlert ">
				<p class="f16 " >房东规定：一旦支付，取消订单概不退款。</p>
				<p>你确定要取消订单吗？</p>				
			</div>
			<div class="removetext o-cancel " id="refundAlert ">
				<p class="t-center ">你确定要取消订单吗？</p>			
			</div>			
			<div class="btn-box ">
				<input type="button " class="warn-btn " name=" " value="确定 " onclick="processOrder(); ">
				<input type="button " id="cancleDivClose " class="gray-btn " name=" " value="以后再说 ">
			</div>
		</div>
	</div>
	<!-- 取消订单 END -->
	<!--试睡报告发送邮箱提示弹层-->
<div class='mark'></div>
<div class='yx_shishui_tan'>
	<span class="close_yx_tan "></span>
	<div class='yx_shishui_1'>
		<strong>撰写试睡报告</strong>
		<p>请按照以下要求整理好您的体验报告发送至marketing@mayi.com蚂蚁短租官方邮箱。待工作人员审核通过后，会短信与您取得联系进行房费返现 。</p>
	</div>
	<div class='yx_shishui_2'>
		<strong>报告要求</strong>
		<p>1. 报告标题：XX房源试睡报告（此处请填写房源编号）;</p>
		<p>2. 报告正文包括：用户基本情况、房源位置、装饰装修、卫生情况、小区环境、周边生活、房东服务;</p>
		<p>3. 体验报告要图文结合：每一部分都需要附上不少于1张的用户真实体验照片;</p>
		<p>4. 体验报告文字内容：不少于500字;</p>
		<p>5. 离店后5个工作日内发送即为有效，过期不接受审核。</p>
	</div>
</div>
	<!-- Footer -->
<script type="text/javascript " src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js "></script>
<script type="text/javascript " src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js "></script>
<script type="text/javascript " src="//staticnew.mayi.com/resourcesWeb/js/login.js "></script>

<script type="text/javascript ">
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
        path = path == " " ? " " : ";path=" + path;
        document.cookie = name + "=" + " ;expires=" + expires.toUTCString() + path;
    }

    //修正cookie中的MayiUserInfo
    var user = getCookie('MayiUserInfo');
    if (user != null) {
        var pattern = new RegExp(/^\" .+\ "$/);
        if (pattern.exec(user)) {
            user = user.substring(1,user.length-1);
            deleteCookie('MayiUserInfo', '/');
            document.cookie = "MayiUserInfo=" + escape(user) + " ;path=/;domain=.mayi.com ";
        }
    }
    //未登录的登录后才能显示站内信
});

function sinaWeibo(){
	window.open("http://widget.weibo.com/dialog/follow.php?fuid=2357071361 ");
}
</script>

<!--[statistics start]-->
	<!-- Footer END -->
<!-- 登录弹窗 -->
<div class="loginbox " id="loginboxdiv " nexturl="none " name="loginboxdiv " style="display:none; ">
	<a class="login-colse "  id="loginclose " name="loginclose " onClick=" " href="javascript:void(0) "></a>
    <div class="login-ways clearfloat ">
    	<div class="fl phone-account ">
            <ul class="c322c27 clearfloat f18 ">
                <li class="phoneway_current " id="changeloginbyma ">手机验证码登录</li>
                <li class="mayiway " id="changeloginbyup ">帐号密码登录</li>
            </ul>
            <div class="login-phone-account ">
            	<!-- 手机登陆 -->		
                <div class="login-input " id="loginbymadiv " name="loginbymadiv " >
	            	<input type="hidden " id="li_num " value="0 ">
	            	<input type="hidden " id="code_num " value="86 ">
	                <div class="input ">
	                    <span class="phone-icon "></span>
	                    <input class="dlargeinput " type="text " id="loginmobile " name="loginmobile " placeholder="手机号 " value=" " id="introduce "
	                    	onafterpaste="mobileRepAndSetPos(this,/[^\d.]/g, '') " onkeyup="mobileRepAndSetPos(this,/[^\d.]/g, '') " maxlength="11 "/>
	                    <div class="choice_phone_type ">
							<i code="86 ">+86</i>
							<span class="UP_down choice_nation_open "></span>
						</div>
	                </div>
	                <div class="nation_list ">
						<ul class="continent_list ">
							<li class=" ">亚洲</li>
							<li class=" ">欧洲</li>
							<li class=" ">美洲</li>
							<li class=" ">大洋洲</li>
						</ul>
						<ul class="nation_tel_list ">
							<!-- countrycode window-->
							<li style="display: block; ">
	<a href="javascript:void(0); " value="86 ">中国大陆&nbsp;&nbsp;+86</a>
	<a href="javascript:void(0); " value="82 ">韩国&nbsp;&nbsp;+82</a>
	<a href="javascript:void(0); " value="60 ">马来西亚&nbsp;&nbsp;+60</a>
	<a href="javascript:void(0); " value="81 ">日本&nbsp;&nbsp;+81</a>
	<a href="javascript:void(0); " value="66 ">泰国&nbsp;&nbsp;+66</a>
	<a href="javascript:void(0); " value="65 ">新加坡&nbsp;&nbsp;+65</a>
	<a href="javascript:void(0); " value="91 ">印度&nbsp;&nbsp;+91</a>
	<a href="javascript:void(0); " value="62 ">印度尼西亚&nbsp;&nbsp;+62</a>
	<a href="javascript:void(0); " value="84 ">越南&nbsp;&nbsp;+84</a>
	<a href="javascript:void(0); " value="853 ">中国澳门&nbsp;&nbsp;+853</a>
	<a href="javascript:void(0); " value="852 ">中国香港&nbsp;&nbsp;+852</a>
	<a href="javascript:void(0); " value="886 ">中国台湾&nbsp;&nbsp;+886</a>
</li>
<li style="display: none; ">
	<a href="javascript:void(0); " value="49 ">德国&nbsp;&nbsp;+49</a>
	<a href="javascript:void(0); " value="7 ">俄罗斯&nbsp;&nbsp;+7</a>
	<a href="javascript:void(0); " value="33 ">法国&nbsp;&nbsp;+33</a>
	<a href="javascript:void(0); " value="380 ">乌克兰&nbsp;&nbsp;+380</a>
	<a href="javascript:void(0); " value="34 ">西班牙&nbsp;&nbsp;+34</a>
	<a href="javascript:void(0); " value="39 ">意大利&nbsp;&nbsp;+39</a>
	<a href="javascript:void(0); " value="44 ">英国&nbsp;&nbsp;+44</a>
</li>
<li style="display: none; ">
	<a href="javascript:void(0); " value="55 ">巴西&nbsp;&nbsp;+55</a>
	<a href="javascript:void(0); " value="1 ">加拿大&nbsp;&nbsp;+1</a>
	<a href="javascript:void(0); " value="1 ">美国&nbsp;&nbsp;+1</a>
</li>
<li style="display: none; ">
	<a href="javascript:void(0); " value="61 ">澳大利亚&nbsp;&nbsp;+61</a>
	<a href="javascript:void(0); " value="64 ">新西兰&nbsp;&nbsp;+64</a>
</li>						</ul>
					</div>
	                <div class="largeinputbox small-top clearfix ">
	                    <div class="dinput fl " >
	                        <span class="verification-icon "></span>
	                        <input class="dsmallinput " type="text " id="imagecode " placeholder="图形验证码 " value=" "/>
	                    </div>
	                    <div class="yz-code fr ">
	                          <img src=" "  id="loginauthimage " title="点击刷新 " />
	                    </div>
	                </div>
	                <div class="largeinputbox small-top clearfix " id="maerrordiv ">
	                    <div class="dinput fl " id="maerrordiv ">
	                        <span class="password-icon "></span>
	                        <input class="dsmallinput " type="text " id="loginphonecode " name="loginphonecode " placeholder="短信验证码 " value=" "/>
	                    </div>
	                    <div class="yz-code fr ">
	                        <input class="sendnumber defaultsend " type="button " id="getloginphonecode " name="getloginphonecode " value="获取验证码 "/>
	                    </div>
	                </div>
	                <div class="logincheckbox large-top clearfix ">
	                    <label class="fl ">
	                        <input class="selectcheckbox " type="checkbox " name="rememberloginstate " checked="checked " value=" "/>自动登录
	                    </label>				
	                </div>	
	                <div class="logincheckbox large-top clearfix "><font>未注册的手机号将自动创建为蚂蚁短租帐户</font></div>
	                <div class="btn-wrap btnpdt20 ">
	                    <a href="javascript:void(0) " id="loginbymado ">登录</a>
	                </div>
            	</div>
            	<!-- 手机登陆 end  -->	
            	<!-- 密码登陆 start -->
	            <div class="login-input " id="loginbyupdiv " name="loginbyupdiv " style="display:none; ">
	            	<input type="hidden " id="li_num_1 " value="0 ">
	            	<input type="hidden " id="code_num_1 " value="86 ">
	                <div class="input ">
	                    <span class="user-icon "></span>
	                    <input class="dlargeinput " type="text " id="loginnamein " name="loginnamein "  placeholder="手机号/邮箱/账号 " value=" " autocomplete="off "/>
	                	<div class="choice_phone_type_1 ">
							<i tag="CN " code="86 ">+86</i>
							<span class="UP_down choice_nation_open "></span>
						</div>
	                </div>
	                <div class="nation_list_1 ">
						<ul class="continent_list_1 ">
							<li class=" ">亚洲</li>
							<li class=" ">欧洲</li>
							<li class=" ">美洲</li>
							<li class=" ">大洋洲</li>
						</ul>
						<ul class="nation_tel_list_1 ">
							<!-- countrycode window-->
<li style="display: block; ">
	<a href="javascript:void(0); " value="86 ">中国大陆&nbsp;&nbsp;+86</a>
	<a href="javascript:void(0); " value="82 ">韩国&nbsp;&nbsp;+82</a>
	<a href="javascript:void(0); " value="60 ">马来西亚&nbsp;&nbsp;+60</a>
	<a href="javascript:void(0); " value="81 ">日本&nbsp;&nbsp;+81</a>
	<a href="javascript:void(0); " value="66 ">泰国&nbsp;&nbsp;+66</a>
	<a href="javascript:void(0); " value="65 ">新加坡&nbsp;&nbsp;+65</a>
	<a href="javascript:void(0); " value="91 ">印度&nbsp;&nbsp;+91</a>
	<a href="javascript:void(0); " value="62 ">印度尼西亚&nbsp;&nbsp;+62</a>
	<a href="javascript:void(0); " value="84 ">越南&nbsp;&nbsp;+84</a>
	<a href="javascript:void(0); " value="853 ">中国澳门&nbsp;&nbsp;+853</a>
	<a href="javascript:void(0); " value="852 ">中国香港&nbsp;&nbsp;+852</a>
	<a href="javascript:void(0); " value="886 ">中国台湾&nbsp;&nbsp;+886</a>
</li>
<li style="display: none; ">
	<a href="javascript:void(0); " value="49 ">德国&nbsp;&nbsp;+49</a>
	<a href="javascript:void(0); " value="7 ">俄罗斯&nbsp;&nbsp;+7</a>
	<a href="javascript:void(0); " value="33 ">法国&nbsp;&nbsp;+33</a>
	<a href="javascript:void(0); " value="380 ">乌克兰&nbsp;&nbsp;+380</a>
	<a href="javascript:void(0); " value="34 ">西班牙&nbsp;&nbsp;+34</a>
	<a href="javascript:void(0); " value="39 ">意大利&nbsp;&nbsp;+39</a>
	<a href="javascript:void(0); " value="44 ">英国&nbsp;&nbsp;+44</a>
</li>
<li style="display: none; ">
	<a href="javascript:void(0); " value="55 ">巴西&nbsp;&nbsp;+55</a>
	<a href="javascript:void(0); " value="1 ">加拿大&nbsp;&nbsp;+1</a>
	<a href="javascript:void(0); " value="1 ">美国&nbsp;&nbsp;+1</a>
</li>
<li style="display: none; ">
	<a href="javascript:void(0); " value="61 ">澳大利亚&nbsp;&nbsp;+61</a>
	<a href="javascript:void(0); " value="64 ">新西兰&nbsp;&nbsp;+64</a>
</li>						</ul>
					</div>
	                <div class="input small-top " >
	                    <span class="password-icon "></span>
	                    <input class="dlargeinput " type="password " id="loginpassin " name="loginpassin " placeholder="密码 " value=" "/>
	                </div>
	                <div class="largeinputbox small-top clearfix " id="uperrordiv ">
	                    <div class="dinput fl " id="yui_3_5_1_1_1434542056373_108 ">
	                        <span class="verification-icon "></span>
	                        <input type="text " class="dsmallinput " id="imagecode1 " placeholder="图形验证码 " value=" ">
	                    </div>
	                    <div class="yz-code fr ">
	                          <img src=" " id="loginauthimage1 " title="点击刷新 ">
	                    </div>
	                </div>
	                <div class="logincheckbox large-top clearfix ">
	                    <label class="fl ">
	                        <input class="selectcheckbox " type="checkbox " name="rememberpass " checked="checked " value=" "/>自动登录
	                    </label>				
	                </div>	
	                <div class="btn-wrap btnpdt20 ">
	                    <a href="javascript:void(0) " id="loginbyupdo " _mayi_rp="web|condition|loginc ">登录</a>
	                </div>
	                <p class="otherwaytitle mt20 ">没有账号密码请 <a href="javascript:void(0) " id="changeloginbymwa ">使用手机验证码登录</a></p>
	            </div>
	            <!-- 密码登陆 end -->
            </div>
        </div>
        <div class="fl t-center third-party ">
        	<p class="f18 c322c27 mb20 ">其他登录方式</p>
            <ul class="otherway c322c27 ">
                <li class="wxway " id="loginbywx " _mayi_rp="web|condition|loginc ">微信登录</li>
                <li class="sinaway " id="loginbysina " _mayi_rp="web|condition|loginc ">微博登录</li>
                <li class="qqway " id="loginbyqq " _mayi_rp="web|condition|loginc ">QQ登录</li>
            </ul>
        </div>
    </div>
</div>	
<!-- 登录弹窗 END --> 
<!--公共尾部结束-->
<script type="text/javascript " src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js "></script>
<script type="text/javascript " src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js "></script>
<script type="text/javascript " src="//staticnew.mayi.com/resourcesWeb/js/loginpc.js "></script>

<script type="text/javascript ">
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
        path = path == " " ? " " : ";path=" + path;
        document.cookie = name + "=" + " ;expires=" + expires.toUTCString() + path;
    }

    //修正cookie中的MayiUserInfo
    var user = getCookie('MayiUserInfo');
    if (user != null) {
        var pattern = new RegExp(/^\" .+\ "$/);
        if (pattern.exec(user)) {
            user = user.substring(1,user.length-1);
            deleteCookie('MayiUserInfo', '/');
            document.cookie = "MayiUserInfo=" + escape(user) + " ;path=/;domain=.mayi.com ";
        }
    }
    //未登录的登录后才能显示站内信
});

function sinaWeibo(){
	window.open("http://widget.weibo.com/dialog/follow.php?fuid=2357071361 ");
}
</script>
<style type="text/css ">
.email{ position:fixed; bottom:0px; right:0px; width:190px; height:35px; line-height:35px; background:#e8e8e8; border:1px #CCCCCC solid; border-right:none; z-index:400000000;}
.email a{ padding-left:10px; float:left; font-weight:normal; font-family:"宋体 "; font-size:12px; width:120px; box-shadow:1px 0px 0px 0px #ccc; border-right:1px #fff solid;}
.email a img{ margin:12px 3px 0px 0px; float:left; width:16px; height:12px;}
.imjs-status{color:#55aa39 !important}
#webIM ul.tab-im .offline-icon,#webIM ul.tab-im .online-icon{background-position:0 !important}
#webIM .all-list a.on, #webIM .all-list a.off{background-position:-239px -297px !important;color:#2883C3 !important}
#webIM ul.tab-im a{color:#2883C3 !important}
</style> 
<script src="//tjs.sjs.sinajs.cn/open/api/js/wb.js " type="text/javascript " charset="utf-8 "></script>

</body>
</html>