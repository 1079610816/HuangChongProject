$(document).ready(function() {		
	//登陆弹窗
	var loginboxlayer,login_flag = false;
	function showLoginboxDiv(){
		// kgj add 判断二级域名
		var subdomain = $("#subdomain").val();
		if(subdomain!=null&&subdomain!='')
		{
			resetLoginUrl();
		}
		else
		{
			loginboxlayer = $.layer({
				closeBtn : [0 , false],
				type : 1,
				title : false,
				offset:['150px' , ''],
				border : [0,0,'',false],
				area : ['auto','auto'],
				move : ['.login-type',false],
				page : {dom : '#loginboxdiv'}
			});
			$('#loginclose').on('click',function(){
				layer.close(loginboxlayer);
				$(this).css({
					"background-color":"#E6E7EB",
				});
			});
			$('#loginclose').on('mouseover',function(){
				$(this).css({
					"background-color":"#A8A8A8",
				});
			});
			$('#loginclose').on('mouseout',function(){
				$(this).css({
					"background-color":"#E6E7EB",
				});
			});
			login_flag = false;
			changeAuthSrc(1);
		}
	}

	//后台跳转首页并弹出登陆框
	var headlogin =  function headlogin(){
		var nexturl = $('#loginurl').val();    
		var autologin = getParameterByName("autologin"); 
		if(nexturl!=null&&nexturl!="none"){
			$('#loginboxdiv').attr("nexturl",nexturl);
			showLoginboxDiv();
		}	
		// kgj add 判断二级域名自动弹出登陆框
		else if(autologin!=null&&autologin!='')
		{				
			if($("#head_nickname").html()==null)		
				showLoginboxDiv();
		}		
		else{
			return false;
		}
	}

	//未登录点击站内信显示登陆框	
	$('#talksLogin').on('click',function(){
		$('#loginboxdiv').attr("nexturl","none");
		showLoginboxDiv();
	});

	//列表页点击房东图像显示登陆框	
	$('.searchLogin').on('click',function(){
		$('#loginboxdiv').attr("nexturl","none");
		showLoginboxDiv();
	});

	//调用一次自动登录
	headlogin();

	//显示登陆框	
	$('#loginshow').on('click',function(){		  
		$('#loginboxdiv').attr("nexturl","none");
		showLoginboxDiv();
	});

	//其它地方要调登陆
	$('.loginatother').on('click',function(e){
		var nexturl = $(e.target).attr("nexturl");
		if(nexturl!=null&&nexturl!="none"){
			$('#loginboxdiv').attr("nexturl",nexturl);
		}
		showLoginboxDiv();
	});

	//切换到手机号码登录
	$('#changeloginbymwa,#changeloginbyma').on('click',function(){
		//去蚂蚁登陆样式
		$('#changeloginbyup').removeClass('mayiway_current');   
		$('#changeloginbyup').addClass('mayiway'); 
		$("#loginbyupdiv").css("display","none");
		$("#loginbymadiv").css("display","block");	
		changeAuthSrc(1);
		$('#changeloginbyma').removeClass('phoneway');   
		$('#changeloginbyma').addClass('phoneway_current'); 
	});

	//切换到蚂蚁账号登录
	$('#changeloginbyup').on('click',function(){
		//去手机 登陆样式
		$('#changeloginbyma').removeClass('phoneway_current');   
		$('#changeloginbyma').addClass('phoneway'); 	
		$("#loginbymadiv").css("display","none");
		$("#loginbyupdiv").css("display","block");
		changeAuthSrc(2);
		$('#changeloginbyup').removeClass('mayiway');   
		$('#changeloginbyup').addClass('mayiway_current'); 
	});
	//显示登陆框	
	$('.btn-img').on('click',function(){	
		$('#loginboxdiv').attr("nexturl","none");
		showLoginboxDiv();
	});

	//倒计时方法
	var loginwait=60;
	function logintime(){
		if (loginwait == 0) {
			$('#getLoginCode').val("获取验证码");				
			$('#getLoginCode').removeClass("sending");
			$('#getLoginCode').addClass("defaultsend");
			changeAuthSrc(1);
			loginwait =60;
		} else {
			$('#getLoginCode').val(loginwait+"s");
			$('#getLoginCode').removeClass("defaultsend");
			$('#getLoginCode').addClass("sending");
			loginwait--;
			setTimeout(
					function() {
						logintime();
					},
					1000
			);
		}
	}

	//make random
	function makeRand(){ 
		var Num=""; 
		for(var i=0;i<4;i++){ 
			Num+=Math.floor(Math.random()*10); 
		} 
		return Num;
	} 

	//更新图片验证码		     
	function changeAuthSrc(type){
		//Math.random()生成随机数没有实际的操作作用
		//但是随机数的作用是进servlet
		//$("#validationCode_img1").attr("src","../ValidateCode?op=1"); 
		//第一次能进servlet里,当第二次掉用的时候,因为地址没有变所以浏览器认为请求相同,所以用上一次的结果,不会去访问该路径,达不到点击图片进行刷新的效果
		//$("#validationCode_img1").attr("src","../ValidateCode?op=1&random="+makeRand());
		//添加随机数后,每次都会访问
		if(type==1){
			$("#validationCode_img1").attr("src","ValidateCode?op=1&random="+Math.random());
		}
		if(type==2){
			$("#validationCode_img").attr("src","ValidateCode?op=2&random="+Math.random());
		}
	}

	//点击更新
	$('#validationCode_img').on('click',function(){
		changeAuthSrc(2);	  	
	});
	//点击更新
	$('#validationCode_img1').on('click',function(){
		changeAuthSrc(1);	  	
	});

	//登陆时获取手机验证码
	$('#getLoginCode').click(function(){
		
		if($('#getLoginCode').hasClass("sending")){
			return false;
		}
		var telNum = $('#telNum').val();
		if(telNum==null || telNum==""){
			layer.alert("请输入手机号！",8,"温馨提示");
			return false;
		}
		var code = $("#code_num").val();
		var val_imagecode = $('#validationCode1').val();
		if(val_imagecode!=null&&val_imagecode!=""){
			var phone_number_regex = /^0?1[3456789]\d{9}$/;
			if(code != '86' && code != ""){
				phone_number_regex = /^0?\d{5,11}$/;
			}
			if (phone_number_regex.test(telNum)) {			      	    
				logintime();//加入倒计时
				//var ctx = $('#ctx').val();
				$.post("../us.action?op=getByTelNum", "telNum=" + telNum+"&validationCode1="+val_imagecode,function(re) {
					if(re!=null){	
						
						if(re=="1"){
							layer.alert("短信发送成功",8,"温馨提示");			
							return false;
						}else if(re=="0"){							
							layer.alert("短信发送失败",8,"温馨提示");
							loginwait=0;					
							return false;
						}else{
							layer.alert("图形验证码错误，请重新填写！",8,"温馨提示");
							loginwait=0;
							return false;
						}
					}				
				},'JSON');
			}else{
				layer.alert("请输入合法的手机号！",8,"温馨提示");
			}
		}else{
			layer.alert("请填写图片中的验证码！",8,"温馨提示");
		}
	});

	//登陆方法
	function logindo(param1,param2,logintype){
		/*if(login_flag){
			return ;
		}
		login_flag = true;*/
//		var ctx = $('#ctx').val();
	/*	var val_autologin = true;
		var areacode = '';*/
		/*if(logintype=="up"){
			val_autologin = $("input[name='rememberpass']").is(':checked'); 
			if(code_flag == true)areacode = $("#code_num_1").val();
		}	else if(logintype=="ma"){
			val_autologin = $("input[name='rememberloginstate']").is(':checked'); 
			areacode = $("#code_num").val();
		}*/
//		var val_imagecode =$('#imagecode').val();
		if(logintype=="ma"){
		var	validationCode1 =$('#validationCode1').val();
		$.post("../us.action?op=loginByMsg", "telNum=" + param1
				+ "&loginCode=" + param2 + "&validationCode1="
				+ validationCode1, function(data, status) {
			if ("3" == data) {
				window.location.reload();
			} else if ("2" == data) {
				window.location.reload();
			} else if ("1" == data) {
				$('#maerrordiv .errorprompt').remove();
				var span = '<span class="errorprompt">手机验证码错误!</span>';
				$('#maerrordiv').append(span);	
				
			} else {
				$('#maerrordiv .errorprompt').remove();
				var span = '<span class="errorprompt">图形验证码错误!</span>';
				$('#maerrordiv').append(span);	
			}
		});
		}else{
			var	validationCode =$('#validationCode').val();
			$.post("../us.action?op=loginByPwd", "userName=" + param1
					+ "&userPwd=" + param2 + "&validationCode="
					+ validationCode, function(data) {
				if ("2" == data) {
					window.location.reload();
				} else if ("1" == data) {
					$('#uperrordiv .errorprompt').remove();
					var span = '<span class="errorprompt">账号或密码错误!</span>';
					$('#uperrordiv').append(span);	
					$("#userName").val("");
					$("#userPwd").val("");
					$("#validationCode").val("");
					changeAuthSrc(2);
				} else {					
					$('#uperrordiv .errorprompt').remove();
					var span = '<span class="errorprompt">图形验证码错误</span>';
					$('#uperrordiv').append(span);	
					$('#validationCode').val("");
					changeAuthSrc(2);
				}
			});
		}
		
	}

	//点击手机号输入框	
	$('#telNum').on('click',function(){
		$('#maerrordiv .errorprompt').remove();
	});	 

	//点击手机验证码输入框	
	$('#loginCode').on('click',function(){
		$('#maerrordiv .errorprompt').remove();
	});

	//手机验证码输入框 回车事件
	$("#loginCode").keydown(function(e){
		var curKey = e.which; 
		if(curKey == 13){
			var mobile = $('#telNum').val();
			var phonecode = $('#loginCode').val();
			var val_imagecode = $('#validationCode1').val();
			if(val_imagecode==null||val_imagecode==""){
				$('#maerrordiv .errorprompt').remove();
				var span = '<span class="errorprompt">验证码不能为空</span>';
				$('#maerrordiv').append(span);				
				return false;
			}
			if(mobile==null||mobile==""
				||phonecode==null||phonecode==""){
				$('#maerrordiv .errorprompt').remove();
				var span = '<span class="errorprompt">手机号或验证码不能为空</span>';
				$('#maerrordiv').append(span);
				return false;
			}else{		    	
				var phone_number_regex = /^0?1[3456789]\d{9}$/;
				if($("#code_num").val() != '86'){
					phone_number_regex = /^0?\d{5,11}$/;
				}
				if (phone_number_regex.test(mobile)) {
					$('#maerrordiv .errorprompt').remove();
					logindo(mobile,phonecode,'ma');
				}else{
					layer.alert("请输入合法的手机号！",8,"温馨提示");
				}
			}
		}
	});


	//点击用户名输入框
	$('#userName').on('click',function(){
		$('#uperrordiv .errorprompt').remove();
	});
	//点击验证码的输入框
	$('#validationCode').on('click',function(){
		$('#uperrordiv .errorprompt').remove();
	});

	//用户名输入框 回车事件
	$("#userName").keydown(function(e){
		var curKey = e.which; 
		if(curKey == 13){
			var userName = $('#userName').val();
			if(userName!=null&&userName!=""){
				$("#userPwd").focus(); 
			}
		}
	});

	//点击密码输入框
	$('#userPwd').on('click',function(){
		$('#uperrordiv .errorprompt').remove();
	});

	//验证码输入框 回车事件
	$("#validationCode").keydown(function(e){
		var curKey = e.which; 
		if(curKey == 13){       	
			var userName = $('#userName').val();
			var userPwd = $('#userPwd').val();
			var validationCode = $('#validationCode').val();
			if(validationCode==null||validationCode==""){
				$('#uperrordiv .errorprompt').remove();
				var span = '<span class="errorprompt">验证码不能为空</span>';
				$('#uperrordiv').append(span);
				return false;
			}
			if(userName==null||userName==""||userPwd==null||userPwd==""){
				$('#uperrordiv .errorprompt').remove();
				var span = '<span class="errorprompt">用户名或密码不能为空</span>';
				$('#uperrordiv').append(span);
				return false;
			}else{
				$('#uperrordiv.errorprompt').remove();
				logindo(userName,userPwd,'up');
			}
		}
	});

	//手机登陆按钮
	$('#loginByTelNum').on('click',function(){
		var mobile = $('#telNum').val();
		var phonecode = $('#loginCode').val();
		var val_imagecode = $('#validationCode1').val();		
		if(mobile==null||mobile==""
			||phonecode==null||phonecode==""){
			$('#maerrordiv .errorprompt').remove();
			var span = '<span class="errorprompt">手机号或短信验证码不能为空</span>';
			$('#maerrordiv').append(span);
			return false;
		}
		if(val_imagecode==null||val_imagecode==""){
			$('#maerrordiv .errorprompt').remove();
			var span = '<span class="errorprompt">图形验证码不能为空</span>';
			$('#maerrordiv').append(span);			
			return false;
		}
		var phone_number_regex = /^0?1[3456789]\d{9}$/;
		if($("#code_num").val() != '86'){
			phone_number_regex = /^0?\d{5,11}$/;
		}
		if (phone_number_regex.test(mobile)) {
			$('#maerrordiv .errorprompt').remove();
			logindo(mobile,phonecode,'ma');
		}else{
			layer.alert("请输入合法的手机号！",8,"温馨提示");
		}
	});

	//黄虫账号登录按钮
	$('#loginByPassword').on('click',function(){
		var userName = $('#userName').val();
		var userPwd = $('#userPwd').val();
		var validationCode = $('#validationCode').val();
		if(userName==null||userName==""
			||userPwd==null||userPwd==""){
			$('#uperrordiv .errorprompt').remove();
			var span = '<span class="errorprompt">用户名或密码不能为空</span>';
			$('#uperrordiv').append(span);
			return false;
		}
		if(validationCode==null||validationCode==""){
			$('#uperrordiv .errorprompt').remove();
			var span = '<span class="errorprompt">图形验证码不能为空</span>';
			$('#uperrordiv').append(span);
			return false;
		}
		$('#uperrordiv .errorprompt').remove();
		logindo(userName,userPwd,'up');
	});

	//qq登陆
	$('#loginbyqq').on('click',function(){
		var nexturl = window.location.href;
		var tempurl = $('#loginboxdiv').attr("nexturl");
		if(tempurl!=null&&tempurl!=""&&tempurl!="none"){
			nexturl = tempurl;
		}
		var ctx = $('#ctx').val();
		location.href =  ctx+"/userloginfromqq.html?next="+nexturl;	      
	});

	//sina登陆
	$('#loginbysina').on('click',function(){
		var nexturl =window.location.href;
		var tempurl = $('#loginboxdiv').attr("nexturl");
		if(tempurl!=null&&tempurl!=""&&tempurl!="none"){
			nexturl = tempurl;
		}
		var ctx = $('#ctx').val();
		location.href =  ctx+"/userloginfromsina.html?next="+nexturl;	  
	});
	
	//微信登陆
	$('#loginbywx').on('click',function(){
		var nexturl = window.location.href;
		var tempurl = $('#loginboxdiv').attr("nexturl");
		if(tempurl!=null&&tempurl!=""&&tempurl!="none"){
			nexturl = tempurl;
		}
		var ctx = $('#ctx').val();
		location.href =  ctx+"/userloginfromweixin.html?next="+nexturl;	      
	});

	//退出
	$('#loginoutbut').on('click',function(){
		$.get("../us.action?op=loginOut",function(re){
			if(re=="success"){
				location.reload(); 
			}
		},'text'); 
	});

	//点击“我的订单”(游客)
	/**$('#myorder').on('click',function(){
	 	  var ctx = $('#ctx').val();
	 	  location.href =ctx+"/user/myorder";	  
	 });*/
	$('#loginnow').on('click',function(){
		$('#loginboxdiv').attr("nexturl","none");
		showLoginboxDiv();
	});
	$('#loginshowhead').on('click',function(){
		$('#flag').val('head');
		$('#loginboxdiv').attr("nexturl","none");
		showLoginboxDiv();
	});
	$('#loginnowmid').on('click',function(){
		$('#flag').val('mid');
		$('#loginboxdiv').attr("nexturl","none");
		showLoginboxDiv();
	});
	//首页banner图片自动
	var $banner=$('.banner');
	var $banner_ul=$('.banner-img');
	var $btn=$('.banner-btn');
	var $btn_a=$btn.find('a')
	var v_width=$banner.width();

	var page=1;

	var timer=null;
	var btnClass=null;

	var page_count=$banner_ul.find('li').length;//把这个值赋给小圆点的个数

	var banner_cir="<li class='selected' ><a href='javascript:void(0);'></a></li>";
	for(var i=1;i<page_count;i++){
		//动态添加小圆点
		banner_cir+="<li><a href='javascript:void(0);'></a></li>";
	}
	$('.banner-circle').append(banner_cir);

	var cirLeft=$('.banner-circle').width()*(-0.5);
	$('.banner-circle').css({'marginLeft':cirLeft});

	$banner_ul.width(page_count*v_width);

	function move(obj,classname){
		//手动及自动播放
		if(!$banner_ul.is(':animated')){
			if(classname=='prevBtn'){
				if(page==1){
					$banner_ul.animate({left:-v_width*(page_count-1)});
					page=page_count; 
					cirMove();
				}
				else{
					$banner_ul.animate({left:'+='+v_width},"slow");
					page--;
					cirMove();
				}        
			}
			else{
				if(page==page_count){
					$banner_ul.animate({left:0});
					page=1;
					cirMove();
				}
				else{
					$banner_ul.animate({left:'-='+v_width},"slow");
					page++;
					cirMove();
				}
			}
		}
	}

	function cirMove(){
		//检测page的值，使当前的page与selected的小圆点一致
		$('.banner-circle li').eq(page-1).addClass('selected')
		.siblings().removeClass('selected');
	}

	$banner.mouseover(function(){
		$btn.css({'display':'block'});
		clearInterval(timer);
	}).mouseout(function(){
		$btn.css({'display':'none'});                
		clearInterval(timer);
		timer=setInterval(move,2000);
	}).trigger("mouseout");//激活自动播放

	$btn_a.mouseover(function(){
		//实现透明渐变，阻止冒泡
		$(this).animate({opacity:0.6},'fast');
		$btn.css({'display':'block'});
		return false;
	}).mouseleave(function(){
		$(this).animate({opacity:0.3},'fast');
		$btn.css({'display':'none'});
		return false;
	}).click(function(){
		//手动点击清除计时器
		btnClass=this.className;
		clearInterval(timer);
		timer=setInterval(move,4000);
		move($(this),this.className);
	});
	$('.banner-circle li').click(function(){
		var index=$('.banner-circle li').index(this);
		$banner_ul.animate({left:-v_width*index},'slow');
		page=index+1;
		cirMove();
	}); 

	/**针对二级域名做处理**/
	var resetDomain = function() {
		var host = window.location.host;
		var subdomain = $("#subdomain").val();
		var url = window.location.href;
		if (subdomain != '') {
			window.location.href = url.replace(host, $("#mainsite").val());
		} else {
			var autologin = getParameterByName("autologin");
			if (autologin != null && autologin != '') {
				window.location.href = url.replace('autologin=true', '');
			} else {
				location.reload();
			}
		}
	}

	var resetLoginUrl = function() {
		var url = window.location.href;
		var host = window.location.host;
		if (url.indexOf("?") > 0) url += "&autologin=true";
		else url += "?autologin=true";
		window.location.href = url.replace(host,  $("#mainsite").val());
	}
	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
		var regexS = "[\\?&]" + name + "=([^&#]*)";
		var regex = new RegExp(regexS);
		var results = regex.exec(window.location.search);
		if (results == null) return "";
		else return decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	//2017.3.6新增las
	//弹出
	$('.choice_phone_type').unbind("click").bind('click',function(e){
		e.stopPropagation();
		toggleNationDiv();
	})
	$('.choice_phone_type_1').unbind("click").bind('click',function(e){
		e.stopPropagation();
		toggleNationDiv_1();
	})

	//洲的切换
	$('.nation_list .continent_list li').unbind("click").bind('click',function(){
		var index = $(this).index();
		$("#li_num").val(index);
		$(this).addClass('avtive_green').siblings().removeClass('avtive_green');
		$('.nation_tel_list li').eq(index).show().siblings().hide();
	})
	
	$('.nation_list_1 .continent_list_1 li').unbind("click").bind('click',function(){
		var index = $(this).index();
		$("#li_num_1").val(index);
		$(this).addClass('avtive_green').siblings().removeClass('avtive_green');
		$('.nation_tel_list_1 li').eq(index).show().siblings().hide();
	})
	
	$('.nation_list .nation_tel_list li a').unbind("click").bind('click',function(){
		var code = $(this).attr("value");
		$("#code_num").val(code);
		$(".choice_phone_type i").html("+"+code);
		toggleNationDiv();
	})
	
	$('.nation_list_1 .nation_tel_list_1 li a').unbind("click").bind('click',function(){
		var code = $(this).attr("value");
		$("#code_num_1").val(code);
		$(".choice_phone_type_1 i").html("+"+code);
		toggleNationDiv_1();
	})
	
	function toggleNationDiv(){
		$('div.nation_list').toggleClass('dis_show');
		if($(".nation_list").hasClass("dis_show")){
			bindWinClose("nation_list");
			var li_num = $("#li_num").val();
			$(".choice_phone_type").children('.UP_down').removeClass('choice_nation_open').addClass('choice_nation_close');
			$(".nation_list .continent_list li").eq(li_num).addClass('avtive_green').siblings().removeClass('avtive_green');
			$(".nation_list .nation_tel_list li").eq(li_num).show().siblings().hide();
		}else{
			$(".choice_phone_type").children('.UP_down').removeClass('choice_nation_close').addClass('choice_nation_open');
			unBindWinClose();
		}
	}
	
	function toggleNationDiv_1(){
		$('div.nation_list_1').toggleClass('dis_show');
		if($(".nation_list_1").hasClass("dis_show")){
			bindWinClose("nation_list_1");
			var li_num = $("#li_num_1").val();
			$(".choice_phone_type_1").children('.UP_down').removeClass('choice_nation_open').addClass('choice_nation_close');
			$(".nation_list_1 .continent_list_1 li").eq(li_num).addClass('avtive_green').siblings().removeClass('avtive_green');
			$(".nation_list_1 .nation_tel_list_1 li").eq(li_num).show().siblings().hide();
		}else{
			$(".choice_phone_type_1").children('.UP_down').removeClass('choice_nation_close').addClass('choice_nation_open');
			unBindWinClose();
		}
	}
	
	function bindWinClose(tarclass){
		var win = ($.browser.msie) ? document : window;
		$(win).unbind("mousedown").bind("mousedown",function(ev){
			ev = ev || window.event;
		    var target = ev.target || ev.srcElement;
		    if(!$(target).hasClass("choice_phone_type") && !$(target).parents().hasClass("choice_phone_type")
		    		&&!$(target).hasClass("choice_phone_type_1") && !$(target).parents().hasClass("choice_phone_type_1")
		    		&& !$(target).hasClass(tarclass) && !$(target).parents().hasClass(tarclass)){
		    	$("."+tarclass).toggleClass('dis_show');
		    	if("nation_list_1"==tarclass){
		    		$(".choice_phone_type_1").children('.UP_down').removeClass('choice_nation_close').addClass('choice_nation_open');
		    	}else{
		    		$(".choice_phone_type").children('.UP_down').removeClass('choice_nation_close').addClass('choice_nation_open');
		    	}
		    	unBindWinClose();
		    }
		});
	}
	
	function unBindWinClose(){
		var win = ($.browser.msie) ? document : window;
		$(win).unbind("mousedown");
	}
	
	var bind_input_flag=true;
	var bind_input_name = 'input';
	if (navigator.userAgent.indexOf("MSIE") != -1){
		bind_input_name = 'propertychange';
	}
	
	var code_flag = true;
	$('#loginnamein').bind(bind_input_name, function(){
		var reg = new RegExp("^[0-9]+$");  
		if(reg.test($(this).val())){
			code_flag = true;
			$('.choice_phone_type_1').show();
		}else{
			code_flag = false;
			$('.choice_phone_type_1').hide();
		}
	})
	
});

function openAndCloseNationDiv(obj,type){
	var value = $(obj).val();
	if(value != ''){
		var reg = new RegExp("^[0-9]+$");  
		if(reg.test($(obj).val())){
			if(type == 'login'){
				code_flag = true;
				$('.choice_phone_type_1').show();
			}else{
				
			}
		}else{
			if(type == 'login'){
				code_flag = false;
				$('.choice_phone_type_1').hide();
			}else{
				
			}
		}
	}
}

/*获取光标位置*/
function getCursorPos(obj)
{ 
    var CaretPos = 0; 
    // IE Support 
    if (document.selection) { 
	        obj.focus (); //获取光标位置函数 
        var Sel = document.selection.createRange (); 
        Sel.moveStart ('character', -obj.value.length);
        CaretPos = Sel.text.length; 
    } 
    // Firefox/Safari/Chrome/Opera support 
    else if (obj.selectionStart || obj.selectionStart == '0') 
        CaretPos = obj.selectionEnd; 
    return (CaretPos); 
} 
/* 
定位光标 
*/ 
function setCursorPos(obj,pos) 
{ 
	if(obj.setSelectionRange) { //Firefox/Safari/Chrome/Opera
        obj.focus(); //
        obj.setSelectionRange(pos,pos); 
    } else if (obj.createTextRange) { // IE
        var range = obj.createTextRange(); 
        range.collapse(true); 
        range.moveEnd('character', pos); 
        range.moveStart('character', pos); 
        range.select(); 
	} 
} 
 /* 
替换后定位光标在原处
*/ 
function mobileRepAndSetPos(obj,pattern,text){ 
	var pos=getCursorPos(obj);//保存原始光标位置
   	var temp=obj.value; //保存原始值 
  	if(pattern.test(temp)){
  		obj.value=temp.replace(pattern,text);//替换掉非法值 
  		//截掉超过长度限制的字串（此方法要求已设定元素的maxlength属性值）
  		var max_length = obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : "";
  		if( obj.value.length > max_length){
	        var str1 = obj.value.substring( 0,pos-1 );
	        var str2 = obj.value.substring( pos,max_length+1 );
	        obj.value = str1 + str2;
	    }
	    pos=pos-(temp.length-obj.value.length);//当前光标位置 
	    setCursorPos(obj,pos);//设置光标 
  	}
} 
