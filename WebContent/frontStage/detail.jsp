<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns:wb="http://open.weibo.com/wb">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>【${homestay.accomAddress} 短租房】${homestay.accomTitle}_黄虫短租</title>
	<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/v201510/css/small-public.css" />
    <link href="//staticnew.mayi.com/resourcesWeb/v201510/css/public_element.css" rel="stylesheet">
	<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/details_new.css" rel="stylesheet" type="text/css" />
	<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/index_list_calendar.css" rel="stylesheet" type="text/css" />
	<link href="//staticnew.mayi.com/resourcesWeb/css/fdexperience/about-fyDetail.css" rel="stylesheet" type="text/css" />
	<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/landlordDesR.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/mayi_base.css" />
	<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/public.css"/>
	<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/jquery.bxslider.css" />

	<!-- 途家配套设施样式 -->
	<link
		href="//staticnew.mayi.com/resourcesWeb/v201510/css/tujia_facilitie.css"
		rel="stylesheet"/>
	
	
			
		<!--  -->
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>

<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"
			type="text/javascript" charset="utf-8"></script> 

	
			
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/jquery-migrate-1.1.1.js"></script>
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/v201510/js/commom.js"></script>
		<script type="text/javascript"
			src="//api.map.baidu.com/api?v=2.0&ak=1c4c84e6462fecb243831130f9db4098"></script>

		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/v201510/js/slidePic.js"></script>

		<script
			src="//staticnew.mayi.com/resourcesWeb/v201510/js/jssor.slider.min.js"></script>

		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/v201510/js/collect.js"></script>

		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/jquery.scrollfollow.js"></script>
		<!--日历-->
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/index/yui-min.js"></script>
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/v201510/js/calendar.js"></script>
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/moment.min.js"></script>
		<!-- zwb add -->
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/zebra_datepicker.js"></script>
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/jCal.hMCalendar.min.js"></script>
		<!--日历结束-->

		<style>
.table_pay_ul li.yajin_mayidianfu {
	position: relative;
	overflow: visible;
	white-space: normal
}

.yajin_mayidianfu .shuxingzhi {
	text-decoration: line-through
}

.yajin_mayidianfu .mayidianfu {
	width: auto;
	padding-left: 10px;
	color: #322c27
}

.des_tan {
	position: absolute;
	top: 6px;
	width: 15px !important;
	margin-left: 5px;
	height: 15px;
	background:
		url(http://staticnew.mayi.com/resourcesWeb/ordernew/images/bj2.png)
		no-repeat;
	background-position: 0 -20px;
	cursor: pointer
}

.deposit_detail_layer {
	border: 1px solid #e0e0e0;
	position: absolute;
	left: 290px;
	top: 28px;
	padding: 8px;
	width: 370px;
	background: #fff;
	color: #313442;
	box-shadow: 0 0 10px #e1e1e1;
	display: none;
}

.tri_rig {
	position: absolute;
	width: 0;
	height: 0;
	border-width: 6px;
	border-color: transparent transparent #e0e0e0 transparent;
	border-style: dashed dashed solid dashed;
	overflow: hidden;
	top: -12px;
	left: 103px
}

.tri_rig_b {
	position: absolute;
	width: 0;
	height: 0;
	border-width: 6px;
	border-color: transparent transparent #fffaf4 transparent;
	border-style: dashed dashed solid dashed;
	overflow: hidden;
	top: -11px;
	left: 103px
}

.zhehoujia {
	top: 18px;
}

.zhehoujia+.dInfo {
	top: 2px;
	color: #858585 !important;
	font-size: 14px;
	text-decoration: line-through;
}

.calendar-bounding-box .content-box {
	padding-bottom: 10px !important;
}

.zhe8 {
	color: #fb5e56;
	float: left;
	margin-left: 10px;
	box-sizing: border-box;
	margin-top: 3px;
}

.zhe8 span {
	width: 10px;
	height: 10px;
	background-color: #fb5e56;
	display: inline-block;
	line-height: 30px;
	margin-right: 3px;
}

.zhe8data {
	background-color: #fb736e;
}

.calendar-bounding-box td.zhe8data a {
	color: #fff;
}
</style>
		<script type="text/javascript">
			window.criteo_q = window.criteo_q || [];
			window.criteo_q.push({
				event: "setAccount",
				account: 28930
			}, {
				event: "setSiteType",
				type: "d"
			}, {
				event: "viewItem",
				item: ${homestay.accomId}
			});

			function criteoClick(flag) {

				var userName = $("#head_userName").val();
				//alert(userName);
				if(userName!=""){
				var d1 = $('#checkinday').val();
				var d2 = $('#checkoutday').val();
				var pric = $('#priceL').find('span').text();
				var datein = new Date(d1);
				var dateout = new Date(d2);
				var time = dateout.getTime() - datein.getTime();
				var days = Math.floor(time / (24 * 60 * 60 * 1000));
				var timestamp = new Date().getTime() + "" + Math.floor(Math.random() * 10) + Math.floor(Math.random() * 10);
				if(flag == "sale") {
					window.criteo_q.push({
						event: "setAccount",//设置账户ID事件参数
						account: 28930
					}, {
						event: "setSiteType",//设置网站版本参数
						type: "d"	//d表示台式机,m表示手机,t表示平板电脑
					}, {
						event: "trackTransaction",
						id: timestamp,
						item: [{
							id: ${homestay.accomId},
							price: pric,
							quantity: days
						}],
						checkin_date: d1,
						checkout_date: d2
					});
					location.href="bs.action?accomId=${homestay.accomId}&userId=${user.userId}&op=bookOrder&checkinday="+d1+"&checkoutday="+d2+"&orderId="+timestamp;
				} else {
					window.criteo_q.push({
						event: "setAccount",
						account: 28930
					}, {
						event: "setSiteType",
						type: "d"
					}, {
						event: "viewBasket",
						item: [{
							id: ${homestay.accomId},
							price: pric,
							quantity: days
						}],
						checkin_date: d1,
						checkout_date: d2
					});
				}
				}else{
					layer.alert("请先登录！",8,"温馨提示");
				}
			}
		</script>
		<script type="text/javascript">
			var domainInfo = {
				subdomain: '',
				mainsite: ''
			};
			$(function() {
				strBODY = ".date", dTop = 41, dLeft = -212;
				YUI({}).use('trip-calendar', function(Y) {
					var oCal = new Y.TripCalendar({
						minDate: new Date, //最小时间限制
						triggerNode: '#checkinday', //第一个触节点
						finalTriggerNode: '#checkoutday', //最后一个触发节点
						calPrice: 2,
						roomid: '851953993',
						minday: '1',
						ctx: '',
						sDiscount: ''
					});
					oCal.on('startDateChange', function(e) {
						$('#searchcityin_xq').val("1套");

					});
					oCal.on('endDateChange', function(e) {
						$('#searchcityin_xq').val("1套");
						ajaxPriceDetial();
					});
				});
				/*头部hover效果*/
				$(".showinfo").mouseover(function() {
					$(this).children('.head_pop').show();
				});
				$(".showinfo").mouseout(function() {
					$(this).children('.head_pop').hide();
				});

				$('.call-phone').hover(function(e) {
					$(this).siblings('.add_chat').show()
				}, function(e) {
					//e.stopPropagation();
					$(this).siblings('.add_chat').hide()
				})

				var oTime;
				$(".deposit .tab_tan").mouseover(function() {
					$(this).next(".deposit_info_div").show();
				}).mouseleave(function() {
					oTime = setTimeout(function() {
						$(".deposit_info_div").hide();
					}, 300)
				});
				$(".deposit_info_div").mouseover(function() {
					clearTimeout(oTime);
				}).mouseleave(function() {
					$(this).hide();
				});
				$(".facility_more a").click(function() {
					$(this).children('.tujia_more_btn').toggleClass('up_moreBtn');
					$(".facility_out_box").toggleClass("height_value");
				});
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".mp_down").click(function() {
					if($(".calendar_mp").css("display") == "none") {
						$(".calendar_mp").show();
						$(this).css("background-image", "url(//staticnew.mayi.com/resourcesWeb/images/shou.png)");
					} else {
						$(".calendar_mp").hide();
						$(this).css("background-image", "url(//staticnew.mayi.com/resourcesWeb/images/kai.png)");
					}
				});
			})

			function loginShow() {
				$("#loginshow").click();
			}
		</script>
		<style>
/*2016-10-11*/
.yx_alink {
	position: relative;
	left: 0;
	top: 4px;
	width: 78px;
	display: inline-block;
	height: 28px;
	margin-right: -10px;
	margin-top: -3px;
}

.yx_alink span {
	display: none;
	position: absolute;
	left: -6px;
	top: 42px;
	width: 300px;
	border: 1px solid #ccc;
	padding: 10px;
	background: #fff;
	z-index: 10;
	font-size: 14px;
	color: #322c27;
	line-height: 18px;
}

.yx_alink span:before, .yx_alink span:after {
	position: absolute;
	content: '';
	display: block;
	width: 0;
	height: 0;
	border-style: solid;
}

.yx_alink span:after {
	border-color: transparent transparent #fff;
	top: -10px;
	left: 50px;
	border-width: 0 8px 10px;
}

.yx_alink span:before {
	border-color: transparent transparent #ccc;
	top: -12px;
	left: 52px;
	border-width: 0 10px 12px;
}

.yx_alink:hover span {
	display: block;
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

.img_playPar {
	position: relative;
	left: 0;
	top: 0;
}

.bazhe_btn {
	position: absolute;
	left: 14px;
	top: 18px;
	z-index: 8;
	width: auto !important;
	cursor: pointer;
}

.main-r_1 {
	position: relative;
	left: 0;
	top: 0;
}

.bazhe_txt {
	position: absolute;
	left: 0;
	top: -28px;
	line-height: 28px;
	height: 28px;
	font-size: 12px;
	color: #ff5872;
	background: #fff8ed;
	width: 100%;
	text-align: center;
}

.main-2, .main-4 {
	background: #fff;
}

.main-3 .auto_m, .main-2 .auto_m {
	width: 100%;
}

.main-3, .main-2 {
	width: 832px;
}

.main-4 {
	width: 1190px;
}

.report_enter {
	padding-top: 10px;
	padding-bottom: 10px;
	line-height: 22px;
	float: left;
	width: 100%;
	text-align: center;
	background: #fff;
}

.report_enter a {
	color: #777776;
}

.report_enter a:hover {
	color: #22bb62;
}
</style>
</head>

<body>
	<!-- Header -->
	<!-- 拉新入口 -->
	<link
		href="//staticnew.mayi.com/resourcesWeb/v201612/headpub/css/laxin.css"
		rel="stylesheet" type="text/css">

		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/searchlist/index_searchlist_public.js"></script>
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/pub/list_header.js"></script>
		<!-- 拉新入口 -->
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/js/laxin.js"></script>
		<!-- 房东权限相关 -->
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/js/landlordConfig.js"></script>
		<script type="text/javascript">
			$(function() {
				$(".close-alert1").click(function() {
					$(".alert-box1").hide();
				})
			})

			function loginowner(userid) {

				var ctx = $('#ctx').val();
				$.get(ctx + "/user/checkFrozenAccount?frozenOwnerid=" + userid, function(re) {

					if(re == 1) {
						$(".alert-box1").show();
					} else {
						var ctx = $('#ctx').val();
						location.href = ctx + "/landlord/" + userid + "/orders";
					}
				});
			}

			function publish(userid) {
				var ctx = $('#ctx').val();
				$.get(ctx + "/user/checkFrozenAccount?frozenOwnerid=" + userid, function(re) {
					if(re == 1) {
						$(".alert-box1").show();
					} else {
						$.get(ctx + "/room/publish/checkOfflineRoom", function(re) {
							if(re.status == 1) {
								layer.alert("您正处于违规下线期间，无法发布新房源", 5);
								return false;
							} else {
								var ctx = $('#ctx').val();
								location.href = ctx + "/room/publish/basicinfo";
							}
						});
					}
				});
			}

			function menufrozen(userid, url, frozentype) {

				var ctx = $('#ctx').val();
				var furl = ctx + "/user/checkFrozenAccount?frozenOwnerid=" + userid;
				if(frozentype == "user") {
					furl += "&frozentype=" + frozentype;
				}
				$.get(furl, function(re) {
					if(re == 1) {
						if(frozentype == 'user') {
							$(".frozeninfo").text("对不起，用户账号被封禁");
						}
						$(".alert-box1").show();
					} else {
						location.href = url;
					}
				});
			}

			function getSuggest(e) {
				var s = $('#searchcityin').val().trim();
				var ctx = $('#ctx').val();
				if(!e) var e = window.event;
				var code = e.keyCode;
				if(code == 27) {
					$('.error_tip_list').css('display', 'none');
					$('.suggest_results').css('display', 'none');
					return false;
				}
				if(code == 13 || code == 37 || code == 38 || code == 39 || code == 40) {
					return false;
				}
				if(null != s && s.length > 0 && s != '目的地、城市') {
					var sugurl = ctx + '/getSuggest';
					getSuggestResult(sugurl, s, 0, 'header');
				} else {
					$('.error_tip_list').html('请输入关键字');
					$('.error_tip_list').css('display', 'block');
					$('.suggest_results').css('display', 'none');
				}
			}

			function pressEve(e) {
				var e = e || window.event;
				var code = e.keyCode;
				var sugcss = $('.suggest_results').css('display');

				if(sugcss != 'none') {
					if(code == 13) {
						doSearch();
					} else if(code == 38) {
						movePrev();
					} else if(code == 40) {
						moveNext();
					}
				}
			}
		</script>
		<style>
.logo58 {
	background:
		url(//staticnew.mayi.com/resourcesWeb/images/index/58logo.png)
		no-repeat;
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

.error_tip_list {
	background-color: #fff;
	color: #ff7043;
	width: 71%;
	line-height: 40px;
	text-indent: 15px;
	position: absolute;
	top: 60px;
	border: 1px solid #e0e0e0;
	z-index: 9;
	display: none;
}

.error_tip_list .other_city {
	border-top: 1px solid #e0e0e0;
	height: 42px;
	line-height: 42px;
	text-align: center;
	color: #5d5c5b;
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
	font-weight: bold;
}

span.search {
	display: block;
}
/*搜索样式*/
.suggest_results li label {
	position: absolute;
	right: 10px;
	margin-top: -6px;
}

.suggest_results li.tit_about a {
	color: #000;
}

.suggest_results li.address_about a {
	color: #000;
}

.suggest_results li.hover a, .suggest_results li:hover a {
	color: #fff;
}

.suggest_results li.hover .c22bb62, .suggest_results li:hover .c22bb62 {
	color: #fff;
}

.suggest_results li.address_about {
	padding-right: 12px;
}

.suggest_results li {
	cursor: pointer
}

.suggest_results li.have_label {
	border-top: 1px solid #e0e0e0;
}

.suggest_results li label {
	float: right;
	min-width: 20px;
	min-height: 20px;
}

.suggest_results li label i {
	width: 23px;
	height: 21px;
	display: inline-block;
	background:
		url(http://staticnew.mayi.com/resourcesWeb/images/suggest_icon.png)
		no-repeat;
	background-size: 46px 294px;
	position: relative;
	top: 4px;
	margin-left: 10px;
}

.suggest_results li .tit_icon {
	background-position: 0 -210px;
}

.suggest_results li .address_icon {
	background-position: 0 -168px;
}

.suggest_results li .city_icon {
	background-position: 0 0px;
}

.suggest_results li .arim_icon {
	background-position: 0 -21px;
}

.suggest_results li .regions_icon {
	background-position: 0 -42px;
}

.suggest_results li .street_icon {
	background-position: 0 -63px;
}

.suggest_results li .views_icon {
	background-position: 0 -84px;
}

.suggest_results li .circle_icon {
	background-position: 0 -105px;
}

.suggest_results li .subway_icon {
	background-position: 0 -126px;
}

.suggest_results li .station_icon {
	background-position: 0 -252px;
	width: 46px;
}

.suggest_results li .hospital_icon {
	background-position: 0 -147px;
}

.suggest_results li .school_icon {
	background-position: 0 -231px;
}

.suggest_results li .minsu_icon {
	background-position: 0 -210px;
}

.suggest_results li.hover .tit_icon, .suggest_results li:hover .tit_icon
	{
	background-position: -23px -210px;
}

.suggest_results li.hover .address_icon, .suggest_results li:hover .address_icon
	{
	background-position: -23px -168px;
}

.suggest_results li.hover .city_icon, .suggest_results li:hover .city_icon
	{
	background-position: -23px 0px;
}

.suggest_results li.hover .arim_icon, .suggest_results li:hover .arim_icon
	{
	background-position: -23px -21px;
}

.suggest_results li.hover .regions_icon, .suggest_results li:hover .regions_icon
	{
	background-position: -23px -42px;
}

.suggest_results li.hover .street_icon, .suggest_results li:hover .street_icon
	{
	background-position: -23px -63px;
}

.suggest_results li.hover .views_icon, .suggest_results li:hover .views_icon
	{
	background-position: -23px -84px;
}

.suggest_results li.hover .circle_icon, .suggest_results li:hover .circle_icon
	{
	background-position: -23px -105px;
}

.suggest_results li.hover .subway_icon, .suggest_results li:hover .subway_icon
	{
	background-position: -23px -126px;
}

.suggest_results li.hover .station_icon, .suggest_results li:hover .station_icon
	{
	background-position: 0px -273px;
}

.suggest_results li.hover .hospital_icon, .suggest_results li:hover .hospital_icon
	{
	background-position: -23px -147px;
}

.suggest_results li.hover .school_icon, .suggest_results li:hover .school_icon
	{
	background-position: -23px -231px;
}

.suggest_results li.hover .minsu_icon, .suggest_results li:hover .minsu_icon
	{
	background-position: -23px -210px;
}

.icon_after:after {
	content: "|";
	padding: 0 1px 0 5px;
	position: relative;
	top: -1px;
}

.icon_after:last-child:after {
	content: "";
	padding: 0;
}

.room_city {
	color: #b4b9bf;
}

.sug_room_tip {
	color: #b4b9bf;
	height: 65px;
	line-height: 65px;
	border-top: 1px solid #e0e0e0;
}

.suggest_results {
	background-color: #fff;
	color: #22bb62;
	top: 60px;
	position: absolute;
	width: 71%;
	z-index: 9;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
	display: none;
}

.suggest_results li {
	padding: 10px 15px;
}

.suggest_results li.hover, .suggest_results li:hover {
	background-color: #22bb62;
}

.suggest_results li.hover a, .suggest_results li.hover a .rightspan,
	.suggest_results li.hover a .leftspan .keyword {
	color: #fff;
}

.suggest_results li a {
	display: block;
	width: 100%;
	color: #322c27;
}

.suggest_results .other_city {
	height: 42px;
	line-height: 42px;
	text-align: center;
	color: #5d5c5b;
	border-top: 1px solid #ebeaea;
	border-bottom-left-radius: 2px;
	border-bottom-right-radius: 2px;
}
/*搜索样式结束*/
</style>
		<input type="hidden" name="ctx" id="ctx" value="" />
		
		<div class='header relave'>

			<div class='head_cnt relave'>
				<a href="/HuangChongProject/frontStage/index.jsp">
				<span style="text-align: left;font-size: 30px;color: #009900;font-weight: bolder;width: 80%;position: absolute;">黄虫短租</span>			
					</a>
				<ul class="nav_R asote nav_right">
					<li style="margin-left: -211px;"><b class="mayi_tel_top"><img
							src="//staticnew.mayi.com/resourcesWeb/v201510/images/commom/tel_green_icon.png"/><span
								style="font-family: &amp; quot; Hiragino Sans GB&amp;quot; , Arial , Verdana, Tahoma, &amp;quot; 微软雅黑 &amp;quot; ! important; font-size: 14px;"
								hiragino="" sans="" gb",="" arial,="" verdana,="" tahoma,=""
								"微软雅黑"="" !important;font-size:="" 14px;"="">客服电话：</span>400-028-6868</b>
					</li>
					<li class="ml20 user-action">
						<div class="login-btn t-center fw600 cursorpt " id="loginshow">登录/注册</div>
						<div class="login-info f0 " style="display: none;">
		                        <p class="top-line"></p>
	         
	                            <img class="user-head circle" width="45px" height="45px" src="${user!=null?user.imgUrl:' '}" alt="头像"/>
	                            <span class="f14 fw600 ver-t">${sessionScope.user.nickName}</span>
	                            <ul class="hover-list radius-6" style="display: none;" id="info">
	                                <li class="t-left mb15 theme">
	                                    <a class="f16 fw600 c_gray_dark" href="#">我是房客</a>
	                                </li>
	                                <li class="t-left ">
	                                    <a class="c_gray_dark mr40" href="${pageContext.request.contextPath }/frontStage/ordersinfo.jsp">我的订单</a>
	                                   
	                                </li>	                     
	                               <li class="t-left ">
	                       
	                                    <a class="c_gray_dark" href="${pageContext.request.contextPath }/frontStage/userinfo.jsp">我的账户</a>
	                                </li>
	                                  <li class="t-left ">
			                                    <a class="c_gray_dark mr40" href="${pageContext.request.contextPath }/frontStage/landlordOrder.jsp">房东订单管理</a>
			                                   
			                          </li>	
			                           <li class="t-left ">
			                                 
			                                    <a class="c_gray_dark" href="${pageContext.request.contextPath }/frontStage/landlordPublish.jsp">房东房源管理</a>
			                                </li>
			                                
	                                <hr class="mb15">
	                       
	                                <li>
	                                    <div class="login-out" id="loginoutbut">退出登录</div>
	                                </li>
	                            </ul>
	                        </div>
					</li>

					<li> </li>
				</ul>
			</div>

		</div>
	<!--公共头部结束-->
	<div class="alert-box1">
		<div class="surveYY1"></div>
		<div class="offmax_no">
			<div class="alert_tit1">温馨提示</div>
			<p>对不起，房东账号被封禁</p>
			<p>如有疑问，请联系黄虫短租客服400-028-6868</p>
			<div class="close-alert1">我知道了</div>
		</div>
	</div>
	<input type="hidden" name="subdomain" id="subdomain" value="" />
	<input type="hidden" name="mainsite" id="mainsite" value="" />
	<input type="hidden" name="ctx" id="ctx" value="" />
	<input type="hidden" name="ctx1" id="ctx1" value="//staticnew.mayi.com" />
	<input type="hidden" name="uid" id="uid" value="870129001" />
	<input type="hidden" name="loginurl" id="loginurl" value="none" />
	<input type="hidden" name="head_userName" id="head_userName"
		value="${user.userName }"> <script type="text/javascript">
			$(document).ready(function() {
				var userName = $("#head_userName").val();
				if(userName != '' && userName.length > 0) {
					var realLength = 0;
					var len = userName.length;
					var charCode = -1;
					for(var i = 0; i < len; i++) {
						charCode = userName.charCodeAt(i);
						if(charCode >= 0 && charCode <= 128) {
							realLength += 1;
						} else {
							realLength += 2;
						}
						if(realLength > 20) {
							$("#head_nickname").html(userName.substring(0, i) + "...");
							break;
						}
					}
					if(realLength <= 20) {
						$("#head_nickname").html(userName);
					}
				}

			});
		</script> <script type='text/javascript'
			src='//webchat.7moor.com/javascripts/7moorInit.js?accessId=73859f20-f357-11e6-b43e-3b18b16942dc&autoShow=false'
			async='async'></script> <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:wb="http://open.weibo.com/wb">

<head>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/c.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/sdk/strophe.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/sdk/easemob.im-1.1.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/sdk/easemob.im-1.1.shim.js"></script>
<script type='text/javascript'
	src='//staticnew.mayi.com/resourcesWeb/im1/easemob.im.config.js'></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/bootstrap.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/add_reply.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/jquery-ui.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/IM.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/account/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/operator.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/webim.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/im1/chat.js"></script>
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/im/css/IM.css" />
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/im/css/jquery-ui.css" />

<!-- 		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/swfupload2/swfupload.js"></script>  -->
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/swfupload2/plugins/swfupload.queue.js?v=20160225"></script>

</head>

<body>
	<input type="hidden" id="MAYIUID" value="870129001" />

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


	<!-- Header END -->

	<!--初始化公用值结束-->
	<div class="main">
		<!--导航条-->
		<div class="desChioce" id="desChioce01">
			<ul class='clearfloat'>
				<li class="current"><a href='javascript:;'>图片</a></li>
				<li><a href="javascript:;">关于房源</a></li>
				<li><a id="pjskip" ; href="javascript:;">评价</a></li>
				<li><a href="javascript:;">地图</a></li>
				<li class="price clearfloat fr relave"
					id="yui_3_5_1_1_1450765892279_80">
					<div class="priceL" id="priceL">
						￥<span id="price" name="price">${homestay.price}</span>/晚
					</div>
					<div class='suding'>
						<img
							src="//staticnew.mayi.com/resourcesWeb/images/v2016/suding_icon.png"
							alt="速订房源" class='suding_icon' />
						<div class="suding_tan">
							<p class='c22bb62'>速订房源</p>
							<p>无需房东确认，支付后即预定成功</p>
						</div>
					</div>

				</li>
			</ul>
		</div>
		<!--导航条结束-->
		<div class="path">
			<a href="${pageContext.request.contextPath}/frontStage/index.jsp">首页</a>&nbsp;>&nbsp; <a href="#">${homestay.accomArea}</a>&nbsp;>&nbsp;
			<a href="#">${homestay.accomAddress}</a>&nbsp;>&nbsp; <a
				style="color: #999">${homestay.accomTitle}</a>
			<link rel="stylesheet"
				href="//staticnew.mayi.com/resourcesWeb/laxin/css/details_laxin.css" />

		</div>
		<!--详情页第一部分左边-->
		<div class="main-l clearfloat" id='photo'>
			<div class="desWord">
				<h2>
					<a href="#" rel="nofollow">${homestay.accomTitle}</a> <a href="#"
						class='yx_alink'> <img
						src="//staticnew.mayi.com/resourcesWeb/topic/2016/yzfy/images/level9-2_1.png"
						style="height: 44px; display: inline-block; vertical-align: middle; cursor: pointer; position: absolute; margin-right: -6px;">
							<span>“黄虫优选”认证是由黄虫短租开创建立的行业新标准，具备3大品质体系、9大服务标准、27项安心保障。住黄虫优选房，设施全、服务佳、品质高！</span></a>
					<div class="biaoqian">

						<span class='shipai_1' title='照片均为黄虫短租员工实地拍摄，请放心入住'>实拍</span> <span
							class='kezuofan_3' title=''>可做饭</span>
					</div>

				</h2>
				<p>${homestay.accomAddress}
					<a rel="nofollow" href="javascript:;" class='look_map'>查看地图</a>
				</p>


			</div>
			<div class='fl img_playPar'>
				<!--房屋轮播图-->
				<div class="desTop fl">

					<!--图片轮播-->
					<div style="position: relative;">

						<div class="picmap-change">
							<!-- 夜宵折扣标签！！ -->
							<div id="TabChangeCon_01" class="change-list">
								<div class="picbox">
									<ul class="piclist">
										<li><a href="#"><img
												src="${pageContext.request.contextPath }/../img/${homestay.accomId}/1.jpg"
												alt="" /></a></li>
										<li><a href="#"><img
												src="${pageContext.request.contextPath }/../img/${homestay.accomId}/2.jpg"
												alt="" /></a></li>
										<li><a href="#"><img
												src="${pageContext.request.contextPath }/../img/${homestay.accomId}/3.jpg"
												alt="" /></a></li>
										<li><a href="#"><img
												src="${pageContext.request.contextPath }/../img/${homestay.accomId}/4.jpg"
												alt="" /></a></li>
										<li><a href="#"><img
												src="${pageContext.request.contextPath }/../img/${homestay.accomId}/5.jpg"
												alt="" /></a></li>
										<li><a href="#"><img
												src="${pageContext.request.contextPath }/../img/${homestay.accomId}/6.jpg"
												alt="" /></a></li>
										<li><a href="#"><img
												src="${pageContext.request.contextPath }/../img/${homestay.accomId}/7.jpg"
												alt="" /></a></li>




									</ul>
									<a id="big_play_prev" class="home-picprev" href="#"
										style="cursor: url(//staticnew.mayi.com/resourcesWeb/images/detail/mouseup.cur), auto; background: #fff; opacity: 0; filter: alpha(opacity = 0)">i</a>
									<a id="big_play_next" class="home-picnext" href="#"
										style="cursor: url(//staticnew.mayi.com/resourcesWeb/images/detail/mousedown.cur), auto; background: #fff; opacity: 0; filter: alpha(opacity = 0)"></a>
								</div>
								<div class="picsmallbox">
									<div class="picboxpic">
										<ul id="picsmall" class="picsmall clearfix">
											<li class="slideshow-item"><a href="#"><img
													src="${pageContext.request.contextPath }/../img/${homestay.accomId}/1.jpg"
													alt="" /></a></li>
											<li class="slideshow-item"><a href="#"><img
													src="${pageContext.request.contextPath }/../img/${homestay.accomId}/2.jpg"
													alt="" /></a></li>
											<li class="slideshow-item"><a href="#"><img
													src="${pageContext.request.contextPath }/../img/${homestay.accomId}/3.jpg"
													alt="" /></a></li>
											<li class="slideshow-item"><a href="#"><img
													src="${pageContext.request.contextPath }/../img/${homestay.accomId}/4.jpg"
													alt="" /></a></li>
											<li class="slideshow-item"><a href="#"><img
													src="${pageContext.request.contextPath }/../img/${homestay.accomId}/5.jpg"
													alt="" /></a></li>
											<li class="slideshow-item"><a href="#"><img
													src="${pageContext.request.contextPath }/../img/${homestay.accomId}/6.jpg"
													alt="" /></a></li>
											<li class="slideshow-item"><a href="#"><img
													src="${pageContext.request.contextPath }/../img/${homestay.accomId}/7.jpg"
													alt="" /></a></li>


										</ul>
									</div>

									<a id="play_prev" class="play-prev" href="#"></a> <a
										id="play_next" class="play-next" href="#"></a>
									<div class="translucence"></div>
								</div>
							</div>
							<div id="TabChangeCon_02" class="change-list">
								<div id="mapDiv"></div>
							</div>
						</div>
					</div>
				</div>
				<!--图片轮播结束-->

				<div class="feature">
					<ul class='clearfloat'>
						<li>
							<div class='clearfloat feature_chansu'>
								<img
									src="//staticnew.mayi.com/resourcesWeb/v201510/images/room_ping.png"
									class='fl' /> <span class='fl'>整套出租</span>
							</div>
							<p>${homestay.houseType }室</p>
						</li>
						<li class="w258">
							<div class='clearfloat feature_chansu'>
								<img
									src="//staticnew.mayi.com/resourcesWeb/v201510/images/ruzhu.png"
									class='fl' /> <span class='fl'>可住${homestay.houseType }人</span>
							</div>
							<p>
								<span>不可加床</span>

							</p>
						</li>
						<li id="feature_chansu"></li>
					</ul>
				</div>
			</div>
			<!--右侧预订信息-->
			<div class='main-r_1'>
				<div class="order">
					<div class="price clearfloat relave">
						<div class="clearfloat">
							<div class="priceL" id="priceL">
								￥<span id="price" name="price">${homestay.price }</span>/晚
							</div>
							<div class='suding'>
								<img
									src="//staticnew.mayi.com/resourcesWeb/images/v2016/suding_icon.png"
									alt="速订房源" class='suding_icon' />
								<div class="suding_tan">
									<p class='c22bb62'>速订房源</p>
									<p>无需房东确认，支付后即预定成功</p>
								</div>
							</div>
						</div>
						<div class="priceR">
							<span class='p2'>欢迎入住</span>
						</div>
					</div>
					<!-- 右侧日期显示区域 -->
					<div class='date_par clearfloat'>
						<div class="date fl relave inputfliter">
							<div>
								<div id="timeL" class="inputfliterL">
									<label class="stclick" for="checkinday"></label><input
										id="checkinday" name="checkinday" type="text" class="f-text"
										value="2018-10-09" autocomplete="off" readonly="readonly" />
								</div>
							</div>
							<div class='fl riq'>至</div>
							<div>
								<div id="timeR" class="inputfliterR">
									<label class="stclick" for="checkoutday"></label><input
										id="checkoutday" name="checkoutday" type="text" class="f-text"
										value="2018-10-10" autocomplete="off" readonly="readonly" />
								</div>
							</div>
						</div>
						<div class="number" onclick="openDialog(event)">
							<a href="javascript:void(0);"><img
								src="//staticnew.mayi.com/resourcesWeb/images/detail/daosanjiao.png"></a>
							<input name="searchcityin_xq" id="searchcityin_xq" value="1套"
								class="stclick" clicktag="2_1" type="text" readonly="true">
						</div>
						<div class="xiala" id="xiala">
							<ul>
								<li><a href="javascript:void(0);" id="stock1">1套</a></li>
							</ul>
						</div>
					</div>

					<div class="discountPrice clearfloat" id="discountTotal"></div>
					<p class="nofang"
						style="color: #f00; font-size: 16px; line-height: 40px; padding-left: 20px; margin-bottom: 10px; display: none">改日期内有无房状态，请更改日期</p>
					<div class="pay">
						<input type="hidden" value="no" id="hidden_comefrom"> <a
							id="goBookBtn" href="javascript:;" rel="nofollow"
							onclick="criteoClick('sale');">立即预订</a>
					</div>

				</div>
				<!--查看有无房-->
				<div class="calendarM" id="calendarM" style="display: none"></div>
				<!--房东信息-->
				<div class="landlord">
					<div class="landlordDes">
						<div class="landlordDesL">
							<img rel="nofollow"
								src="${pageContext.request.contextPath}/../${fd.headImage}"
								alt="" />
							<div></div>
						</div>
						<div class="landlordDesR">
							<font>${homestay.accomTitle }</font>

							<p class='renzheng'>
								<span class='relave' style='margin-right: 16px'><i
									class='absot renzheng1'></i>身份认证</span> <span class='relave'><i
									class='absot renzheng2'></i>手机认证</span>
							</p>
							<!-- 更改按钮 -->


						</div>
						<div class="addMid clearfloat">
							<p>
								<b>回复率</b> <b><span id="responseRatio"></span></b>
							</p>
							<p class='reply_time'>
								<b>订单确认时间</b> <b><span id="confirmMinute"></span></b>
							</p>
							<p>
								<b>收到评价</b> <b id="add_hom"><span id="landLordCommentCnt">${pd.total}条</span></b>
							</p>
						</div>

					</div>
				</div>

			</div>
			<!--右侧预订信息结束-->
		</div>
		<!--详情页第一部分结束-->
		<!--详情页第二部分开始-->
		<div class="w1190">
			<div class='main-2' id="room">
				<div class='auto_m'>
					<!--文字内容开始-->
					<div class='intro_par'>
						<!--房源介绍开始-->
						<a href="#roomInfo" name="roomInfo"></a>
						<div class="intro padding_t clearfloat" name="roomInfo">
							<h4 class='fl fl_room lineH18'>房源介绍</h4>
							<div class='fl fl_p relave room_jies'>
								<div class='room_he'>
									${homestay.accomIntro } <br>
								</div>

							</div>
						</div>
						<!--基本信息-->
						<div class="intro padding_t clearfloat">
							<!--表格介绍-->
							<h4 class="updetail fl_room fl">基本信息</h4>
							<ul class="table fl fl_p">
								<li>房源类型：</b><span class="shuxingzhi">公寓</span></li>
								<li>卫生间： <span class="shuxingzhi"> 1 </span>
								</li>
								<li>被单更换：<span class="shuxingzhi">每客一换</span></li>
								<li>大床(2×1.5米)： <span class="shuxingzhi"> 1张 </span>
								</li>
								<li>双人沙发床(2×1.5米)： <span class="shuxingzhi"> 1张 </span>
								</li>
								<li>能否加床：<span class="shuxingzhi">不能</span></li>
							</ul>
						</div>
						<!--配套设施-->
						<div class="intro sup_fac padding_t clearfloat">
							<div class="facility_out_box height_value clearfloat">
								<h4 class="fo_free fl_room fl">配套设施</h4>
								<div class="facility_list">
									<h3>居家</h3>
									<ul class="clearfloat relave facility_ul">
										<li><span class="absot fac_span facility_wifi"></span>无线网络
										</li>
										<li><span class="absot fac_span facility_ds"></span>电视</li>
										<li><span class="absot fac_span facility_kt"></span>空调</li>
										<li><span class="absot fac_span facility_bx"></span>冰箱</li>
										<li><span class="absot fac_span facility_xyj"></span>洗衣机
										</li>
										<li><span class="absot fac_span facility_nq"></span>暖气</li>
										<li><span class="absot fac_span facility_jsq"></span>加湿器
										</li>
										<li><span class="absot fac_span facility_yxwl"></span>有线网络
										</li>
										<li><span class="absot fac_span facility_drsh"></span>电热水壶
										</li>
										<li><span class="absot fac_span facility_cfj"></span>吹风机
										</li>
										<li><span class="absot fac_span facility_qtrs"></span>24小时热水
										</li>
										<li><span class="absot fac_span facility_lyj"></span>晾衣架
										</li>
										<li><span class="absot fac_span facility_xyy"></span>洗衣液/粉
										</li>
										<li><span class="absot fac_span facility_dsgj"></span>打扫工具
										</li>
									</ul>
								</div>
								<div class="facility_list">
									<h3>洗浴用品</h3>
									<ul class="clearfloat relave facility_ul">
										<li><span class="absot fac_span facility_dlwy"></span>独立卫浴
										</li>
										<li><span class="absot fac_span facility_xfs"></span>沐浴露洗发水
										</li>
										<li><span class="absot fac_span facility_yj"></span>牙具</li>
										<li><span class="absot fac_span facility_mj"></span>毛巾</li>
										<li><span class="absot fac_span facility_yujin"></span>浴巾
										</li>
										<li><span class="absot fac_span facility_tx"></span>拖鞋</li>
										<li><span class="absot fac_span facility_xz"></span>香皂/洗手液
										</li>
										<li><span class="absot fac_span facility_wsz"></span>卫生纸
										</li>
									</ul>
								</div>
								<div class="facility_list">
									<h3>餐厨</h3>
									<ul class="clearfloat relave facility_ul">
										<li><span class="absot fac_span facility_cj"></span>餐具</li>
										<li><span class="absot fac_span facility_prgj"></span>烹饪锅具
										</li>
										<li><span class="absot fac_span facility_djcb"></span>刀具菜板
										</li>
										<li><span class="absot fac_span facility_dfb"></span>电饭煲
										</li>
										<li><span class="absot fac_span facility_dcl"></span>电磁炉
										</li>
										<li><span class="absot fac_span facility_wbl"></span>微波炉
										</li>
										<li><span class="absot fac_span facility_skqj"></span>烧烤器具
										</li>
										<li><span class="absot fac_span facility_tl"></span>调料</li>
										<li><span class="absot fac_span facility_xtyj"></span>洗涤用具
										</li>
									</ul>
								</div>
								<div class="facility_list">
									<h3>安全</h3>
									<ul class="clearfloat relave facility_ul">
										<li><span class="absot fac_span facility_ba"></span>保安</li>
										<li><span class="absot fac_span facility_znms"></span>智能门锁
										</li>
										<li><span class="absot fac_span facility_mjxt"></span>门禁系统
										</li>
										<li><span class="absot fac_span facility_mhq"></span>灭火器
										</li>
									</ul>
								</div>
								<div class="facility_list">
									<h3>建筑</h3>
									<ul class="clearfloat relave facility_ul">
										<li><span class="absot fac_span facility_ch"></span>窗户</li>
										<li><span class="absot fac_span facility_dt"></span>电梯</li>
										<li><span class="absot fac_span facility_ygf"></span>阳光房
										</li>
										<li><span class="absot fac_span facility_gjlt"></span>观景露台
										</li>
									</ul>
								</div>
								<div class="facility_list">
									<h3>周边（500米内）</h3>
									<ul class="clearfloat relave facility_ul">
										<li><span class="absot fac_span facility_ct"></span>餐厅</li>
										<li><span class="absot fac_span facility_cs"></span>超市</li>
										<li><span class="absot fac_span facility_yd"></span>药店</li>
										<li><span class="absot fac_span facility_tkj"></span>提款机
										</li>
										<li><span class="absot fac_span facility_csc"></span>菜市场
										</li>
									</ul>
								</div>
							</div>
							<div class="facility_more facility_list">
								<a href="javascript:;" class="relave"><span>更多</span><i
									class="absot tujia_more_btn"></i></a>
							</div>
						</div>
						<!--提供服务-->
						<!--特色服务-->
						<!--收费说明-->
						<div class="intro padding_t clearfloat">
							<h4 class="updetail fl_room fl" id="room">收费说明</h4>
							<ul class="table fl fl_p ruzhu_marT">
								<li class='pay_proportion'>预付订金：<span class="shuxingzhi">100%</span>&nbsp;&nbsp;<b>提交订单后，支付总房费的100%作为预付订金交付黄虫平台</b></li>
								<li class='pay_proportion'>退款政策： <span
									class="shuxingzhi C-ff5d52"> <span
										class="shuxingzhi C-ff5d52 zhu_rule relave"> 入住前<span>7</span>天取消，全额退款<i
											class='more_btn_green absot'></i>
									</span>
								</span>
								</li>
								<div class="c_bar_box" style="height: 35px;">
									<div class="new_bar_box"
										style="margin-top: 85px; display: block;">
										<div class="new_tip_bar1 new_position1">
											<p>
												入住日前<i class="time_day">7</i>天
											</p>
											<i>12:00</i>
											<p></p>
										</div>
										<div class="new_tip_bar2 new_position3">
											<p>退房当天</p>
											<i>12:00</i>
										</div>
										<div class="c_sanj new_position7 asote">
											<p class="sanj asote"></p>
											如取消订单，全额退款
										</div>
										<div class="c_sanj new_position9 asote">
											<p class="sanj asote"></p>
											如取消订单，扣除未住房费的50%
										</div>
									</div>
								</div>
								<li class="pay_proportion deposit"><span> <strong>押金：</strong>
										<span class=" "> 面议</span></span> <b class="relave">与房东商议决定是否支付及支付金额</b>
								</li>
								<!-- 其他费用 -->
								<li class='mt15 table_pay'><strong class='shuxingzhi'>以下费用由房东线下额外收取，不包含在房费中。</strong>
									<ul class='table table_pay_ul'>
										<li style="color: #322c27;"><strong style="width: auto;">做饭：</strong><span
											class="">&nbsp;饭后厨房请打扫干净，否则加收60元保洁费用。;</span></li>
										<li style="color: #322c27;"><strong style="width: auto;">打扫卫生：</strong><span
											class="">&nbsp;1客1扫;</span></li>
										<li style="color: #322c27;"><strong style="width: auto;">被单更换：</strong><span
											class="">&nbsp;1客1换;</span></li>
										<li style="color: #322c27;"><strong style="width: auto;">牙具更换：</strong><span
											class="">&nbsp;1客1换;</span></li>
										<li style="color: #322c27;"><strong style="width: auto;">毛巾/浴巾更换：</strong><span
											class="">&nbsp;1客1换。</span></li>
									</ul> <span>温馨提示：房东提供的服务可能会收费，不在以上费用中。请谨慎核对，以免发生纠纷。</span></li>

							</ul>
						</div>
						<!--入住须知-->
						<div class="intro padding_t clearfloat">
							<h4 class="updetail fl_room fl" id="room">入住须知</h4>
							<ul class="table fl fl_p ruzhu_marT">
								<li>接待时间：<span class="shuxingzhi">00:00-24:00</span></li>
								<li>最少入住：<span class="shuxingzhi">1天</span><b
									class='C-ff5d51 calendarB'>查看可租状态</b></li>
								<li>退房时间：<span class="shuxingzhi">12:00以前</span></li>
								<li>最多入住：<span class="shuxingzhi">180天</span></li>
								<li>入住时间：<span class="shuxingzhi">14:00以后</span></li>
								<li>发票：<span class="shuxingzhi"> 支持开发票 <b
										class='C-ff5d51 invoice_notes_btn'>查看开票须知</b></span>
								</li>
								<li>外宾接待：<span class="shuxingzhi">不接待</span></li>
							</ul>
						</div>
						<!--特色体验-->
						<!--黄虫提示-->
						<div class="intro padding_t prompt clearfloat">
							<h4 class='fl fl_room lineH26'>黄虫提示</h4>
							<div class='fl fl_p'>
								<p class='lineH24 huan'>入住后如您认为照片与房间实质有太大差异，黄虫客服将对双方提出的证据进行认定，如属实，未入住天数的费用将全额退款。</p>
							</div>

						</div>
					</div>
				</div>

			</div>
			<!--详情页第二部分结束-->
			<!-- 详情页第三部分开始 -->
			<style>
.no_score {
	margin-bottom: 10px;
	padding-bottom: 20px;
}
</style>
			<div class='main-3' id="pingjia">
				<div class='auto_m'>
					<!--房源评价-->
					<a href="#pingjia" name="pingjia"></a>
					<div class="pingjia" name="pingjia">
						<ul class="pingjiaTit no_score clearfloat">
							<li id="landComment" class="on ping_up"><i>本房源评价（${pd.total}）</i>
								<p id="landCommentP" style="display: none;">
									<span id="ffComment"></span>
								</p></li>


						</ul>

						<div class="attached" id="contact_roomer">
							<!--本房源评价（评分、满意度）-->
							<div class="score" style="display: none;" id="lodge_score">

							</div>
							<!--本房源评价（评分、满意度）End-->

							<!--本房源客户评价-->
							<div id="lodgeunitPJ_cnt">
								<c:forEach items="${requestScope.pd.data}" var="show">
									<div class="pingjiaDes clearfloat">
										<div class="roomer_photo fl">
											<img
												src="${show.imgUrl }"
												alt=""><span>${show.nickName}</span>
										</div>
										<div id="houseDes" class="fl">
											<div class="pingjia_tiao relave">
												<div class="des">
													<div class="pingjia_cnt1">${show.content}</div>

												</div>
											</div>
										</div>
									</div>
								</c:forEach>

						
						</div>

 <script src="${pageContext.request.contextPath}/frontStage/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/frontStage/js/bootstrap.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/frontStage/css/bootstrap.css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/frontStage/css/bootstrap.min.css" media="all" />
	  	 	 	  	 	 <!-- 分页开始 -->
				<div class="container">
					<div class="row clearfix">
						<div class="col-md-12 column" align="center">
							<ul class="pagination">
								<li><a href="javascript:prePage()">上一页</a></li>
								<c:forEach begin="1" end="${pd.totalPage}" var="index">
									<c:if test="${index==pd.page}">
										<li class="active"><a href="#">${index}</a></li>
									</c:if>
									<c:if test="${index!=pd.page}">
										<li><a href="javascript:jumpPage(${index})">${index}</a></li>
									</c:if>
								</c:forEach>
								<li><a href="javascript:nextPage()">下一页</a></li>
							</ul>
						</div>
					</div>
				</div>
						<!-- 分页结束 -->

							</div>
						<!--本房源客户评价结束-->
						
 	
 <script>
//使用Javascript实现上一页跳转-->
function prePage(){
	var page = 1;
	//什么时候有上一页，当大于1的时候有上一页-->
	if(${pd.page}>1 ){
		page=${pd.page}-1;
	}
	location.href="ss.action?op=todetailPage&page="+page+"&accomId="+${homestay.accomId};
}
function nextPage(){
	var page = ${pd.page};
	//什么时候有上一页，当大于1的时候有上一页-->
	if(${pd.page}<${pd.totalPage}){
		page=${pd.page}+1;
	}
	location.href="ss.action?op=todetailPage&page="+page+"&accomId="+${homestay.accomId};
}
function jumpPage(page){
	location.href="ss.action?op=todetailPage&page="+page+"&accomId="+${homestay.accomId};
}

//使用Javascript实现下一页跳转
</script>

						<!--房东收到的所有房源评价-->
						<div class="attached" id="attached_home02">
							<div class="score" style="display: none;" id="landlord_score"></div>
							<!--本房东评价End-->
							<div id='lordPJ_cnt'></div>
							<!--房源评价结束-->
						</div>
					</div>
				</div>
			</div>
			<!-- 详情页第三部分结束 -->
			<!-- 详情页第四部分开始 -->

		</div>
		<!-- 详情页第四部分结束 -->
	</div>
	</div>

	<!--底部浮层显示，默认是隐藏-->
	<!-- <script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/v201510/js/rightlayer.js"></script> -->
	<!--公共尾部-->
		<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/js/layer/skin/layer.css"/>
	<script type="text/javascript"
		src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
	<link rel="stylesheet"
		href="//staticnew.mayi.com/resourcesWeb/seo/common/footer/seoFooter.css" />
	<script
		src="//staticnew.mayi.com/resourcesWeb/seo/common/footer/seoFooter.js"></script>
	<div class="foot">
		<div class="w1050 pb20 clearfloat">
		<div class="footer pt30 over-hidden pb20">
			<ul>
				<li>
					<h3 class="f16 mb10">联系我们</h3>
					<p class="mb15">客户服务</p>
					<p class="f22">400-000-0000</p>
					<p>Email：service@huangchong.com</p>
					<p class="mb10 mt25">商务合作</p>
					<p>QQ：1079610816</p>
					<p>Email：1079610816@qq.com</p>
				</li>
				<li>
					<h3 class="f16 mb10">帮助中心</h3>
					<p>
						<a href="/roomauditrule/" target="_blank">房源审核规范</a>
					</p>
					<p>
						<a href="/supportplan/" target="_blank">房客安心计划</a>
					</p>
					<p>
						<a href="/goodhouseplan/" target="_blank">优质住宿计划</a>
					</p>
					<p>
						<a href="/sitemap/" target="_blank">网站地图</a>
					</p>
					<p>
						<a href="questions.html" target="_blank">房客帮助</a>
					</p>
				</li>
				<li>
					<h3 class="f16 mb10">公司信息</h3>
					<p>
						<a rel="nofollow" href="/aboutcompany/" target="">关于黄虫</a>
					</p>
					<p>
						<a rel="nofollow" href="/culture/" target="">加入我们</a>
					</p>
					<p>
						<a rel="nofollow" href="/partner/" target="">战略合作</a>
					</p>
					<p>
						<a rel="nofollow" href="http://iyoujia.mayi.com/mayilod/"
							target="_blank">业主招募</a>
					</p>
					<p>
						<a rel="nofollow" href="/mediareport/" target="_blank">媒体报道</a>
					</p>
					<p>
						<a rel="nofollow" href="/agreement/" target="_blank">服务协议</a>
					</p>
					<p>
						<a rel="nofollow" href="/privacypolicy/" target="_blank">隐私政策</a>
					</p>
					<p>
						<a rel="nofollow" href="/webdisclaimer/" target="_blank">免责声明</a>
					</p>
				</li>
				<li>
					<h3 class="f16 mb10">关注我们</h3> <img
					src="${pageContext.request.contextPath}/frontStage/img/qqewm.png"
					class=" rt-app1"> <img
						src="${pageContext.request.contextPath}/frontStage/img/wxewm.png"
						class=" rt-app1">
				</li>
			</ul>
		</div>
	</div>
	</div>
	<!--底部浮层显示，默认是隐藏-->
	<!--公共尾部结束-->
	<!-- Footer -->
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
							type="hidden" id="code_num" value="86" />
							<div class="input">
								<span class="phone-icon"></span> <input class="dlargeinput"
									type="text" id="telNum" name="telNum" placeholder="手机号"
									value="" id="introduce"
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
									<img id="validationCode_img1" alt="点击刷新" title="点击刷新" src=""
										width=130px height=38 />
								</div>
							</div>
							<div class="largeinputbox small-top clearfix" id="maerrordiv">
								<div class="dinput fl" id="maerrordiv">
									<span class="password-icon"></span> <input class="dsmallinput"
										type="text" id="loginCode" name="loginCode"
										placeholder="短信验证码" value="" />
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
								<img id="validationCode_img" alt="点击刷新" title="点击刷新" src=""
									width=130px height=38>
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
				<img
					src="${pageContext.request.contextPath}/frontStage/img/loginewm.jpg"
					style="width: 200px; height: 200px;">
			</div>
		</div>
	</div>

	<!-- 登录弹窗 END -->

	<!--公共尾部结束-->

	<script type="text/javascript"
		src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js"></script>
	
		
	<script
		src="${pageContext.request.contextPath}/frontStage/js/loginpc2.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	
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

	<script type="text/javascript">
			$(document).ready(function() {
				function getCookie(objName) {
					var arrStr = document.cookie.split("; ");
					for(var i = 0; i < arrStr.length; i++) {
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
				if(user != null) {
					var pattern = new RegExp(/^\".+\"$/);
					if(pattern.exec(user)) {
						user = user.substring(1, user.length - 1);
						deleteCookie('MayiUserInfo', '/');
						document.cookie = "MayiUserInfo=" + escape(user) + ";path=/;domain=.mayi.com";
					}
				}
				//未登录的登录后才能显示站内信
			});

			function sinaWeibo() {
				window.open("http://widget.weibo.com/dialog/follow.php?fuid=2357071361");
			}
		</script>
	<style type="text/css">
.email {
	position: fixed;
	bottom: 0px;
	right: 0px;
	width: 190px;
	height: 35px;
	line-height: 35px;
	background: #e8e8e8;
	border: 1px #CCCCCC solid;
	border-right: none;
	z-index: 400000000;
}

.email a {
	padding-left: 10px;
	float: left;
	font-weight: normal;
	font-family: "宋体";
	font-size: 12px;
	width: 120px;
	box-shadow: 1px 0px 0px 0px #ccc;
	border-right: 1px #fff solid;
}

.email a img {
	margin: 12px 3px 0px 0px;
	float: left;
	width: 16px;
	height: 12px;
}

.imjs-status {
	color: #55aa39 !important
}

#webIM ul.tab-im .offline-icon, #webIM ul.tab-im .online-icon {
	background-position: 0 !important
}

#webIM .all-list a.on, #webIM .all-list a.off {
	background-position: -239px -297px !important;
	color: #2883C3 !important
}

#webIM ul.tab-im a {
	color: #2883C3 !important
}
</style>
	<script src="//tjs.sjs.sinajs.cn/open/api/js/wb.js"
		type="text/javascript" charset="utf-8"></script>
	<!-- load statistics js -->
	<!--[statistics start]-->
	<!-- load End-->
	<!-- Footer END -->
	<!-- 房间日历-->
	<div class="calend">
		<div class="shadow"></div>
		<div id="calendar-box" class="calendar-box">
			<!-- 房间日历显示 -->
			<div class="select">
				<img
					src="//staticnew.mayi.com/resourcesWeb/images/detail/select_img.png"
					width="30" height="30" />
			</div>
			<div class="calendar-meaning mt20">
				<dl class="clearfix">
					<dt class="havehome"></dt>
					<dd>有房</dd>
					<dt class="special-price"></dt>
					<dd>特殊价</dd>
					<dt class="nohome"></dt>
					<dd>无房</dd>
				</dl>
			</div>
			<div id="calOne" class="clearfix mt20"></div>
			<!-- 房间日历显示 END -->
		</div>
	</div>
	</div>
	<!-- 日历 END -->


</body>
<script type="text/javascript">
		$('#add_hom').click(function() {
			var scroll_offst = $(".pingjiaTit").offset();
			$('body,html').animate({
				scrollTop: scroll_offst.top - 90
			}, 500);
			$('#lordComment').addClass('on');
			$('#landComment').removeClass('on');
		});
	</script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/v201510/js/pageModel.js"></script>

<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/v201510/js/landlordDesR.js"></script>

<!--分享 -->
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/util/jquery.qrcode.min.js"></script>
	
</html>