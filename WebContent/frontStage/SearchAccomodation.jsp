<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:wb="http://open.weibo.com/wb">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<link rel="stylesheet" href="layui/css/layui.css" media="all">

<title>黄虫短租</title>
<meta name="keywords" content="北京住宿，北京短租房，北京民宿，北京日租房" />
<meta name="description"
	content="黄虫短租网是性价比高的北京短租房、日租房在线预订平台，提供北京短租公寓、短租房、日租房、家庭旅馆、民宿等出租房房源价格、预订信息，比酒店住宿便宜50%，公寓100%真实入住点评，真实可靠。" />
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/public.css">
	<link rel="stylesheet"
		href="//staticnew.mayi.com/resourcesWeb/v201807/list_page_new/css/list_public.css">
		<link rel="stylesheet"
			href="//staticnew.mayi.com/resourcesWeb/v201807/list_page_new/css/newlist.css">
			<link rel="stylesheet"
				href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/new_calendar.css">
				<link rel="stylesheet"
					href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/mayi_base.css">

					<script type="text/javascript" src="js/jquery.min.js"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/js/lazyload.js"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/js/js.js"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/js/index/main1.js?v=20180711"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/js/json.js?v=20160510"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/v201510/js/commom.js"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/js/allcity.js?V=20170414"></script>
					<script src="js/new_calendar.js" type="text/javascript"
						charset="utf-8"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/js/jquery.nicescroll.min.js"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/v201807/list_page_new/js/index_searchlist_public.js"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/v201807/list_page_new/js/sou_search.js"></script>
					<script type="text/javascript"
						src="//staticnew.mayi.com/resourcesWeb/v201807/list_page_new/js/jquery.range.js"></script>

					<!--Criteo-->
</head>

<body>
	<!-- Header -->
	<!-- 拉新入口 -->
	<link
		href="//staticnew.mayi.com/resourcesWeb/v201612/headpub/css/laxin.css"
		rel="stylesheet" type="text/css">
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/js/pub/list_header.js"></script>
		<!-- 房东权限相关 -->
		<script type="text/javascript"
			src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/js/landlordConfig.js"></script>
		<link rel="stylesheet"
			href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/mayi_base.css">
			<style>
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
</style>
			<input type="hidden" name="ctx" id="ctx" value="" /> <!-- 头部栏开始 -->
			<div class="header">
				<div class="nav index_nav line_h50">
					<div class="headW_auto c_gray_dark clearfloat">
						<div class="logo fl f20 c_gray_dark fw600 lineht34">
							<a href="index.html" class="c_gray_dark"><img
								src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/images/logo.png"
								width="34" alt="logo" class="radius-6"> 黄虫短租 </a>
						</div>
						<ul class="fr nav-list clearfloat">
							<li>
								<p class="top-line"></p> <a href="index.html" class="fw600 f14"
								_mayi_rp="weblist|head|index">首页</a>
							</li>
							<li>
								<p class="top-line"></p> <span class="service fw600 f14">客服热线</span>
								<ul
									class="hover-list radius-6 c_gray_dark t-center pos_center w140_2">
									<li>400-028-6868</li>
								</ul>
							</li>
							<li>
								<p class="top-line"></p> <a class="fw600 f14 "
								href="javascript:void(0);"> 帮助中心 </a>
								<ul
									class="hover-list radius-6 c_gray_dark t-left pos_center w140_2">
									<li class="mb10"><a class="c_gray_dark" target="_blank"
										href="roomauditrule.html">房源审核规范</a></li>
									<li class="mb10"><a class="c_gray_dark" target="_blank"
										href="supportplan.html">房源安心计划</a></li>
									<li class="mb10"><a class="c_gray_dark" target="_blank"
										href="goodhouseplan.html">优质住宿计划</a></li>
									<li class="mb10"><a class="c_gray_dark" target="_blank"
										href="sitemap.html">网站地图</a></li>
									<li><a class="c_gray_dark" target="_blank"
										href="questions.html">房客帮助</a></li>
								</ul>
							</li>
							<li class="user-action">
								<div class="login-btn t-center fw600 c_gray_dark cursorpt "
									id="loginshow">登录/注册</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 头部栏结束 -->
			<div class="alert-box1">
				<div class="surveYY1"></div>
				<div class="offmax_no">
					<div class="alert_tit1">温馨提示</div>
					<p class="frozeninfo">对不起，房东账号被封禁</p>
					<p>如有疑问，请联系黄虫短租客服400-028-6868</p>
					<div class="close-alert1">我知道了</div>
				</div>
			</div>

			<input type="hidden" name="subdomain" id="subdomain" value="" /> <input
				type="hidden" name="mainsite" id="mainsite" value="" /> <input
				type="hidden" name="ctx" id="ctx" value="" /> <input type="hidden"
				name="ctx1" id="ctx1" value="//staticnew.mayi.com" /> <input
				type="hidden" name="uid" id="uid" value="0" /> <input type="hidden"
				name="loginurl" id="loginurl" value="none" /> <input type="hidden"
				name="head_userName" id="head_userName" value=""> <script
					type='text/javascript'
					src='//webchat.7moor.com/javascripts/7moorInit.js?accessId=73859f20-f357-11e6-b43e-3b18b16942dc&autoShow=false'
					async='async'></script> <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:wb="http://open.weibo.com/wb">

<head>
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/im/css/IM.css?v=1" />
</head>

<body>
</body>

</html>
<!-- Header END -->

<!--主体部分-->
<div class="main">
	<!--筛选-->
	<div id="filter">
		<div id="filterCont" class="relave">
			<div class="w94_94" id="list_search">
				<div class="clearfloat b_white search_main relave">
					<div class="fl relave bor-r-eb t-left filterList place clearfloat">
						<div class="theme c_gray f12">目的地</div>
						<div class="input-box active">
							<input type="text" id="searchcityin" search typeid="3"
								placeholder="城市、景点、商圈" value="${requestScope.list[0].accomArea}"
								surl="/beijing" class="text" clicktag="2_1" name="searchcityin"
								citypinyin="beijing" cityname="北京" pinyin=""
								onkeydown="pressEve(event);" onkeyup="getSuggest(event,0);"
								autocomplete="off" _mayi_rp="weblist|sem_condition|searchcityin" />
							<span class="circle" id="clearCityInfo" style="display: none;">×</span>
						</div>
					</div>
					<div class="fl relave bor-r-eb t-center filterList time clearfloat"
						id="calendar_group">
						<div class="theme c_gray f12 t-left">住宿日期</div>
						<div class="input-box">
							<input id="checkinday" readonly class="f18 c_gray_light fw700"
								_mayi_rp="weblist|sem_condition|checkindate" type="text"
								placeholder="入住日期" value="">
								<div class="count">
									<span class="f12 c_gray_dark" id="zrdays">0晚</span>
								</div> <input id="checkoutday" readonly class="f18 c_gray_light fw700"
								_mayi_rp="weblist|sem_condition|checkoutdate" type="text"
								placeholder="退房日期" value=""> <input
									id="checkinday_value" type="hidden" value=""> <input
										id="checkoutday_value" type="hidden" value="">
						</div>
						<span class="circle clear" id="clearSelect" style="display: none;"
							_mayi_rp="weblist|sem_condition|clearCalendar">&times;</span>
						<div id="index_list_calendar-box" class="hidden search-modal"></div>
					</div>
					<!-- 入住人数 -->
					<div class="fl relave t-center bor-r-eb t-left filterList people ">
						<div class="theme c_gray f12 ">入住人数</div>
						<div class="chose-people cursorpt input-box"
							_mayi_rp="weblist|sem_condition|peoplenumber">
							<span class="f14 c_gray_dark fw700" id="countVal">不限</span>
						</div>
						<div id="ruzhunum" class="search-modal radius-12 c_gray_dark"
							tabindex="4" style="overflow: hidden; outline: none;">
							<ul _mayi_rp="weblist|sem_condition|peoplenumber">
								<li peoplenum="0">不限</li>
								<li peoplenum="1">1人</li>
								<li peoplenum="2">2人</li>
								<li peoplenum="3">3人</li>
								<li peoplenum="4">4人</li>
								<li peoplenum="5">5人</li>
								<li peoplenum="6">6人</li>
								<li peoplenum="7">7人</li>
								<li peoplenum="8">8人</li>
								<li peoplenum="9">9人+</li>
							</ul>
						</div>
					</div>
					<!--关键词-->
					<div class="fl relave t-left filterList  clearfloat keyword">
						<div class="theme c_gray f12">关键词</div>
						<div class="input-box active">
							<input class="f18 c_gray_light fw700" type="text" id="gjz"
								placeholder="位置、标题、房东等" value="" maxlength=20 class="text1"
								clicktag="2_1" name="gjz" /> <span class="circle"
								id="clearCityInfo" style="display: none;">×</span>
						</div>
					</div>
					<div
						class="fr relave search-btn f24 c_white fw600 t-center cursorpt"
						id="landmarkBtn" _mayi_rp="weblist|sem_condition|searchbutton">搜索民宿</div>
					<!-- 联想词-->
					<div
						class="suggest_results search-modal has-words radius-12 c_gray_dark top69"
						id="suggest">
						<ul id="suggestul">

						</ul>
					</div>
					<div class="error_tip_list search-modal radius-12 top69"
						id="tip_searchcity">关键词无结果</div>
					<!-- 城市列表弹框 -->
					<div
						class="select-hotcity clearfloat search-modal radius-12 c_gray_dark top69"
						id="searchcitydiv" name="searchcitydiv">
						<div class="searh-recent clearfloat history">
							<p class="w100 clearfloat">
								<span class="searh-tit fl fw700">历史搜索</span><span
									class="cleartrace fr clear" onclick="return Bind_Click(this);"
									_mayi_rp="weblist|sem_condition|clearHistory"></span>
							</p>
							<ul id="searh-recent" class="clearfloat citys">
							</ul>
						</div>
						<ul class="select-title clearfloat tab" id="cityselecttitleul">
							<li class="active"><a value="hotcity" id="hotcity"
								class="selected" href="javascript:void(0)">热门目的地</a></li>

						</ul>
						<!-- 热门目的地的内容-->
						<ul class="select-citycon clearfloat tab-content"
							id="cityselectul" name="cityselectul">
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="北京" citypinyin="beijing">北京</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="上海" citypinyin="shanghai">上海</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="广州" citypinyin="guangzhou">广州</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="深圳" citypinyin="shenzhen">深圳</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="三亚" citypinyin="sanya">三亚</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="成都" citypinyin="chengdu">成都</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="武汉" citypinyin="wuhan">武汉</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="南京" citypinyin="nanjing">南京</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="重庆" citypinyin="chongqing">重庆</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="杭州" citypinyin="hangzhou">杭州</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="香港" citypinyin="xianggang">香港</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="厦门" citypinyin="xiamen">厦门</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="西安" citypinyin="xian">西安</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="长沙" citypinyin="changsha">长沙</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="苏州" citypinyin="suzhou">苏州</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="桂林.阳朔" citypinyin="guilin">桂林.阳朔</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="昆明" citypinyin="kunming">昆明</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="沈阳" citypinyin="shenyang">沈阳</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="天津" citypinyin="tianjin">天津</a>
							</li>
							<li class="citylili"><a class="cityselecta"
								href="javascript:void(0)" cityname="哈尔滨" citypinyin="haerbin">哈尔滨</a>
							</li>
						</ul>
						<div class="hotmore  hint f12 c_gray">温馨提示：支持中文/拼音/简拼输入</div>
					</div>
					<!--关键词列表-->
					<div
						class="key_word_list clearfloat search-modal radius-12 c_gray_dark top69"
						id="key_word_list">
						<div class="key_li">
							<p>
								<span class='p_span1'></span>鼓浪屿
							</p>

						</div>
						<div class="key_li">
							<p>
								<span class='p_span2'></span>景点
							</p>

						</div>
						<div class="key_li">
							<p>
								<span class='p_span3'></span>行政区
							</p>

						</div>
						<div class="key_li">
							<p>
								<span class='p_span4'></span>车站机场
							</p>

						</div>
					</div>
				</div>
			</div>
			<div class="cont1 b_white">
				<div class="path_link w94_94">
					<a href="/">首页</a><label>&nbsp;&gt;&nbsp;</label>
					<h1 class="f14">${requestScope.list[0].accomArea}短租房</h1>
					<!-- <span class="ml10 f12">北京的房源获得超过10173100次房客评价，平均得分4.9分（满分5分）</span> -->
				</div>
				<div class="filter w94_94">
					<ul>
						<!-- 推荐标签 -->
						<li id="tuijian">
							<div class="lt-icon">推荐</div>
							<div class="rt-word">
								<div class="item one">
									<a rel="nofollow" class="on all" href="/beijing/"
										_mayi_rp="weblist|sem_condition|recommend">不限</a>
									<div class="add relave">
										<a href="/beijing/y5/"
											_mayi_rp="weblist|sem_condition|recommend3">可做饭 </a> <span
											class="add_title" style="width: 6em;">可以自己做饭</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y1/"
											_mayi_rp="weblist|sem_condition|recommend0">黄虫优选</a> <span
											class="add_title" style="width: 18em;">设施全、服务佳、品质高的黄虫优选房源</span>
									</div>
									<div class="add relave">
										<a href="/beijing/e3/" _mayi_rp="weblist|condition|other2">周租月租</a>
										<span class="add_title" style="width: 13em;">周租月租有折扣，长租更实惠</span>
									</div>

									<div class="add relave">
										<a href="/beijing/y7/"
											_mayi_rp="weblist|sem_condition|recommend5">速订</a> <span
											class="add_title" style="width: 14em;">下单后无需房东确认，即时预订</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y3/"
											_mayi_rp="weblist|sem_condition|recommend1">实拍</a> <span
											class="add_title" style="width: 9em;">专业摄影师实地拍摄</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y8/"
											_mayi_rp="weblist|sem_condition|recommend4">商旅</a> <span
											class="add_title" style="width: 8em;">适合商旅人士居住</span>
									</div>
								</div>
							</div>
						</li>
						<!-- 位置开始 -->
						<li id="position">
							<div class="lt-icon">
								<i></i>景点
							</div>
							<div class="rt-word">
								<div class="item one">
									<a rel="nofollow" class="on all" href="/beijing/"
										_mayi_rp="weblist|sem_condition|recommend">不限</a>
									<div class="add relave">
										<a href="/beijing/y5/"
											_mayi_rp="weblist|sem_condition|recommend3">三坊七巷 </a> <span
											class="add_title" style="width: 6em;">5A级旅游景区</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y1/"
											_mayi_rp="weblist|sem_condition|recommend0">罗源湾海洋世界</a> <span
											class="add_title" style="width: 18em;">海洋物种达300余种</span>
									</div>
									<div class="add relave">
										<a href="/beijing/e3/" _mayi_rp="weblist|condition|other2">贵安欢乐世界</a>
										<span class="add_title" style="width: 13em;">贵安新天地休闲旅游度假区</span>
									</div>

									<div class="add relave">
										<a href="/beijing/y7/"
											_mayi_rp="weblist|sem_condition|recommend5">石竹山</a> <span
											class="add_title" style="width: 14em;">石竹山坐落在福清市西郊10公里处，属闽中戴云山余脉西山山脉南段，主峰状元峰海拔534米。</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y3/"
											_mayi_rp="weblist|sem_condition|recommend1">闽江</a> <span
											class="add_title" style="width: 9em;">闽江，中国福建省最大独流入海(东海)河流</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y8/"
											_mayi_rp="weblist|sem_condition|recommend4">金鸡山公园</a> <span
											class="add_title" style="width: 8em;">金鸡山公园位于福州晋安区金鸡山麓，总占地面积约110公顷。</span>
									</div>

									<div class="add relave">
										<a href="/beijing/y8/"
											_mayi_rp="weblist|sem_condition|recommend4">西禅寺</a> <span
											class="add_title" style="width: 8em;">西禅寺名列福州五大禅林之一，为全国重点寺庙，位于西郊怡山之麓，工业路西边南侧。</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y8/"
											_mayi_rp="weblist|sem_condition|recommend4">平潭岛</a> <span
											class="add_title" style="width: 8em;">平潭岛，亦称海坛岛，为我国第五大岛，福建第一大岛，岛上时常“东来岚气弥漫”，别称“东岚”，距福州128公里。</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y8/"
											_mayi_rp="weblist|sem_condition|recommend4">溪山温泉</a> <span
											class="add_title" style="width: 8em;">背倚松竹苍翠之汤岭，面傍波光粼粼之鳌江，潺潺西溪环绕而过，优质温泉闻名遐迩，</span>
									</div>
									<div class="add relave">
										<a href="/beijing/y8/"
											_mayi_rp="weblist|sem_condition|recommend4">金牛山公园</a> <span
											class="add_title" style="width: 8em;">福州市区唯一的现代化公园。</span>
									</div>
								</div>
							</div>
						</li>
						<!-- 位置结束 -->
						<!--价格-->
						<li>
							<div class="lt-icon">
								<i class="icon-i04"></i>价格
							</div>
							<div class="rt-word">
								<div class="item one">
									<a rel="nofollow" class="on all" href="/beijing/"
										_mayi_rp="weblist|sem_condition|recommend">不限</a>
									<div class="add relave">
										<a href="/beijing/y5/"
											_mayi_rp="weblist|sem_condition|recommend3">0~200 </a>
									</div>
									<div class="add relave">
										<a href="/beijing/y1/"
											_mayi_rp="weblist|sem_condition|recommend0">200~300</a>
									</div>
									<div class="add relave">
										<a href="/beijing/e3/" _mayi_rp="weblist|condition|other2">300~400</a>
									</div>

									<div class="add relave">
										<a href="/beijing/y7/"
											_mayi_rp="weblist|sem_condition|recommend5">400~500</a>
									</div>
									<div class="add relave">
										<a href="/beijing/y3/"
											_mayi_rp="weblist|sem_condition|recommend1">500~600</a>
									</div>
									<div class="add relave">
										<a href="/beijing/y8/"
											_mayi_rp="weblist|sem_condition|recommend4">600~700</a>
									</div>
									<div class="add relave">
										<form action="" method="post">
											<label style="font-size: 13px; letter-spacing: 2px;">自定义</label>
											<input type="number" name="price" id="" value="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="submit" value="确定"
												style="font-size: 13px; letter-spacing: 2px; background-color: aliceblue;" />
										</form>
									</div>
								</div>
							</div>
						</li>
						<!--价格结束-->
						<!-- 户型 -->
						<li id="huxing">
							<div class="lt-icon">户型</div>
							<div class="rt-word">
								<div class="item one">
									<a rel="nofollow" class="on all" href="/beijing/"
										_mayi_rp="weblist|sem_condition|roomnum">不限</a>
									<div class="add relave">
										<a title="一居" href="/beijing/h1/"
											_mayi_rp="weblist|sem_condition|roomnum0">一居</a>
									</div>
									<div class="add relave">
										<a title="二居" href="/beijing/h2/"
											_mayi_rp="weblist|sem_condition|roomnum1">二居</a>
									</div>
									<div class="add relave">
										<a title="三居" href="/beijing/h3/"
											_mayi_rp="weblist|sem_condition|roomnum2">三居</a>
									</div>
									<div class="add relave">
										<a title="四居及以上" href="/beijing/h40/"
											_mayi_rp="weblist|sem_condition|roomnum3">四居及以上</a>
									</div>
								</div>
							</div>
						</li>
						<!-- 户型结束 -->

						<!--床型-->
						<li id="huxing">
							<div class="lt-icon">床型</div>
							<div class="rt-word">
								<div class="item one">
									<a rel="nofollow" class="on all" href="/beijing/"
										_mayi_rp="weblist|sem_condition|roomnum">不限</a>
									<div class="add relave">
										<a title="单人床" href="/beijing/h1/"
											_mayi_rp="weblist|sem_condition|roomnum0">单人床</a>
									</div>
									<div class="add relave">
										<a title="双人床" href="/beijing/h2/"
											_mayi_rp="weblist|sem_condition|roomnum1">双人床</a>
									</div>
									<div class="add relave">
										<a title="婴儿床" href="/beijing/h3/"
											_mayi_rp="weblist|sem_condition|roomnum2">婴儿床</a>
									</div>
									<div class="add relave">
										<a title="其他" href="/beijing/h40/"
											_mayi_rp="weblist|sem_condition|roomnum3">其他</a>
									</div>
								</div>
							</div>
						</li>

					</ul>
				</div>
			</div>
		</div>
		<div id="search_nav_bottom">
			<div class="clearfloat w94_94 relave"
				style="overflow: hidden; min-height: 50px;">
				<div class="gong" style="display: none">
					<ul class="fl change">
					</ul>
				</div>
				<div class="select_up" id="filter_up_down" style="">
					展开筛选条件<i></i>
				</div>
			</div>
		</div>
	</div>
	<div class="filter_fixed"></div>
	<div class="b_white ">

		<div class="relave con-wrap-par w94_94">
			<div class="con-wrap" id="con-wrap">
				<div>
					<!-- 搜索到的已有房源start -->
					<dl class="searchRoom clearfloat" id="searchRoom">
						<c:if test="${requestScope.list==null} ">
							<jsp:forward page="ss.action?op='厦门'"></jsp:forward>
						</c:if>
						<c:forEach items="${requestScope.list}" var="s">
							<dd id="dd_851953993" data="851953993" lid="851953993"
								colleState="0" price="498" latlng="40.04982,116.42083">
								<div class="room-img">
									<div class="collect" state="1" title="收藏" id="c_851953993"
										onClick="lodge_collect(this)"></div>
									<!--图片切换-->
									<div>
										<div class="house-image">
											<a href="javascript:void(0)" class="change-prev"
												style="display: none;" data="851953993"
												mainImage="${pageContext.request.contextPath}/../img/${s.accomId}/Head.jpg"></a>
											<a href="room.html" onClick="goDetail(this)" target="_blank">
												<img class="roomMap851953993" style="display: none" /> <img
												id="851953993" class="lazy lodgelazy"
												title="${s.accomTitle}"
												src="${pageContext.request.contextPath}/../img/${s.accomId}/Head.jpg"
												data-original="${pageContext.request.contextPath}/../img/${s.accomId}/Head.jpg"
												alt="${s.accomTitle }" />
											</a> <a href="javascript:void(0)" style="display: none"
												class="change-next" data="851953993"></a>
										</div>
									</div>
									<!-- 	<p class="asote yxfy-img">
									<a href="http://www.mayi.com/goodlodgeunit/" target="_blank"
										class='yx_alink' rel="nofollow"> <img
										src="//staticnew.mayi.com/resourcesWeb/v201807/list_page_new/images/level9-2_1.png"
										alt="【寒舍】鸟巢 水立方 奥林匹克 大一居" style="width: 62px;" /> <span>“黄虫优选”认证是由黄虫短租开创建立的行业新标准，具备3大品质体系、9大服务标准、27项安心保障。住黄虫优选房，设施全、服务佳、品质高！</span>
									</a>
									夜宵活动折扣标签
								</p> -->
									<!-- 图片切换结束 -->
									<b class="moy-b">
										<p>
											<font>￥</font>${s.price}
										</p>
									</b> <a title="${s.accomTitle}"> <b class="btn-img"><img
											src="//staticnew.mayi.com/resourcesWeb/images/index/head_default.png"
											class="lazy landlazy"
											data-original="//i1.mayi.com/mayi16/M71/WO/II/LANX4W4RQMQEZTQPQHKHWK2YQUXL2C.jpg_150x150c.jpg"
											width="46" heigth="46" alt="房东头像" /></b>
									</a>
								</div>
								<a href="/room/851953993" title="${s.accomTitle}"
									onClick="goDetail(this)" target="_blank"
									style="position: relative;">
									<div class="room-detail  clearfloat" style="height: 88px;">
										<p>${s.accomTitle}</p>
										<ul>
											<li><span style="color: #FA8100;">5.0分 完美!</span>·</li>
											<li>${s.commentsum}条评论·</li>
											<li>${s.houseType}居·</li>
											<li>可住${s.houseType}人</li>
										</ul>
										<p class="room_intro_p">
											<span class="biaoqian_style"
												style="background: rgba(255, 205, 76, 0.25); color: #FA9A00;">速订</span>
											<span class="biaoqian_style" style="background: #f4f4f4;">长租优惠</span>
											<span class="biaoqian_style" style="background: #f4f4f4;">实拍</span>
											<span class="biaoqian_style" style="background: #f4f4f4;">
												可做饭</span>
										</p>
										<input type="hidden" value="0">
									</div>
								</a>
							</dd>

						</c:forEach>

					</dl>
					<!-- Page -->
					<div id="page" class="page">
								<a class="pg-active" href="/beijing/1/" rel="nofollow"
							_mayi_rp="weblist|sem_searchmore|pagecount">1</a> <a
							href="/beijing/2/" rel="nofollow"
							_mayi_rp="weblist|sem_searchmore|pagecount">2</a> <a
							href="/beijing/3/" rel="nofollow"
							_mayi_rp="weblist|sem_searchmore|pagecount">3</a> <a
							href="/beijing/4/" rel="nofollow"
							_mayi_rp="weblist|sem_searchmore|pagecount">4</a> <a
							href="/beijing/5/" rel="nofollow"
							_mayi_rp="weblist|sem_searchmore|pagecount">5</a> <input
							type="hidden" vale="30" /> <a href="javascript:void(0)">...</a>
						<input type="hidden" vale="30" /> <a href="/beijing/2/"
							rel="nofollow" class="up-page"
							_mayi_rp="weblist|sem_searchmore|pagecount">下一页</a>

						<!-- layui分页开始 -->
						<div id="searchpage" class="page" style="text-align: center"></div>
						<!-- layui分页结束 -->

					</div>
					
					<!-- Page END -->
				</div>
				<!-- 搜索到的已有房源end -->

				<!-- 全部推荐房源开始 start -->
				<!-- 全部推荐房源结束 end-->
			</div>

		</div>
		<script src="layui/layui.js" charset="utf-8"></script>
	<script>
	layui.use(['laypage', 'layer'], function(){
		var laypage = layui.laypage
		,layer = layui.layer;
		//完整功能
		laypage.render({
   		elem: 'searchpage'
    	,count: ${pd.total}
		,curr:${pd.page}
		,theme:'#c00'
    	,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
    	,jump: function(obj,first){
     	 console.log(obj)
     	console.log(first); //得到每页显示的条数
         
         //首次不执行
         if(!first){
           //do something
           location.href="../ss.action?op=searchpage&page="+obj.curr+"pageSize=8";
         }
    	}
  	});
	});
</script>
	</div>
</div>


	



<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/login.js"></script>

<!-- Footer -->
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
					<h3 class="f16 mb10">关注我们</h3> <img src="img/qqewm.png"
					class=" rt-app1"> <img src="img/wxewm.png" class=" rt-app1">
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- 登录弹窗 -->
<!-- 登录弹窗 -->
<div class="loginbox" id="loginboxdiv" nexturl="none" name="loginboxdiv"
	style="display: none;">
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
								<span class="phone-icon"></span> <input class="dlargeinput"
									type="text" id="loginmobile" name="loginmobile"
									placeholder="手机号" value="" id="introduce"
									onafterpaste="mobileRepAndSetPos(this,/[^\d.]/g,'')"
									onkeyup="mobileRepAndSetPos(this,/[^\d.]/g,'')" maxlength="11" />
							</div>
							<div class="largeinputbox small-top clearfix">
								<div class="dinput fl">
									<span class="verification-icon"></span> <input
										class="dsmallinput" type="text" id="imagecode"
										placeholder="图形验证码" value="" />
								</div>
								<div class="yz-code fr">
									<img src="" id="loginauthimage" title="点击刷新" />
								</div>
							</div>
							<div class="largeinputbox small-top clearfix" id="maerrordiv">
								<div class="dinput fl" id="maerrordiv">
									<span class="password-icon"></span> <input class="dsmallinput"
										type="text" id="loginphonecode" name="loginphonecode"
										placeholder="短信验证码" value="" />
								</div>
								<div class="yz-code fr">
									<input class="sendnumber defaultsend" type="button"
										id="getloginphonecode" name="getloginphonecode" value="获取验证码" />
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
								<a href="javascript:void(0)" id="loginbymado">登录</a>
							</div>
				</div>
				<!-- 手机登陆 end  -->
				<!-- 密码登陆 start -->
				<div class="login-input" id="loginbyupdiv" name="loginbyupdiv"
					style="display: none;">
					<input type="hidden" id="li_num_1" value="0"> <input
						type="hidden" id="code_num_1" value="86">
							<div class="input">
								<span class="user-icon"></span> <input class="dlargeinput"
									type="text" id="loginnamein" name="loginnamein"
									placeholder="手机号/邮箱/账号" value="" autocomplete="off" />
							</div>
							<div class="input small-top">
								<span class="password-icon"></span> <input class="dlargeinput"
									type="password" id="loginpassin" name="loginpassin"
									placeholder="密码" value="" />
							</div>
							<div class="largeinputbox small-top clearfix" id="uperrordiv">
								<div class="dinput fl" id="yui_3_5_1_1_1434542056373_108">
									<span class="verification-icon"></span> <input type="text"
										class="dsmallinput" id="imagecode1" placeholder="图形验证码"
										value="">
								</div>
								<div class="yz-code fr">
									<img src="" id="loginauthimage1" title="点击刷新">
								</div>
							</div>
							<div class="logincheckbox large-top clearfix">
								<label class="fl"> <input class="selectcheckbox"
									type="checkbox" name="rememberpass" checked="checked" value="" />自动登录
								</label>
							</div>
							<div class="btn-wrap btnpdt20">
								<a href="javascript:void(0)" id="loginbyupdo"
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
			<img src="img/loginewm.jpg" style="width: 200px; height: 200px;">
		</div>
	</div>
</div>
<!-- 登录弹窗 END -->
<!-- 登录弹窗 END -->
<!--公共尾部结束-->
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js"></script>
<script type="text/javascript"
	src="//staticnew.mayi.com/resourcesWeb/js/loginpc.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				function getCookie(objName) {
					var arrStr = document.cookie.split("; ");
					for (var i = 0; i < arrStr.length; i++) {
						var temp = arrStr[i].split("=");
						if (temp[0] == objName)
							return unescape(temp[1]);
					}
				}

				function deleteCookie(name, path) {
					var name = escape(name);
					var expires = new Date(0);
					path = path == "" ? "" : ";path=" + path;
					document.cookie = name + "=" + ";expires="
							+ expires.toUTCString() + path;
				}

				//修正cookie中的MayiUserInfo
				var user = getCookie('MayiUserInfo');
				if (user != null) {
					var pattern = new RegExp(/^\".+\"$/);
					if (pattern.exec(user)) {
						user = user.substring(1, user.length - 1);
						deleteCookie('MayiUserInfo', '/');
						document.cookie = "MayiUserInfo=" + escape(user)
								+ ";path=/;domain=.mayi.com";
					}
				}
				//未登录的登录后才能显示站内信
				$(".email").show();
			});

	function sinaWeibo() {
		window
				.open("http://widget.weibo.com/dialog/follow.php?fuid=2357071361");
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
<!--底部浮层显示，默认是隐藏-->
<!--跟踪代码-->
<script type="text/javascript">
	var _py = _py || [];
	_py.push([ 'a', '_V..9lG-o_-K8tLjk83g1WAOcX' ]);
	_py.push([ 'domain', 'stats.ipinyou.com' ]);
	_py.push([ 'e', '' ]);
	-function(d) {
		var f = 'https:' == location.protocol;
		f = (f ? 'https' : 'http') + '://'
				+ (f ? 'file.ipinyou.com' : 'file.ipinyou.com.cn')
				+ '/j/adv.js';
		d.write('<script src="' + f + '"><\/script>');
	}(document)
</script>
<noscript>
	<img src="//stats.ipinyou.com/adv.gif?a=_V..9lG-o_-K8tLjk83g1WAOcX&e="
		style="display: none;" />
</noscript>
<!--判断是否推送给赶集-->
<input type="hidden" name="channel_ganji" id="channel_ganji" value="" />
<!-- 黄虫点击 -->
<script src="//staticnew.mayi.com/duanzu/resources/common/js/mayi.js"></script>
<!-- 黄虫分析 -->
<script src="//staticnew.mayi.com/resources/js/mayi/mayi_rp.js"></script>
</body>
<!--广告图-->
<script type="text/javascript">
	function pressEve(e) {
		var e = e || window.event;
		var code = e.keyCode;
		var sugcss = $('.suggest_results').css('display');

		if (sugcss != 'none') {
			if (code == 13) {
				//选中第一个
				if ($(".suggest_results li:first-child a .leftspan").attr("kw")) {
					$("#searchcityin").attr(
							'citypinyin',
							$(".suggest_results li:first-child a").attr('url')
									.split("/")[1]);
				}
				doSearch();
			} else if (code == 38) {
				movePrev();
			} else if (code == 40) {
				moveNext();
			}
		}
	}

	function getSuggest(e, k) {
		var s = $('#searchcityin').val().trim();
		if (k) {
			s = $('#searchcityin1').val().trim();
		}
		//alert('联想:'+s);
		var cityid = $('#cityid').val();
		var ctx = $('#ctx').val();
		if (!e)
			var e = window.event;
		var code = e.keyCode;
		if (code == 27) {
			$('.error_tip_list').css('display', 'none');
			$('.suggest_results').css('display', 'none');
			return false;
		}
		if (code == 13 || code == 37 || code == 38 || code == 39 || code == 40
				|| code == undefined) {
			return false;
		}
		if (null != s && s.length > 0 && s != '目的地' && s != '目的地、景点、商圈等'
				&& s != '位置、标题、房东等') {
			var sugurl = ctx + '/getSuggest/';
			getSuggestResult(sugurl, s, k ? cityid : 0, 'list', k);
		} else {
			version++;
			$('.suggest_results').html();
			$('.error_tip_list').css('display', 'block');
			if (k) {
				//$('.error_tip_list').html('请输入关键字');
				//$('.error_tip_list').css('left',$(".keyword").offset().left);
				$('.suggest_results').css('display', 'none');
				$('.select-hotcity').css('display', 'none');
				$('.error_tip_list').css('display', 'none');
				var oLeft = $(".keyword").position().left;
				$('#key_word_list').fadeIn().css({
					"right" : 0,
					"left" : "auto"
				});
				/* $('#key_word_list').show();
				$('#key_word_list').css('left', $("#searchcityin1").offset().left-$(".search_main").offset().left); */
			} else {
				//$('.error_tip_list').html('请输入目的地');
				//$('.error_tip_list').css('left',100);
				//$('#searchcityin').val("");
				var searchkey = getCookie('searchkey');
				if (null != searchkey && searchkey.length > 0) {
					var keys = searchkey.replace(/\"/ig, '').split(',');
					var data = '';
					for (var i = keys.length - 1; i > -1; i--) {
						var localHistoy = keys[i].split('&');
						data += '<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="'
								+ localHistoy[0]
								+ '" surl="'
								+ localHistoy[1]
								+ '" citypinyin="'
								+ localHistoy[0]
								+ '">'
								+ localHistoy[0] + '</a></li>';
					}
					$("#searh-recent").html(data);
					$('.cityselecta').click(function(e) {
						var isDiBiao = $(this).attr("isDiBiao");
						if (isDiBiao == 1) {
							$("#searchcityin").attr("typeid", "0");
						} else {
							$("#searchcityin").attr("typeid", "3");
						}
					});
					$(".searh-recent").css('display', 'block');
				} else {
					$(".searh-recent").css('display', 'none');
				}
				$("#hotcity").addClass('selected').parent().siblings()
						.children().removeClass('selected');
				loadhotCity();
				$("#searchcitydiv").css("display", "block");
				$(".error_tip").css('display', 'none');

				$('.error_tip_list').css('display', 'none');
				$('.suggest_results').css('display', 'none');
				$('.select-hotcity').css('display', 'block');
			}
		}
	}

	function getOtherSug() {
		var s = $('#searchcityin').val();
		var ctx = $('#ctx').val();
		var sugurl = ctx + '/getSuggest/';
		getSuggestResult(sugurl, s, 0, 'list');
	}

	function goSug(sugurl, name) {
		var ctx = $('#ctx').val();
		var url = ctx + sugurl;
		var checkinday = $('#checkinday').val();
		if (checkinday != null && checkinday != "" && checkinday != "入住时间") {
			url = url + "?d1=" + checkinday;
			var checkoutday = $('#checkoutday').val();
			if (checkoutday != null && checkoutday != ""
					&& checkoutday != "退房时间") {
				url = url + "&d2=" + checkoutday;
			}
		}
		setSearchCookie(name);
		window.location.href = url;
	}
	//点击城市输入框
	$('#searchcityin')
			.click(
					function(e) {
						MYRP.rpComm($(this));
						$("#cityselecttitleul").find('li').removeClass();
						$("#cityselecttitleul").find('li:eq(0)').attr('class',
								'active');
						e.stopPropagation();
						$(".search-modal").hide();
						$('.up_btn').children("span").css(
								'background-position', '-11px 0');
						$('.up_btn ul').css('display', 'none');

						var s = $('#searchcityin').val();
						if (s != null && s.length > 0 && s != '目的地、景点、商圈等') {
							var searchkey = getCookie('searchkey');
							if (null != searchkey && searchkey.length > 0) {
								var keys = searchkey.replace(/\"/ig, '').split(
										',');
								var data = '';
								for (var i = keys.length - 1; i > -1; i--) {
									var localHistoy = keys[i].split('&');
									if (localHistoy[2] == 1) {
										//data += '<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="'+localHistoy[0]+'" surl="'+localHistoy[1]+'?s='+localHistoy[0]+'" citypinyin="'+localHistoy[0]+'">'+localHistoy[0]+'</a></li>';
										var surl = "";
										if (localHistoy[1].indexOf("?s=") == -1) {
											surl = localHistoy[1] + "?s="
													+ localHistoy[0];
										} else {
											surl = localHistoy[1];
										}
										data += '<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="'
												+ localHistoy[0]
												+ '" isDiBiao="'
												+ localHistoy[2]
												+ '" surl="'
												+ surl
												+ '" citypinyin="'
												+ localHistoy[0]
												+ '">'
												+ localHistoy[0] + '</a></li>';
									} else {
										data += '<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="'
												+ localHistoy[0]
												+ '" isDiBiao="'
												+ localHistoy[2]
												+ '" surl="'
												+ localHistoy[1]
												+ '" citypinyin="'
												+ localHistoy[0]
												+ '">'
												+ localHistoy[0] + '</a></li>';
									}
								}
								$("#searh-recent").html(data);
								$('.cityselecta').click(function(e) {
									$("#searchcityin1").val('');
									var isDiBiao = $(this).attr("isDiBiao");
									if (isDiBiao == 1) {
										$("#searchcityin").attr("typeid", "0");
									} else {
										$("#searchcityin").attr("typeid", "3");
									}
								});
								$(".searh-recent").css('display', 'block');
							} else {
								$(".searh-recent").css('display', 'none');
							}
							$("#hotcity").addClass('selected').parent()
									.siblings().children().removeClass(
											'selected');
							loadhotCity();
							$("#searchcitydiv").css("display", "block");
							$(".error_tip").css('display', 'none');
							$('.error_tip_list').css('display', 'none');
							$('.suggest_results').css('display', 'none');
						} else {
							$("#searchcitydiv").css("display", "block");
						}
					});

	//加载热门城市
	function loadhotCity() {
		var ctx1 = $('#ctx1').val();
		$('#cityselectul').html('');
		var redHotCity = [ "chengdu", "chongqing", "xian", "xiamen", "suzhou",
				"wuhan", "qingdao", "hangzhou", "yangzhou" ];
		var imageCity = [ "hangzhou", "yangzhou", "qingdao", "weihai" ];
		for ( var city in hotcitys) {
			var cityinfo = hotcitys[city];
			var a = '<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="'
					+ cityinfo[1]
					+ '" surl="/'
					+ cityinfo[2]
					+ '" citypinyin="'
					+ cityinfo[2]
					+ '">'
					+ cityinfo[1]
					+ '</a></li>';
			$('#cityselectul').append(a);
			$('.cityselecta').click(function(e) {
				$("#searchcityin1").val('');
				var isDiBiao = $(this).attr("isDiBiao");
				if (isDiBiao == 1) {
					$("#searchcityin").attr("typeid", "0");
				} else {
					$("#searchcityin").attr("typeid", "3");
				}
			});
		}
	}

	//加载某类首字母的城市
	function loadheadCity(value, node) {
		node.html('');
		var values = new Array();
		values = value.split("_");
		var imageCity = [ "hangzhou", "yangzhou", "qingdao", "weihai" ];
		var ctx1 = $('#ctx1').val();
		for (i = 0; i < values.length; i++) {
			var head = values[i];
			var str = '<div class="cityselectul_div">';
			str += '<span class="letter">' + head.toUpperCase()
					+ '</span><ul class="clearfloat">';
			for ( var city in citys) {
				var cityinfo = citys[city];
				var citypinyin = cityinfo[2];
				var citypinyinH = cityinfo[3];
				var internation = cityinfo[9];
				if (citypinyinH != undefined
						&& citypinyinH.substring(0, 1) == head
						&& internation == 0) {
					var a = '<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="'
							+ cityinfo[1]
							+ '" surl="/'
							+ cityinfo[2]
							+ '" citypinyin="'
							+ cityinfo[2]
							+ '">'
							+ cityinfo[1] + '</a></li>';
					str += a;
				}
			}
			str += '</ul></div>';
			node.append(str);
			$('.cityselecta').click(function(e) {
				var isDiBiao = $(this).attr("isDiBiao");
				if (isDiBiao == 1) {
					$("#searchcityin").attr("typeid", "0");
				} else {
					$("#searchcityin").attr("typeid", "3");
				}
			});
		}
	}

	//加载海外城市
	function loadOverseasCity(node) {
		node.html('');
		for ( var city in citys) {
			var cityinfo = citys[city];
			var citypinyinH = cityinfo[3];
			var internation = cityinfo[9];
			if (citypinyinH != undefined && internation > 0) {
				var a = '<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="'
						+ cityinfo[1]
						+ '" surl="/'
						+ cityinfo[2]
						+ '" citypinyin="'
						+ cityinfo[2]
						+ '">'
						+ cityinfo[1]
						+ '</a></li>';
				node.append(a);
				$('.cityselecta').click(function(e) {
					$("#searchcityin1").val('');
					var isDiBiao = $(this).attr("isDiBiao");
					if (isDiBiao == 1) {
						$("#searchcityin").attr("typeid", "0");
					} else {
						$("#searchcityin").attr("typeid", "3");
					}
				});
			}
		}
	}

	//点击关键词输入框
	$('#searchcityin1').click(function(e) {
		MYRP.rpComm($(this));
		e.stopPropagation();
		$(".search-modal").hide();

		$('.up_btn').children("span").css('background-position', '-11px 0');
		$('.up_btn ul').css('display', 'none');

		var s = $('#searchcityin1').val();
		if (s != null && s.length > 0 && s != '位置、标题、房东等') {
			var ctx = $('#ctx').val();
			var sugurl = ctx + '/getSuggest/';
			var cityid = $('#cityid').val();
			getSuggestResult(sugurl, s, cityid, 'list', 1);
		} else {
			$('.suggest_results').css('display', 'none');
			$('.select-hotcity').css('display', 'none');
			var oLeft = $(".keyword").position().left;
			$('#key_word_list').fadeIn().css({
				"right" : 0,
				"left" : "auto"
			});
		}
	});

	function pubFree() {
		var user = $('#uid').val();
		if (user != 0) {
			publish(user);
		} else {
			$('.loginatother').click();
		}
	}

	function showPreferential(id, isShow) {
		if (isShow) {
			$('#dis_' + id).show();
		} else {
			$('#dis_' + id).hide();
		}
	}

	function showMapPreferential(id, isShow) {
		if (isShow) {
			$('#map_dis_' + id).show();
		} else {
			$('#map_dis_' + id).hide();
		}
	}

	$(function() {
		$('.relateSelect1 li').each(function(i) {
			$(this).mouseover(function() {
				$(this).addClass('on').siblings().removeClass('on');
				var cityChange = $('.addrDetail').eq(i);
				cityChange.show();
				$('.addrDetail').not(cityChange).hide().end();
			});
		});
	});

	//城市tab选择
	var cityTab = $('#cityselecttitleul li a');
	cityTab.each(function(e) {
		cityTab.eq(e).click(function() {
			var value = $(this).attr("value");
			if (value == "hotcity") {
				loadhotCity($('#hotcity'));
			} else if (value == "overseas") {
				loadOverseasCity($("#cityselectul"));
			} else {
				loadheadCity(value, $("#cityselectul"));
			}
		});
	});

	//城市选择
	$('#cityselectul,#searh-recent,#cityselectulcity').click(function(e) {
		if ($(e.target).hasClass("cityselecta")) {
			var citya = $(e.target);
			$('#searchcityin').val(citya.attr("cityname"));
			$('#searchcityin').attr("cityname", citya.attr("cityname"));
			$('#searchcityin').attr("citypinyin", citya.attr("citypinyin"));
			$('#searchcityin').attr("surl", citya.attr("surl"));
			$("#searchcitydiv").css("display", "none");
			var cityvalue = $('#searchcityin').val();
			searchBtnClick(cityvalue, 0, 'list');
		}
	});
	$('.facility_type').html($('#facility_type_count').val());
	$('.bed_type').html($('#bed_type_count').val());
	//其他选项
	$(".othernum").each(function() {
		var hasnum = parseInt($(this).text());
		if (hasnum > 0) {
			$(this).css("display", "inline-block");
		}
	})
</script>

</html>