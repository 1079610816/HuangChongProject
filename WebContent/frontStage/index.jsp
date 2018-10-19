<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>【黄虫短租】民宿预订首选</title>
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/mayi_base.css">
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/public.css">
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/jquery.bxslider.css">
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/js/layer/skin/layer.css">
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/new_calendar.css">
<link rel="stylesheet"
	href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/index.css?v=2018.8.8">
<!-- <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script> -->
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
	
</head>

<body>
	<div class="header">
		<div class="nav index_nav line_h70">
			<div class="w1050 c_white clearfloat">
				<ul class="fr nav-list clearfloat">
					
                   <li class="Service">
						<p class="top-line"></p> <span class="c_white fw600 f14">客服热线</span>
						<ul class="hover-list radius-6 c_gray_dark t-center" id="Service">
							<li>400-028-6868</li>
						</ul>
					</li>
					<li class="help">
						<p class="top-line"></p> <a class="fw600 f14 c_white"
						href="javascript:void(0);"> 帮助中心 </a>
						<ul class="hover-list radius-6 c_gray_dark t-left left42" id="helpUser">
							<li class="mb10"><a class="c_gray_dark" target="_blank"
								href="questions.html">搜索房源</a></li>
							<li class="mb10"><a class="c_gray_dark" target="_blank"
								href="questions.html">预订房源</a></li>
							<li class="mb10"><a class="c_gray_dark" target="_blank"
								href="questions.html">订单操作</a></li>
							<li class="mb10"><a class="c_gray_dark" target="_blank"
								href="questions.html">入住评论</a></li>
						</ul>
					</li>
					
					<li class="ml20 user-action">
						<div class="login-btn t-center fw600 cursorpt " id="loginshow">登录/注册</div>
						<div class="login-info f0 " style="display: none;">
		                        <p class="top-line"></p>
	                            <a href="javascript:menufrozen(870177979,'/tenant/870177979/orders','user')">
	                            <img class="user-head circle" src="${user!=null?user.imgUrl:' '}" alt="头像"></a>
	                            <span class="f14 fw600 ver-t">${sessionScope.user.nickName}</span>
	                            <ul class="hover-list radius-6" style="display: none;" id="info">
	                                <li class="t-left mb15 theme">
	                                    <a class="f16 fw600 c_gray_dark" href="javascript:menufrozen(870177979,'/tenant/870177979/orders','user')">我是房客</a>
	                                </li>
	                                <li class="t-left ">
	                                    <a class="c_gray_dark mr40" href="../os.action?op=allUserOrders&userId='${user.userId}'">我的订单</a>
	                                    <a class="c_gray_dark" href="javascript:menufrozen(870177979,'/user/tenant/accountmanager','user')">我的账户</a>
	                                </li>
	                                <li class="t-left ">
	                                    <a class="c_gray_dark mr40" href="javascript:menufrozen(870177979,'/user/tenant/mycollection','user')">我的收藏</a>
	                                    <a class="c_gray_dark" href="javascript:menufrozen(870177979,'/user/tenant/msgmanager','user')">消息通知</a>
	                                </li>
	                               
	                                <hr class="mb15">
	                                <li class="t-left theme relave fd-nav ">
		                                <a class="f16 fw600 c_gray_dark radius-6 w100" href="javascript:fdMenu()" >我是房东</a>
		                               	<ul class="fd-item-list radius-6 hidden" id="fangdong">
			                                <li class="t-left ">
			                                    <a class="c_gray_dark mr40" href="landlord.jsp">订单管理</a>
			                                    <a class="c_gray_dark" href="javascript:menufrozen(870177979,'/user/landlord/roommanager','landlord')">房源管理</a>
			                                </li>
			                                <li class="t-left ">
			                                    <a class="c_gray_dark mr40" href="javascript:menufrozen(870177979,'/user/landlord/msgmanager','landlord')">消息通知</a>
			                                    <a class="c_gray_dark" href="javascript:menufrozen(870177979,'/landlord/870177979/settlements','landlord')">结算管理</a>
			                                </li>
			                                <li class="t-left ">
			                                    <a class="c_gray_dark mr40" href="javascript:menufrozen(870177979,'/user/landlord/landlordweixin','landlord')">房东微信</a>     
			                                </li>
			                                <li class="t-left ">
			                                    <a class="c_gray_dark mr40" href="javascript:menufrozen(870177979,'/user/landlord/accountmanager','landlord')">我的设置</a>
			                                </li>
		                                </ul>
	                                 </li>
	                                <li>
	                                    <div class="login-out" id="loginoutbut">退出登录</div>
	                                </li>
	                            </ul>
	                        </div>
					</li>
				</ul>
			</div>
		</div>
		<!-- 首页轮播图开始 -->
		<div class="banner clearfloat">
			<ul id="banner">
				<li><img
					src="//i1.mayi.com/mayi68/M83/GP/QO/FPRM3Z7YH3P2JUTP6SNQN25QBR43T8.jpg"
					alt="banner1">
					<div class="w1050">
						<div class="banner-text">
							<p class="c_white f36 fw700">黄虫短租</p>
							<p class="c_white f48 fw700">家庭出游新选择</p>
							<p class="c_white f18">2000万用户的放心选择</p>
						</div>
					</div></li>
				<li><a href="/room/851095920" target="_blank"
					_mayi_rp="webindex|banner|851095920"> <img
						src="https://i1.mayi.com/mayi29/M24/TY/KH/WXT5SYMCRWK6KSXL59UNNT95A9ZE32.jpg"
						alt="banner2">
						<div class="w1050">
							<div class="room-info clearfloat w1050">
								<img class="fr circle ml15"
									src="https://i1.mayi.com/mayi98/M28/VH/EK/42AW7FWLF29BTBVZUBCJJ8UN6WNFX8.jpg_35x35c.jpg"
									alt="头像">
								<div class="fr">
									<p class="local t-right">
										<span class="radius-6 f14 c_gray_dark fw600">厦门</span>
									</p>
									<p class="c_white f14 fw600">肆號</p>
								</div>
							</div>
						</div>
				</a></li>
				<li><a href="/room/851635911" target="_blank"
					_mayi_rp="webindex|banner|851635911"> <img
						src="https://i1.mayi.com/mayi28/M14/SF/ZP/GXBHQBZH4F2T3KYKC2ZKUH9ELJ8JBR.jpg"
						alt="banner2">
						<div class="w1050">
							<div class="room-info clearfloat w1050">
								<img class="fr circle ml15"
									src="https://i1.mayi.com/mayi15/M55/NS/HZ/U468G6GGWGE9XPJX3JEVA7BTPDGVP3.jpg_35x35c.jpg"
									alt="头像">
								<div class="fr">
									<p class="local t-right">
										<span class="radius-6 f14 c_gray_dark fw600">福州</span>
									</p>
									<p class="c_white f14 fw600">天际线】外滩超大180平景观豪华大三房</p>
								</div>
							</div>
						</div>
				</a></li>
				<li><a href="/room/851895184" target="_blank"
					_mayi_rp="webindex|banner|851895184"> <img
						src="https://i1.mayi.com/mayi19/M40/MX/MV/9GTZMMG2W5Y3JVCL9JCSRX7QWQT6WG.jpg"
						alt="banner2">
						<div class="w1050">
							<div class="room-info clearfloat w1050">
								<img class="fr circle ml15"
									src="https://i1.mayi.com/mayi18/M74/UZ/CW/NDHWG83JVGK4NLN8LG7AUG5WN3RF9S.jpg_35x35c.jpg"
									alt="头像">
								<div class="fr">
									<p class="local t-right">
										<span class="radius-6 f14 c_gray_dark fw600">泉州</span>
									</p>
									<p class="c_white f14 fw600">古城幽兰尚居 花朝双床房</p>
								</div>
							</div>
						</div>
				</a></li>
				<li><a href="/room/852832929" target="_blank"
					_mayi_rp="webindex|banner|852832929"> <img
						src="https://i1.mayi.com/mayi85/M31/DJ/WR/QGGYU2SNTBHH38ZR8TWLSGHZ9LY9NM.jpg"
						alt="banner2">
						<div class="w1050">
							<div class="room-info clearfloat w1050">
								<img class="fr circle ml15"
									src="https://i1.mayi.com/mayi96/M43/RM/NQ/V24CGB95HAH6W5X6SJ5C53DY35EHS2.jpg_35x35c.jpg"
									alt="头像">
								<div class="fr">
									<p class="local t-right">
										<span class="radius-6 f14 c_gray_dark fw600">漳州</span>
									</p>
									<p class="c_white f14 fw600">花与画/火车站/户部巷/高层观景房</p>
								</div>
							</div>
						</div>
				</a></li>
			</ul>
		</div>
		<!-- 首页轮播图结束 -->
	</div>
	<!-- 内容 -->
	<div class="container w1050">
		<!-- 搜索栏 -->
		<div class="search radius-12">
			<div class="clearfloat">
				<!-- 这里需要修改,目的地,我们是固定几个地点 -->
				<div class="fl relave bor-r-eb t-left place clearfloat">
					<div class="theme c_gray f14">目的地</div>
					<div class="input-box active">
						<input class="f18 c_gray_light fw700" id="searchcityin"
							onkeydown="pressEve(event);" onkeyup="getSuggests(event,0);"
							type="text" placeholder="城市、景点、商圈"> <span class="circle"
							id="clearCityInfo" style="display: none;">&times;</span>
					</div>
					<!-- 联想词,应该是动态增加-->
					<div
						class="suggest_results search-modal has-words radius-12 c_gray_dark"
						id="suggest">
						<ul id="suggestul">
							<li>厦门</li>
							<li>北京</li>
							<li>上海</li>
						</ul>
					</div>
					<div class="error_tip_list search-modal radius-12"
						id="tip_searchcity">关键词无结果</div>
					<!-- 城市列表弹框 -->
					<div
						class="select-hotcity clearfloat search-modal radius-12 c_gray_dark"
						id="searchcitydiv" name="searchcitydiv">
						<div class="searh-recent clearfloat history">
							<p class="w100 clearfloat">
								<span class="searh-tit fl fw700">历史搜索</span><span
									class="cleartrace fr clear" onclick="return Bind_Click(this);"
									_mayi_rp="webindex|condition|clearHistory"></span>
							</p>
							<ul id="searh-recent" class="clearfloat citys">
							</ul>
						</div>
						<ul class="select-title clearfloat tab" id="cityselecttitleul">
							<li class="active"><a value="hotcity" id="hotcity"
								class="selected" href="javascript:void(0)">热门目的地</a></li>
						</ul>
						<!--<ul class="select-citycon clearfix" id="cityselectulcity" name="cityselectul"></ul>-->
						<ul class="select-citycon clearfloat tab-content"
							id="cityselectul" name="cityselectul">
							
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="厦门" surl="/xiamen" citypinyin="xiamen">厦门</a></li>
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="福州" surl="/fuzhou" citypinyin="fuzhou">福州</a></li>
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="泉州" surl="/quanzhou" citypinyin="quanzhou">泉州</a></li>
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="漳州" surl="/zhangzhou" citypinyin="zhangzhou">漳州</a></li>
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="宁德" surl="/ningde" citypinyin="ningde">宁德</a></li>
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="三明" surl="/sanming" citypinyin="sanming">三明</a></li>
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="莆田" surl="/putian" citypinyin="putian">莆田</a></li>
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="龙岩" surl="/longyan" citypinyin="longyan">龙岩</a></li>
							<li class="citylili"><a class="cityselecta" href="javascript:void(0)" cityname="南平" surl="/nanping" citypinyin="nanping">南平</a></li>
							
						</ul>
						<div class="hotmore hint f12 c_gray">温馨提示：支持中文/拼音/简拼输入</div>
					</div>
				</div>
				<!-- 住宿时间 -->
				<div class="fl relave bor-r-eb t-center plr40 time clearfloat"
					id="calendar_group">
					<div class="theme c_gray f14 t-left">住宿日期</div>
					<div class="input-box">
						<input id="checkinday" readonly class="f18 c_gray_light fw700"
							type="text" placeholder="入住日期"> <input
							id="checkinday_value" type="hidden">
						<div class="count">
							<span class="f12 c_gray_dark" id="zrdays">0晚</span>
						</div>
						<input id="checkoutday" readonly class="f18 c_gray_light fw700"
							type="text" placeholder="退房日期"> <input
							id="checkoutday_value" type="hidden">
					</div>
					<span class="circle clear" id="clearSelect" style="display: none;"
						_mayi_rp="webindex|condition|clearCalendar">&times;</span>
					<div id="index_list_calendar-box" class="hidden search-modal"></div>
				</div>
				<!-- 入住人数 -->
				<div class="fl relave t-center plr40 t-left people">
					<div class="theme c_gray f14 ">入住人数</div>
					<div class="chose-people cursorpt input-box">
						<span class="f18 c_gray_dark fw700" id="countVal">不限</span>
					</div>
					<div id='ruzhunum' class="search-modal radius-12 c_gray_dark"
						_mayi_rp="webindex|condition|peopleNum">
						<ul>
							<li peoplenum="不限">不限</li>
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
				<div
					class="fr relave search-btn f24 c_white fw600 t-center cursorpt"
					id="indexSel" _mayi_rp="webindex|condition|button">搜索民宿</div>
				<script type="text/javascript" >
						
						$("#indexSel").click(function () {
							var arrcity = new Array("福州","厦门","莆田","漳州","泉州","龙岩","宁德","三明","南平");
							//console.log(arrcity);
							//得到用户输入的城市关键字
							var searchcity = $("#searchcityin").val();
							//得到用户输入的入住日期
							var inday = $("#checkinday").val();
							//得到用户输入的退房日期
							var outday = $("#checkoutday").val();
							//得到用户选择的入住人数
							var countVal = $("#countVal").attr("popnum");
							//判断用户输入的城市名是否在范围内
							 var flag =false;
							//遍历arrcity数组
							$.each(arrcity,function(i,v){
								//console.log(v);
								   if(searchcity==v){
									   flag = true;
								       return false;
								   }
								   else{
									   flag=false;
								   }
								   
							});
							 if(flag){
								 
								 var url = "../ss.action?op=searchlist&Area="+searchcity;
								  if(inday!=null&&inday!=""&&inday!="入住时间"){
										url = url + "&d1="+inday;
										
										if(outday!=null&&outday!=""&&outday!="退房时间"){
												url = url + "&d2="+outday;
										}
									} 
									
									location.href=url;
							 }else{
								 alert("请输入正确的地址!");
							 }
					
						});
						
					</script>
			</div>
		</div>
		<!-- 旅行,就要住民宿 -->
		<div class="index-block">
			<div class="header clearfloat">
				<img class="fl"
					src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/images/homestay.png">
				<div class="fl">
					<h1 class="f28 c_gray_dark fw700">旅行，就要住民宿</h1>
					<p class="f14 c_gray">
						<span>谈笑有鸿儒，往来无白丁</span>
					</p>
				</div>
			</div>
			<div class="content clearfloat homestay">
				<div class="fl f0">
					<a class="relave radius-12 w515" href="../ss.action?op=searchlist&Area=福州"
						_mayi_rp="webindex|lvxing1|mj"> <img class=" lazy" width="515"
						height="261" src="img/houses.jpg" alt="民居"> <span
						class="f20 c_gray_dark fw600">民居</span>
					</a>
					 <br> 
					 <a class="relave radius-12 w248 mr20 mt20"
						href="../ss.action?op=searchlist&Area=泉州" _mayi_rp="webindex|lvxing1|lyf"> <img
						class="lazy" height="180" src="img/oldhouse.jpg" width="248"
						alt="老洋房"> <span class="f20 c_gray_dark fw600 three">老洋房</span>
					</a> 
					<a class="relave radius-12 w248 mt20" href="../ss.action?op=searchlist&Area=厦门"
						_mayi_rp="webindex|lvxing1|hjf"> <img class="lazy"
						height="180" src="img/seaview.jpg" width="248" alt="海景房"> <span
						class="f20 c_gray_dark fw600 three">海景房</span>
					</a>
				</div>
				<div class="fr f0">
					<a class="relave radius-12 w248 mr20" href="../ss.action?op=searchlist&Area=三明"
						_mayi_rp="webindex|lvxing1|kz"> <img class="lazy" height="180"
						src="img/inn.jpg" width="248" alt="客栈"> <span
						class="f20 c_gray_dark fw600">客栈</span>
					</a> <a class="relave radius-12 w248" href="../ss.action?op=searchlist&Area=厦门"
						_mayi_rp="webindex|lvxing1|bs"> <img class="lazy" height="180"
						src="img/inn.jpg" width="248" alt="别墅"> <span
						class="f20 c_gray_dark fw600">别墅</span>
					</a> <br> <a class="relave radius-12 w515 mt20"
						href="../ss.action?op=searchlist&Area=福州" _mayi_rp="webindex|lvxing1|gy"> <img
						class="lazy" height="261" width="515" src="img/apartment.jpg"
						alt="公寓"> <span class="f20 c_gray_dark fw600">公寓</span>
					</a>
				</div>
			</div>
		</div>
		<!-- 热门目的地 -->
		<div class="index-block">
			<div class="header clearfloat">
				<img class="fl"
					src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/images/hotplace.png">
				<div class="fl">
					<h1 class="f28 c_gray_dark fw700">热门目的地</h1>
					<p class="f14 c_gray">
						<span>灵魂和身体，总有一个在路上</span>
					</p>
				</div>
			</div>
			<div class="content clearfloat">
				<div class="fl t-left mr20">
					<div class="hot-place f0">
						<a class="inline-block radius-12 w158" href="../ss.action?op=searchlist&Area=厦门"
							_mayi_rp="webindex|hot|beijing"> <img class="lazy"
							width="158" height="220" src="img/h-xiamen.jpg"alt="厦门">
							<div class="info ">
								<p class="fw600 f18">
									厦门·<span class="f12 ">57999家住宿</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				<div class="fl t-left  mr20">
					<div class="hot-place f0">
						<a class="inline-block radius-12 w158" href="../ss.action?op=searchlist&Area=福州"
							_mayi_rp="webindex|hot|chengdu"> <img class="lazy"
							width="158" height="220" src="img/h-fuzhou.jpg" alt="福州">
							<div class="info ">
								<p class="fw600 f18">
									福州·<span class="f12 ">30200+家住宿</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				<div class="fl t-left  mr20">
					<div class="hot-place f0">
						<a class="inline-block radius-12 w158" href="../ss.action?op=searchlist&Area=泉州"
							_mayi_rp="webindex|hot|xiamen"> <img class="lazy" width="158"
							height="220" src="img/h-quanzhou.jpg" alt="泉州">
							<div class="info ">
								<p class="fw600 f18">
									泉州·<span class="f12 ">13450+家住宿</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				<div class="fl t-left  mr20">
					<div class="hot-place f0">
						<a class="inline-block radius-12 w158" href="../ss.action?op=searchlist&Area=漳州"
							_mayi_rp="webindex|hot|guangzhou"> <img class="lazy"
							width="158" height="220" src="img/h-zhangzhou.jpg" alt="漳州">
							<div class="info ">
								<p class="fw600 f18">
									漳州·<span class="f12 ">38100+家住宿</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				<div class="fl t-left  mr20 ">
					<div class="hot-place f0">
						<a class="inline-block radius-12 w158" href="../ss.action?op=searchlist&Area=三明"
							_mayi_rp="webindex|hot|hangzhou"> <img class="lazy"
							width="158" height="220" src="img/h-sanming.jpg" alt="三明">
							<div class="info ">
								<p class="fw600 f18">
									三明·<span class="f12 ">21100+家住宿</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				<div class="fl t-left ">
					<div class="hot-place f0">
						<a class="inline-block radius-12 w158" href="../ss.action?op=searchlist&Area=龙岩"
							_mayi_rp="webindex|hot|shanghai"> <img class="lazy"
							width="158" height="220" src="img/h-longyan.jpg" alt="龙岩">
							<div class="info ">
								<p class="fw600 f18">
									龙岩·<span class="f12 ">27200+家住宿</span>
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
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
				<img src="img/loginewm.jpg" style="width: 200px; height: 200px;">
			</div>
		</div>
	</div>

	<!-- 登录弹窗 END -->






	<script src="js/jquery.bxslider.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/layer.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/new_calendar.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jQuery.md5.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/loginpc.js" type="text/javascript" charset="utf-8"></script>
	<!-- 目的地模块js -->
	<script src="js/js_index.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"
		src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/js/js_index_index.js"></script>
	<script type="text/javascript"
		src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/js/index_searchlist_public.js"></script>
	<script type="text/javascript"
		src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/js/index_own.js"></script>
	<script type="text/javascript"
		src="//staticnew.mayi.com/duanzu/resourcesWap/common/js/c.js"></script>
	<script
		src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/js/jquery.nicescroll.min.js"></script>
	<script
		src="//staticnew.mayi.com/resourcesWeb/js/allcity.js?V=20170414"></script>
	<script
		src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/js/index_PCown.js"></script>
	<script
		src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/js/jquery.lazyload.min.js"></script>
	<script
		src="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/js/index.js?v=2018.8.6"></script>
	<script type='text/javascript'
		src='//webchat.7moor.com/javascripts/7moorInit.js?accessId=73859f20-f357-11e6-b43e-3b18b16942dc&autoShow=false'
		async='async'></script>
	<script type="text/javascript"
		src="//staticnew.mayi.com/resourcesWeb/js/util/jquery.qrcode.min.js"></script>

	

	<!--公共底部-->
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