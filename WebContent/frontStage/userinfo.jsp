<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 判断用户有没有登录 --%>
<c:if test="${user==null}">
	<c:redirect url="index.jsp"></c:redirect>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<html xmlns:wb="http://open.weibo.com/wb">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title>账户管理</title>

		<link href="//staticnew.mayi.com/resourcesWeb/css/global.css?V=201508071525" rel="stylesheet" type="text/css" />
		<link href="//staticnew.mayi.com/resourcesWeb/css/PCenter.css?V=20160715" rel="stylesheet" type="text/css" />
		<link href="//staticnew.mayi.com/resourcesWeb/css/collection.css" rel="stylesheet" type="text/css">
		<link href="//staticnew.mayi.com/resourcesWeb/css/account.css?v=20160616" rel="stylesheet" type="text/css" />
		<link href="//staticnew.mayi.com/resourcesWeb/css/landlord/manage_pub.css" rel="stylesheet" type="text/css" />
		<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/public_element.css" rel="stylesheet" type="text/css">
		<link href="//staticnew.mayi.com/resourcesWeb/css/cropper.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/account/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/frontStage/js/account.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/regx/idcard.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/account/cropper.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/account/ui/jquery-ui-1.9.2.custom.min.js"></script>
		<script src="${pageContext.request.contextPath}/frontStage/js/loginpc.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function() {
				var CenterTab = $('.centerTab li')
				CenterTab.each(function(e) {
					CenterTab.eq(e).click(function() {
						$(this).addClass('active').siblings().removeClass('active');
						$('.MtList').eq(e).show().siblings().hide();
						$(".discountManageUl a").removeClass("on").eq(e).addClass("on");
					});
				});
				//添加账号切换效果
				$('.add-con ul:first').show();
				$('.add-account a').each(function(e) {
					$('.add-account a').eq(e).click(function() {
						$(this).addClass('addcurrent').siblings().removeClass('addcurrent');
						$('.add-con').children('ul').eq(e).show().siblings().hide();
						return false;
					});
				});

				$('#papertype').change(function() {
					if($(this).val() == 414) {
						$('#countryli').css('display', 'block');
						var country = $('#country').val();
						if(country == 1) {
							$('#nationli').css('display', 'block');
							//$('#locationli').css('display','block');
							$('#housetownli').css('display', 'block');
						} else {
							$('#nationli').css('display', 'none');
						}
					} else {
						$('#countryli').css('display', 'none');
						$('#nationli').css('display', 'block');
						//$('#locationli').css('display','block');
						$('#housetownli').css('display', 'block');
					}
				});

				$('#country').change(function() {
					if($(this).val() == 1 || $(this).val() == 0) {
						$('#nationli').css('display', 'block');
						//$('#locationli').css('display','block');
						$('#housetownli').css('display', 'block');
					} else {
						$('#nationli').css('display', 'none');
						//$('#locationli').css('display','none');
						$('#housetownli').css('display', 'none');
					}
				});

				$(".discountManageUl a").click(function() {
					var Index = $(this).index();
					$(this).siblings("li").removeClass("on");
					$(this).addClass("on");
					$(".centerTab li").eq(Index).click();
					//event.stopPropagation();
					//return false;
				})

				$(".settlement_way").click(function() {
					$(".discountManageUl a").eq(1).click();
				})

				$(".discountManageUl a").eq(0).addClass("on");
			});

			//图片异步上传
			function ajaxFileUpload(obj) {
				if(validateImage(obj)) {
					$.ajaxFileUpload({
						url: '/user/account/originalheadimage/upload.do', //需要链接到服务器地址  
						secureuri: false,
						fileElementId: 'imageupload', //文件选择框的id属性  
						dataType: 'json', //服务器返回的格式，可以是json  
						success: function(data, status) { //相当于java中try语句块的用法  
							if(data.error) {
								layer.alert(data.error.message, 8);
							} else {
								$("#ImageDrag").attr("src", data.data.result);
								$("#ImageIcon").attr("src", data.data.result);
								$("#picture").attr("value", data.data.result);
								img.src = data.data.result;
							}
						},
						error: function(data, status, e) {
							layer.alert("图片上传失败", 8);
						}
					});
				}
			}

			function validateImage(obj) {
				var file = obj;
				var tmpFileValue = file.value;

				//校验图片格式
				if(/^.*?\.(gif|png|jpg|jpeg|bmp)$/.test(tmpFileValue.toLowerCase())) {
					return true;
				} else {
					layer.alert("请您上传jpg、jpeg、png、bmp或gif格式的图片！", 8);
					return false;
				}

				//校验图片大小,这段代码需调整浏览器安全级别(调到底级)和添加可信站点(将服务器站点添加到可信站点中)
				//var imgSize = 1024 * 100; //最大100K
				//var img = new Image();
				if(file.value != "") {
					//    img.onreadystatechange = function(){
					//        if(img.readyState == "complete"){
					//            if(img.fileSize <=0 || img.fileSize > imgSize){
					//                alert("当前文件大小" + img.fileSize / 1024 + "KB, 超出最大限制 " + imgSize / 1024 + "KB");
					//                return false;
					//            }else{
					//                alert("OK");
					//                return true;
					//            }
					//        }
					//    }
					//return true;
				} else {
					layer.alert("请选择上传的文件!", 8);
					return false;
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
				<a href="/HuangChongProject/frontStage/index.jsp">
				<span style="text-align: left;font-size: 30px;color: #009900;font-weight: bolder;width: 80%;position: absolute;">黄虫短租</span>			
					</a>
				<ul class="nav_R asote nav_right">
					<li style="margin-left:-211px;">
						<b class="mayi_tel_top"><img src="//staticnew.mayi.com/resourcesWeb/v201510/images/commom/tel_green_icon.png"><span style="font-family: &quot;Hiragino Sans GB&quot;, Arial, Verdana, Tahoma, &quot;微软雅黑&quot; !important;font-size: 14px;" hiragino="" sans="" gb",="" arial,="" verdana,="" tahoma,="" "微软雅黑"="" !important;font-size:="" 14px;"="">客服电话：</span>400-028-6868</b>
					</li>
					<li>
						<div class="showinfo">
							<a href="javascript:void(0)" target="_self"><img src="${user!=null?user.imgUrl:' '}" id="aaa" class="user_img" />
								<span class="name" id="head_nickname"></span></a>
							<div class="head_pop">
								<div class="pop_column">
									<p>
										<a href="ordersinfo.jsp">订单管理</a>
									</p>
									<p>
										<a href="javascript:void(0)" target="_self" id="myorder" rel="nofollow" class="slideactive" _mayi_rp="webaround|userinfo|account">我的账户</a>
									</p>
									<p class="textCt">
										<a href="javascript:void(0)" id="loginoutbut" target="_self" class="stclick" clicktag="1_6">退出登录</a>
									</p>
									<!-- 退出登录 -->
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="showinfo" id="s_islandlord">
							<a href="javascript:void(0)" target="_self" class="stclick">我是房东</a>
							<div class="head_pop">
								<div class="pop_column plr10">
									<p>
										<a href="landlordOrder.jsp">订单管理</a>
									</p>
									<p>
										<a href="landlordPublish.jsp">房源管理</a>
									</p>
								</div>
							</div>
						</div>
					</li>
					<li>
					</li>
					<li>
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
		<!-- 拉新弹层 -->
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/util/jquery.qrcode.min.js"></script>
		<script>
			$(function() {
				var userid = getCookie("MAYIUID");
				var ca_s = getCookie("_channel");
				var ca_n = getCookie("_caname");
				//生成专属二维码

				//邀请好友
				var shareLink = "http://m.mayi.com/coupon/getInvitee?id=" + userid + "&channel=w_qrcode&s=wap";
				//var shareLink = "https://previewwap.mayi.com/coupon/getInvitee?id="+userid+"&channel=w_qrcode&s=wap";
				shareLink = shareLink.replace('', '').replace('true', 'false');
				var qingdaoWx = "http://m.mayi.com/wxGuide?ca_s=" + ca_s + "&ca_n=" + ca_n;
				//var qingdaoWx="http://prewap1.mayi.com/wxGuide?ca_s="+ca_s+"&ca_n="+ca_n;

				jQuery('#qrcode').qrcode({
					width: 100,
					height: 100,
					text: shareLink
				});
				//青岛啤酒节
				jQuery('.qd_qrcode').qrcode({
					width: 100,
					height: 100,
					text: qingdaoWx
				});
				jQuery('#qd_qrcode_theme').qrcode({
					width: 85,
					height: 85,
					text: qingdaoWx
				});

			})
		</script>
		<div class="share_tan" style="display: none">
			<div class="mask"></div>
			<div class="hongbao_img">
				<img src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/images/close.png" alt="" class="hong_close" />
				<img src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/images/hongbao1.png" alt="" class="hongbao" />
				<div id="qrcode" class="ewm_img"></div>
				<!-- <img src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/images/ewm.jpg" alt="" class="ewm_img"/> -->
				<p class="text_para">扫码后，通过分享活动邀请好友注册蚂蚁短租，双方均可获得100元住宿基金！</p>

			</div>
		</div>
		<input type="hidden" name="subdomain" id="subdomain" value="" />
		<input type="hidden" name="mainsite" id="mainsite" value="" />
		<input type="hidden" name="ctx" id="ctx" value="" />
		<input type="hidden" name="ctx1" id="ctx1" value="//staticnew.mayi.com" />
		<input type="hidden" name="uid" id="uid" value="870177979" />
		<input type="hidden" name="loginurl" id="loginurl" value="none" />
		<input type="hidden" name="head_userName" id="head_userName" value="${user!=null?user.nickName:' '}">
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

		</html>
		<!-- Header END -->

		<!-- Content -->
		<div class="main">
			<style type="text/css">
				.zm_complete {
					cursor: pointer;
				}
				/* .zhima_des{width:274px;padding-bottom:20px;position:absolute;right:0;top:26px;z-index:9;line-height:20px;border:1px solid #e0e0e0;box-shadow: 0 0 3px 2px #EAEAEA;display:none;background-color: #fff;}
		.zhima_green{background-color:#6ac690;color:#fff;padding:15px;box-sizing:border-box;}
		.zm_top{height:84px;} */
				
				.safedetails {
					position: fixed;
					width: 100%;
					height: 100%;
					z-index: 300000;
					display: none;
				}
				
				.surveYY {
					background: #000;
					width: 100%;
					height: 100%;
					opacity: 0.7;
					position: fixed;
					top: 0px;
					left: 0px;
				}
				
				.shenfen_info,
				.shouquan_sucess {
					left: 50%;
					margin-left: -192px;
					top: 50%;
					margin-top: -150px;
					position: fixed;
					z-index: 10000;
					background-color: #FFF;
					border-radius: 3px;
					padding-bottom: 30px;
					display: none;
				}
				
				.dp_header {
					line-height: 50px;
					border-bottom: 1px solid #dce0e0;
					text-align: center;
				}
				
				.shenfen_info,
				.shouquan_sucess {
					width: 385px;
				}
				
				.name_input,
				.shenfen_input {
					border: 1px solid #d9d9d9;
					width: 220px;
					height: 36px;
					box-sizing: border-box;
					padding: 0 10px;
					display: block;
					margin: 10px auto 5px;
				}
				
				.green_button {
					background-color: #22bb62;
					color: #fff;
					text-align: center;
					cursor: pointer;
				}
				
				.shouquan,
				.xuanfang {
					width: 140px;
					height: 36px;
					line-height: 36px;
					margin: 10px auto;
					display: block;
				}
				
				.alert_word {
					color: #ff5d51;
					margin-left: 92px;
					display: none;
				}
				
				.close_current {
					width: 16px;
					height: 16px;
					position: absolute;
					top: 5px;
					right: 7px;
					background: url(http://staticnew.mayi.com/resourcesWeb/images/xclose_btn.png) no-repeat;
					cursor: pointer;
				}
				
				#xinyong_score {
					color: #22bb62;
					font-size: 30px;
				}
				
				.c322c27 {
					color: #322c27 !important;
				}
				
				.zhima_des {
					box-sizing: border-box;
					width: 274px;
					padding: 20px;
					position: absolute;
					left: 300px;
					top: 25px;
					z-index: 9;
					line-height: 20px;
					border: 1px solid #e0e0e0;
					box-shadow: 0 0 3px 2px #EAEAEA;
					display: none;
					background-color: #fff;
				}
				
				.zhima_green {
					background-color: #6ac690;
					color: #fff;
				}
				
				.zm_bottom {
					margin-bottom: 20px;
					padding-top: 10px;
				}
				
				.zm_top {
					height: 40px;
					line-height: 40px;
					font-size: 18px;
					text-align: center;
					letter-spacing: 0;
					margin-bottom: 10px;
				}
				
				.zm_top_bg {
					background: rgba(229, 129, 41, .1);
				}
				
				.zm_top_span {
					color: #E58129;
				}
				
				.zm_top_bg1 {
					background: rgba(62, 179, 130, 0.1);
				}
				
				.zm_top_span1 {
					color: #3eb382;
				}
				
				.zm_no_why {
					display: none;
				}
				
				.zm_accredit {
					font-size: 14px;
					color: #3eb382;
					padding: 10px;
					background: rgba(62, 179, 130, 0.1);
				}
				
				.zm_no_why .all_1 {
					position: fixed;
					top: 0;
					left: 0;
					right: 0;
					bottom: 0;
					background: #000;
					opacity: 0.5;
					z-index: 20;
				}
				
				.zm_no_why .zm_no_why_info {
					position: fixed;
					top: 50%;
					left: 50%;
					margin-left: -300px;
					margin-top: -120px;
					width: 600px;
					padding: 30px;
					z-index: 22;
					color: #2b2f33;
					background: #fff;
				}
				
				.zm_no_why .info_title {
					height: 60px;
					line-height: 60px;
					font-size: 24px;
					text-align: center;
					padding-bottom: 10px;
					border-bottom: 1px solid #DCDEE0;
				}
				
				.zm_no_why .info_content {
					padding-top: 30px;
					font-size: 16px;
				}
				
				.zm_no_why .zm_btn_close {
					float: right;
					margin: -10px -10px 0 0;
					cursor: pointer;
				}
				
				.zm_no_help {
					margin-left: 10px;
					margin-top: 1px;
					cursor: pointer;
					vertical-align: top;
				}
			</style>
			<ul class="breadcrumb clearfix">
				<li>
					<a href="ls.action?op=allLandlordOrders&orderStatus=-1&userId=${user.userId }">我是房客</a> <span class="divider">》</span></li>
				<li>账户管理</li>
			</ul>

			<div class="personalCenter clearfix">
				<!-- Center-sidebar -->
				<ul class="center-sidebar">
					<li>
						<a href="ordersinfo.jsp">订单管理<span class="ddgl"></span></a>
					</li>
					<li>
						<a class="slideactive" href="javascrupt:void(0)">账户管理<span class="zhgl_current"></span></a>
					</li>
				</ul>
				<script type="text/javascript">
					/*//初始化样式展示
																$(document).ready(function(){
																	$.ajax({
																		url : "/user/getLastAuditDate.do",
																		type : 'POST',
																		async:true,
																		dataType:'json',
																		timeout: 3000,
																		success : function(data){
																			var lastAuditTime=data;
																			var cookietime = -1;
																			var arr = document.cookie.split("; ");
																			for(var i=0,len=arr.length;i<len;i++){
																				var item = arr[i].split("=");
																				if(item[0]=="MAYI_LA_TIME"){
																					cookietime=item[1];
																					break;
																				}
																			}
																			if(lastAuditTime == 0 || cookietime > lastAuditTime){
																				$(".fdshop").hide();
																				$(".fdshop").remove();
																			}else{
																				$(".fdshop").show();
																			}
																		}
																	});
																});*/
				</script>
				<!-- Center-sidebar END -->
				<div class="centerCon">
					<ul class="centerTab">
						<li class="active">个人信息</li>
						<li>密码设置</li>
					</ul>
					<div class="accountMt clearfix">
						<!-- 个人信息 -->
						<div class="MtList" style="display:block;">
							<div class="avatar-box">
								<div class="avatar" id="headimage_div">
									<img id="headimage" style="width:100px;height:100px;" src="${user!=null?user.imgUrl:' '}" alt="" />
								</div>
								<p>
									<a id="upheadimgdo" class="alertAvatar" rel="nofollow" href="javascript:void(0)">[修改头像]</a>
								</p>
							</div>
							<div class="tabCon">
								<ul class="userInfo">
									<li class="clearfix">
										<li class="clearfix userName">
											<span class="infoTitle">用 &nbsp;户&nbsp;名：</span>${user.userName}
											<input type="hidden" name="userName" id="userName" value="${user.userName}"/>
										</li>
										<li class="clearfix">
											<span class="infoTitle">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
											<input class="personLargeInput" type="text" name="nickname" placeholder="4-20个字符（汉字、字母、数字、下划线）" id="nickname" value="${user.nickName}" style="width:276px;" />
										</li>
										<li class="clearfix">
											<span class="infoTitle">手机号码：</span>${user.telNum}
										</li>
										<li class="clearfix">
											
										</li>
										<li class="clearfix">
											
										</li>
									</li>
								</ul>
								<div class="submit-wrap">
									<a id="tjbc" class="save-btn" rel="nofollow" href="javascript:void(0)">提交保存</a>
								</div>
								<script type="text/javascript">
								</script>
							</div>
						</div>
						<!-- 个人信息 END -->

						<div class="MtList" style="display: none;">
							<ul class="userInfo">
								<li class="clearfix"><span class="infoTitle">登录账号：</span> ${user.userName}</li>
								<li class="clearfix">
									<span class="infoTitle">新密码：</span>
									<input type="password" value="" name="newpass" id="newpass" class="personLargeInput">
									<span class="prompt" id="newpassspan" name="newpassspan">6-16个字符</span>
								</li>
								<li class="clearfix">
									<span class="infoTitle">确认密码：</span>
									<input type="password" value="" name="repass" id="repass" class="personLargeInput">
									<span class="prompt" id="repassspan" name="repassspan">重复输入一次密码</span>
								</li>
							</ul>
							<div class="submit-wrap">
								<a class="save-btn" id="savepassbtn" name="savepassbtn" rel="nofollow" href="javascript:void(0)">保存</a>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- Content END -->

		<!-- Footer -->
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/login.js"></script>

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
		<!--[statistics start]-->
		<!-- Footer login-->
		<!-- 登录弹窗 -->
		<div class="loginbox" id="loginboxdiv" nexturl="none" name="loginboxdiv" style="display:none;">
			<a class="login-colse" id="loginclose" name="loginclose" onClick="" href="javascript:void(0)"></a>
			<div class="login-ways clearfloat">
				<div class="fl phone-account">
					<ul class="c322c27 clearfloat f18">
						<li class="phoneway_current" id="changeloginbyma">手机验证码登录</li>
						<li class="mayiway" id="changeloginbyup">帐号密码登录</li>
					</ul>
					<div class="login-phone-account">
						<!-- 手机登陆 -->
						<div class="login-input" id="loginbymadiv" name="loginbymadiv">
							<input type="hidden" id="li_num" value="0">
							<input type="hidden" id="code_num" value="86">
							<div class="input">
								<span class="phone-icon"></span>
								<input class="dlargeinput" type="text" id="loginmobile" name="loginmobile" placeholder="手机号" value="" id="introduce" onafterpaste="mobileRepAndSetPos(this,/[^\d.]/g,'')" onkeyup="mobileRepAndSetPos(this,/[^\d.]/g,'')" maxlength="11" />
								<div class="choice_phone_type">
									<i code="86">+86</i>
									<span class="UP_down choice_nation_open"></span>
								</div>
							</div>
							<div class="nation_list">
								<ul class="continent_list">
									<li class="">亚洲</li>
									<li class="">欧洲</li>
									<li class="">美洲</li>
									<li class="">大洋洲</li>
								</ul>
								<ul class="nation_tel_list">
									<!-- countrycode window-->
									<li style="display: block;">
										<a href="javascript:void(0);" value="86">中国大陆&nbsp;&nbsp;+86</a>
										<a href="javascript:void(0);" value="82">韩国&nbsp;&nbsp;+82</a>
										<a href="javascript:void(0);" value="60">马来西亚&nbsp;&nbsp;+60</a>
										<a href="javascript:void(0);" value="81">日本&nbsp;&nbsp;+81</a>
										<a href="javascript:void(0);" value="66">泰国&nbsp;&nbsp;+66</a>
										<a href="javascript:void(0);" value="65">新加坡&nbsp;&nbsp;+65</a>
										<a href="javascript:void(0);" value="91">印度&nbsp;&nbsp;+91</a>
										<a href="javascript:void(0);" value="62">印度尼西亚&nbsp;&nbsp;+62</a>
										<a href="javascript:void(0);" value="84">越南&nbsp;&nbsp;+84</a>
										<a href="javascript:void(0);" value="853">中国澳门&nbsp;&nbsp;+853</a>
										<a href="javascript:void(0);" value="852">中国香港&nbsp;&nbsp;+852</a>
										<a href="javascript:void(0);" value="886">中国台湾&nbsp;&nbsp;+886</a>
									</li>
									<li style="display: none;">
										<a href="javascript:void(0);" value="49">德国&nbsp;&nbsp;+49</a>
										<a href="javascript:void(0);" value="7">俄罗斯&nbsp;&nbsp;+7</a>
										<a href="javascript:void(0);" value="33">法国&nbsp;&nbsp;+33</a>
										<a href="javascript:void(0);" value="380">乌克兰&nbsp;&nbsp;+380</a>
										<a href="javascript:void(0);" value="34">西班牙&nbsp;&nbsp;+34</a>
										<a href="javascript:void(0);" value="39">意大利&nbsp;&nbsp;+39</a>
										<a href="javascript:void(0);" value="44">英国&nbsp;&nbsp;+44</a>
									</li>
									<li style="display: none;">
										<a href="javascript:void(0);" value="55">巴西&nbsp;&nbsp;+55</a>
										<a href="javascript:void(0);" value="1">加拿大&nbsp;&nbsp;+1</a>
										<a href="javascript:void(0);" value="1">美国&nbsp;&nbsp;+1</a>
									</li>
									<li style="display: none;">
										<a href="javascript:void(0);" value="61">澳大利亚&nbsp;&nbsp;+61</a>
										<a href="javascript:void(0);" value="64">新西兰&nbsp;&nbsp;+64</a>
									</li>
								</ul>
							</div>
							<div class="largeinputbox small-top clearfix">
								<div class="dinput fl">
									<span class="verification-icon"></span>
									<input class="dsmallinput" type="text" id="imagecode" placeholder="图形验证码" value="" />
								</div>
								<div class="yz-code fr">
									<img src="" id="loginauthimage" title="点击刷新" />
								</div>
							</div>
							<div class="largeinputbox small-top clearfix" id="maerrordiv">
								<div class="dinput fl" id="maerrordiv">
									<span class="password-icon"></span>
									<input class="dsmallinput" type="text" id="loginphonecode" name="loginphonecode" placeholder="短信验证码" value="" />
								</div>
								<div class="yz-code fr">
									<input class="sendnumber defaultsend" type="button" id="getloginphonecode" name="getloginphonecode" value="获取验证码" />
								</div>
							</div>
							<div class="logincheckbox large-top clearfix">
								<label class="fl">
	                        <input class="selectcheckbox" type="checkbox" name="rememberloginstate" checked="checked" value=""/>自动登录
	                    </label>
							</div>
							<div class="logincheckbox large-top clearfix">
								<font>未注册的手机号将自动创建为蚂蚁短租帐户</font>
							</div>
							<div class="btn-wrap btnpdt20">
								<a href="javascript:void(0)" id="loginbymado">登录</a>
							</div>
						</div>
						<!-- 手机登陆 end  -->
						<!-- 密码登陆 start -->
						<div class="login-input" id="loginbyupdiv" name="loginbyupdiv" style="display:none;">
							<input type="hidden" id="li_num_1" value="0">
							<input type="hidden" id="code_num_1" value="86">
							<div class="input">
								<span class="user-icon"></span>
								<input class="dlargeinput" type="text" id="loginnamein" name="loginnamein" placeholder="手机号/邮箱/账号" value="" autocomplete="off" />
								<div class="choice_phone_type_1">
									<i tag="CN" code="86">+86</i>
									<span class="UP_down choice_nation_open"></span>
								</div>
							</div>
							<div class="nation_list_1">
								<ul class="continent_list_1">
									<li class="">亚洲</li>
									<li class="">欧洲</li>
									<li class="">美洲</li>
									<li class="">大洋洲</li>
								</ul>
								<ul class="nation_tel_list_1">
									<!-- countrycode window-->
									<li style="display: block;">
										<a href="javascript:void(0);" value="86">中国大陆&nbsp;&nbsp;+86</a>
										<a href="javascript:void(0);" value="82">韩国&nbsp;&nbsp;+82</a>
										<a href="javascript:void(0);" value="60">马来西亚&nbsp;&nbsp;+60</a>
										<a href="javascript:void(0);" value="81">日本&nbsp;&nbsp;+81</a>
										<a href="javascript:void(0);" value="66">泰国&nbsp;&nbsp;+66</a>
										<a href="javascript:void(0);" value="65">新加坡&nbsp;&nbsp;+65</a>
										<a href="javascript:void(0);" value="91">印度&nbsp;&nbsp;+91</a>
										<a href="javascript:void(0);" value="62">印度尼西亚&nbsp;&nbsp;+62</a>
										<a href="javascript:void(0);" value="84">越南&nbsp;&nbsp;+84</a>
										<a href="javascript:void(0);" value="853">中国澳门&nbsp;&nbsp;+853</a>
										<a href="javascript:void(0);" value="852">中国香港&nbsp;&nbsp;+852</a>
										<a href="javascript:void(0);" value="886">中国台湾&nbsp;&nbsp;+886</a>
									</li>
									<li style="display: none;">
										<a href="javascript:void(0);" value="49">德国&nbsp;&nbsp;+49</a>
										<a href="javascript:void(0);" value="7">俄罗斯&nbsp;&nbsp;+7</a>
										<a href="javascript:void(0);" value="33">法国&nbsp;&nbsp;+33</a>
										<a href="javascript:void(0);" value="380">乌克兰&nbsp;&nbsp;+380</a>
										<a href="javascript:void(0);" value="34">西班牙&nbsp;&nbsp;+34</a>
										<a href="javascript:void(0);" value="39">意大利&nbsp;&nbsp;+39</a>
										<a href="javascript:void(0);" value="44">英国&nbsp;&nbsp;+44</a>
									</li>
									<li style="display: none;">
										<a href="javascript:void(0);" value="55">巴西&nbsp;&nbsp;+55</a>
										<a href="javascript:void(0);" value="1">加拿大&nbsp;&nbsp;+1</a>
										<a href="javascript:void(0);" value="1">美国&nbsp;&nbsp;+1</a>
									</li>
									<li style="display: none;">
										<a href="javascript:void(0);" value="61">澳大利亚&nbsp;&nbsp;+61</a>
										<a href="javascript:void(0);" value="64">新西兰&nbsp;&nbsp;+64</a>
									</li>
								</ul>
							</div>
							<div class="input small-top">
								<span class="password-icon"></span>
								<input class="dlargeinput" type="password" id="loginpassin" name="loginpassin" placeholder="密码" value="" />
							</div>
							<div class="largeinputbox small-top clearfix" id="uperrordiv">
								<div class="dinput fl" id="yui_3_5_1_1_1434542056373_108">
									<span class="verification-icon"></span>
									<input type="text" class="dsmallinput" id="imagecode1" placeholder="图形验证码" value="">
								</div>
								<div class="yz-code fr">
									<img src="" id="loginauthimage1" title="点击刷新">
								</div>
							</div>
							<div class="logincheckbox large-top clearfix">
								<label class="fl">
	                        <input class="selectcheckbox" type="checkbox" name="rememberpass" checked="checked" value=""/>自动登录
	                    </label>
							</div>
							<div class="btn-wrap btnpdt20">
								<a href="javascript:void(0)" id="loginbyupdo" _mayi_rp="web|condition|loginc">登录</a>
							</div>
							<p class="otherwaytitle mt20">没有账号密码请
								<a href="javascript:void(0)" id="changeloginbymwa">使用手机验证码登录</a>
							</p>
						</div>
						<!-- 密码登陆 end -->
					</div>
				</div>
				<div class="fl t-center third-party">
					<p class="f18 c322c27 mb20">其他登录方式</p>
					<ul class="otherway c322c27">
						<li class="wxway" id="loginbywx" _mayi_rp="web|condition|loginc">微信登录</li>
						<li class="sinaway" id="loginbysina" _mayi_rp="web|condition|loginc">微博登录</li>
						<li class="qqway" id="loginbyqq" _mayi_rp="web|condition|loginc">QQ登录</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 登录弹窗 END -->
		<!--公共尾部结束-->
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/loginpc.js"></script>

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
			
			#webIM ul.tab-im .offline-icon,
			#webIM ul.tab-im .online-icon {
				background-position: 0 !important
			}
			
			#webIM .all-list a.on,
			#webIM .all-list a.off {
				background-position: -239px -297px !important;
				color: #2883C3 !important
			}
			
			#webIM ul.tab-im a {
				color: #2883C3 !important
			}
		</style>
		<script src="//tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
		<!-- load statistics js -->
		<!--[statistics start]-->
		<!-- load End-->
		<!-- account window-->
		<!-- 添加账号 弹窗 START -->
		<div class="alert-box" id="savepaymentdiv" name="savepaymentdiv" style="display:none;">
			<input type="hidden" name="paymentidhi" id="paymentidhi" value="0" />
			<input type="hidden" name="bankidhi" id="bankidhi" value="0" />
			<input type="hidden" name="bankprovinceidhi" id="bankprovinceidhi" value="0" />
			<input type="hidden" name="bankcityidhi" id="bankcityidhi" value="0" />
			<input type="hidden" name="bankbranchidhi" id="bankbranchidhi" value="0" />
			<input type="hidden" name="bankbranchidhitext" id="bankbranchidhitext" value="0" />
			<div class="alert-title">
				添加账号
				<a class="alert-close" id="savepaymentlayerclose" name="savepaymentlayerclose" onclick="" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<div class="add-account">
					<a href="javascript:void(0)" id="showalipayui" name="showalipayui" class="addcurrent">支付宝</a>
					<!--<a href="javascript:void(0)" id="showtenpayui" name="showtenpayui">财付通</a>-->
					<a href="javascript:void(0)" id="showbankcardui" name="showbankcardui">银行卡</a>
				</div>
				<div class="add-con">
					<ul class="alipay">
						<li id="aliaccountnoli">* 支付宝账号：<input class="add-input" type="text" name="aliaccountno" id="aliaccountno" value="" />
							<!--<span class="tooltip">请输入正确的银行卡号</span>-->
						</li>
						<li id="aliaccountnameli">* 支付宝姓名：<input class="add-input" type="text" name="aliaccountname" id="aliaccountname" value="" /></li>
					</ul>
					<!--<ul class="tenpay">
				<li id="tenaccountnoli">* 财付通账号：<input class="add-input" type="text" name="tenaccountno" id="tenaccountno" value=""/></li>
				<li id="tenaccountnameli">* 财付通姓名：<input class="add-input" type="text" name="tenaccountname" id="tenaccountname"  value=""/></li>
			</ul>-->
					<ul class="bankcard">
						<li id="bankli">* 开户银行名称：
							<select class="add-select" id="bankselect">
								<option value="0">请选择开户银行</option>
							</select>
							<!--<span class="tooltip ltleft">请选择开户银行</span>-->
						</li>
						<li id="bankprovinceli">* 开户银行省份：
							<select class="add-select" id="bankprovinceselect">
								<option value="0">请选择</option>
							</select>
						</li>
						<li id="bankcityli">* 开户银行城市：
							<select class="add-select" id="bankcityselect">
								<option value="0">请选择</option>
							</select>
						</li>
						<li id="bankbranchli">* 开户支行名称：
							<span id="selectDiv" style="display:inline-block;width:175px;overflow:hidden;">
						<select class="add-select" id="bankbranchselect" onmouseover="fixWidth()" onblur="setWidth()">
						</select>
					</span>
						</li>
						<li id="bankbranchtextli" style="display:none">* 开户支行名称：<input class="add-input" type="text" name="bankbranchtext" id="bankbranchtext" />
							<li id="bankaccountli">* 开户银行账号：<input class="add-input" type="text" name="bankaccountid" id="bankaccountid" value="" />
							</li>
							<li id="rebankaccountli">* 再次确认账号：<input class="add-input" type="text" name="rebankaccountid" id="rebankaccountid" value="" oncontextmenu="window.event.returnValue=false" onpaste="return false" /></li>
							<li>* 账号公私类型：
								<select class="add-select" id="pubpriselect">
									<option selected="selected" value="2">对私账号</option>
									<option value="1">对公账号</option>
								</select>
							</li>
							<li id="bankaccountnameli">* 银行开户姓名：<input class="add-input" type="text" name="bankaccountname" id="bankaccountname" value="" /></li>
					</ul>
				</div>
				<div class="btn-box">
					<input class="checking-btn mid-btn" type="button" paytype="alipay" name="savepaymentbtn" id="savepaymentbtn" value="保存账号" />
				</div>
			</div>
		</div>
		<!-- 添加账号 弹窗 END -->
		<!-- 手机验证 弹窗 START   -->
		<div class="alert-box" id="MphoneVerification" name="MphoneVerification" style="display:none;">
			<div class="alert-title">
				修改默认收款账户
			</div>
			<a class="alert-close" id="MphoneVerificationlayerclose" name="savepaymentlayerclose" rel="nofollow" onclick="" href="javascript:void(0)"></a>
			<div class="MphoneV">
				<p class="t-center lineht45">为保障您的账户安全，请先进行手机验证</p>
				<p class="for_disable"></p>
				<ul>
					<li>
						<span class="imgVertifyAnswer span1">
                	<input type="text" class="checkPic" id="checkPic" placeholder="图形验证码" value="" maxlength="4">
                    <i class=""></i>
                </span>
						<img id="imgCode" class="span2" />
					</li>
					<li>
						<span class="massengeVertifyAnswer span1">
                	<input type="text" class="checkMassenge"  placeholder="短信验证码" name="checkCode" id="checkCode" maxlength="6" readonly="readonly">
                    <i class=""></i>
                </span>
						<input type="button" class="checkcode span2" value="获取验证码" id="btnSendCode">

					</li>
				</ul>
				<div class="vertifyAlert"></div>
				<div class="action_two">
					<input type="button" value="取消" class="complete_cancel">
					<input type="button" value="确定" class="complete_success fr" id="complete_success">
				</div>
			</div>
		</div>
		<!-- 手机验证 弹窗 END -->
		<!-- 删除确认弹窗 START   -->
		<div class="alert-box" id="delpaymentdiv" name="delpaymentdiv" style="display:none;">
			<div class="MphoneV">
				<p class="t-center lineht45 pb50 mt50">确定要删除此收款账户吗？</p>
				<div class="action_two">
					<input type="button" value="取消" class="complete_cancel">
					<input type="button" value="确定" class="complete_success fr">
				</div>
			</div>
		</div>
		<!-- mobile window-->
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/common/mobileWindow.js"></script>
		<!-- 手机账号 弹窗 Start -->
		<input id="mob_code" name="mob_code" type="hidden" value="86" />
		<!-- 原无手机，文本框填入新手机验证 弹窗 -->
		<div id="newmobilevaliddiv" class="alert-box" style="display: none;">
			<div class="alert-title">
				手机验证
				<a id="newmobilevaliddivclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<ul class="alert-list">
					<li>
						<label class="alert-label alert-labellarge">
					请输入手机号：
				</label>
						<input class="alert-input" type="text" name="txtnewmobile" id="textnewmobile" value="" />
						<div class="alert-code">
							<i code="86">+86</i>
							<span class="alert-code_open"></span>
						</div>
						<button class="alert-btn" id="txtnewgetcode">获取验证码</button>
					</li>
					<li>
						<label class="alert-label alert-labellarge">
					请输入验证码：
				</label>
						<input class="alert-input alert-w176" type="text" name="imageCodeText" id="imageCodeText" value="" style="width:20%" />
						<!-- <img src="/common/authimage?random=2312&width=80&height=38" style="width:20%" id="imageCode" onclick="changeImageCode();"> -->
					</li>
					<li>
						<label class="alert-label alert-labellarge">
					请输入验证码：
				</label>
						<input class="alert-input alert-w176" type="text" name="txtnewcode" id="txtnewcode" value="" />
					</li>
				</ul>
				<div class="alert-nation_list l277 t100">
					<ul class="alert-zhou_list">
						<li class="">亚洲</li>
						<li class="">欧洲</li>
						<li class="">美洲</li>
						<li class="">大洋洲</li>
					</ul>
					<ul class="alert-code_list">
						<!-- countrycode window-->
						<li style="display: block;">
							<a href="javascript:void(0);" value="86">中国大陆&nbsp;&nbsp;+86</a>
							<a href="javascript:void(0);" value="82">韩国&nbsp;&nbsp;+82</a>
							<a href="javascript:void(0);" value="60">马来西亚&nbsp;&nbsp;+60</a>
							<a href="javascript:void(0);" value="81">日本&nbsp;&nbsp;+81</a>
							<a href="javascript:void(0);" value="66">泰国&nbsp;&nbsp;+66</a>
							<a href="javascript:void(0);" value="65">新加坡&nbsp;&nbsp;+65</a>
							<a href="javascript:void(0);" value="91">印度&nbsp;&nbsp;+91</a>
							<a href="javascript:void(0);" value="62">印度尼西亚&nbsp;&nbsp;+62</a>
							<a href="javascript:void(0);" value="84">越南&nbsp;&nbsp;+84</a>
							<a href="javascript:void(0);" value="853">中国澳门&nbsp;&nbsp;+853</a>
							<a href="javascript:void(0);" value="852">中国香港&nbsp;&nbsp;+852</a>
							<a href="javascript:void(0);" value="886">中国台湾&nbsp;&nbsp;+886</a>
						</li>
						<li style="display: none;">
							<a href="javascript:void(0);" value="49">德国&nbsp;&nbsp;+49</a>
							<a href="javascript:void(0);" value="7">俄罗斯&nbsp;&nbsp;+7</a>
							<a href="javascript:void(0);" value="33">法国&nbsp;&nbsp;+33</a>
							<a href="javascript:void(0);" value="380">乌克兰&nbsp;&nbsp;+380</a>
							<a href="javascript:void(0);" value="34">西班牙&nbsp;&nbsp;+34</a>
							<a href="javascript:void(0);" value="39">意大利&nbsp;&nbsp;+39</a>
							<a href="javascript:void(0);" value="44">英国&nbsp;&nbsp;+44</a>
						</li>
						<li style="display: none;">
							<a href="javascript:void(0);" value="55">巴西&nbsp;&nbsp;+55</a>
							<a href="javascript:void(0);" value="1">加拿大&nbsp;&nbsp;+1</a>
							<a href="javascript:void(0);" value="1">美国&nbsp;&nbsp;+1</a>
						</li>
						<li style="display: none;">
							<a href="javascript:void(0);" value="61">澳大利亚&nbsp;&nbsp;+61</a>
							<a href="javascript:void(0);" value="64">新西兰&nbsp;&nbsp;+64</a>
						</li>
					</ul>
				</div>
				<div class="btn-box">
					<input class="checking-btn mid-btn" type="button" name="bandtxtnewmobile" id="bandtxtnewmobile" value="马上验证" />
				</div>
			</div>
		</div>

		<!-- 原有手机号 验证（修改手机号码 原手机号码验证） -->
		<div id="inputmobilevaliddiv" class="alert-box" style="display: none;">
			<div class="alert-title">
				手机验证
				<a id="inputmobilevaliddivclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<ul class="alert-list">
					<li>
						<label class="alert-label alert-labellarge">
					手机号码：
				</label>
						<span name="inputcode" id="inputcode"></span>
						<span class="imporant" id="inputmobile"></span>
					</li>
					<li>
						<label class="alert-label alert-labellarge">
					请输入验证码：
				</label>
						<input class="alert-input" type="text" name="inauthcode" id="inauthcode" value="" />
						<button class="alert-btn" id="inmgetmobilecode">获取验证码</button>
						<!-- alertactive-btn-->
						<!-- 重新获取 -->
					</li>
				</ul>
				<div class="btn-box">
					<input class="checking-btn mid-btn" type="button" id="dovalidinmobile" name="dovalidinmobile" value="马上验证" />
				</div>
			</div>
		</div>

		<!-- 输入新手机号码 弹窗 （修改手机号码 原手机号码已验证，新号码获取验证码） -->
		<div id="setnewmobilediv" class="alert-box" style="display: none;">
			<div class="alert-title">
				手机验证
				<a id="setnewmobiledivclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<ul class="alert-list paddingleft">
					<li>
						<span class="rigth"></span>
						<span class="imporant">原手机号已验证，请输入新手机号码</span>
					</li>
					<li>
						<label class="alert-label alert-labelmid">
					新手机号码：
				</label>
						<input class="alert-input" type="text" name="newmobile" id="newmobile" value="" />
						<div class="alert-code">
							<i code="86">+86</i>
							<span class="alert-code_open"></span>
						</div>
					</li>
				</ul>
				<div class="alert-nation_list l242 t148">
					<ul class="alert-zhou_list">
						<li class="">亚洲</li>
						<li class="">欧洲</li>
						<li class="">美洲</li>
						<li class="">大洋洲</li>
					</ul>
					<ul class="alert-code_list">
						<!-- countrycode window-->
						<li style="display: block;">
							<a href="javascript:void(0);" value="86">中国大陆&nbsp;&nbsp;+86</a>
							<a href="javascript:void(0);" value="82">韩国&nbsp;&nbsp;+82</a>
							<a href="javascript:void(0);" value="60">马来西亚&nbsp;&nbsp;+60</a>
							<a href="javascript:void(0);" value="81">日本&nbsp;&nbsp;+81</a>
							<a href="javascript:void(0);" value="66">泰国&nbsp;&nbsp;+66</a>
							<a href="javascript:void(0);" value="65">新加坡&nbsp;&nbsp;+65</a>
							<a href="javascript:void(0);" value="91">印度&nbsp;&nbsp;+91</a>
							<a href="javascript:void(0);" value="62">印度尼西亚&nbsp;&nbsp;+62</a>
							<a href="javascript:void(0);" value="84">越南&nbsp;&nbsp;+84</a>
							<a href="javascript:void(0);" value="853">中国澳门&nbsp;&nbsp;+853</a>
							<a href="javascript:void(0);" value="852">中国香港&nbsp;&nbsp;+852</a>
							<a href="javascript:void(0);" value="886">中国台湾&nbsp;&nbsp;+886</a>
						</li>
						<li style="display: none;">
							<a href="javascript:void(0);" value="49">德国&nbsp;&nbsp;+49</a>
							<a href="javascript:void(0);" value="7">俄罗斯&nbsp;&nbsp;+7</a>
							<a href="javascript:void(0);" value="33">法国&nbsp;&nbsp;+33</a>
							<a href="javascript:void(0);" value="380">乌克兰&nbsp;&nbsp;+380</a>
							<a href="javascript:void(0);" value="34">西班牙&nbsp;&nbsp;+34</a>
							<a href="javascript:void(0);" value="39">意大利&nbsp;&nbsp;+39</a>
							<a href="javascript:void(0);" value="44">英国&nbsp;&nbsp;+44</a>
						</li>
						<li style="display: none;">
							<a href="javascript:void(0);" value="55">巴西&nbsp;&nbsp;+55</a>
							<a href="javascript:void(0);" value="1">加拿大&nbsp;&nbsp;+1</a>
							<a href="javascript:void(0);" value="1">美国&nbsp;&nbsp;+1</a>
						</li>
						<li style="display: none;">
							<a href="javascript:void(0);" value="61">澳大利亚&nbsp;&nbsp;+61</a>
							<a href="javascript:void(0);" value="64">新西兰&nbsp;&nbsp;+64</a>
						</li>
					</ul>
				</div>
				<div class="btn-box">
					<input class="checking-btn mid-btn" type="button" id="getnewmobilecode" name="getnewmobilecode" value="获取验证码" />
				</div>
			</div>
		</div>

		<!-- 新手机号 验证  （修改手机号码 原手机号码已验证，新号码验证）-->
		<div id="onewmobilevaliddiv" class="alert-box" style="display: none;">
			<div class="alert-title">
				手机验证
				<a id="onewmobilevaliddivclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<ul class="alert-list">
					<li>
						<label class="alert-label alert-labellarge">
					手机号码：
				</label>
						<span name="newmobilecode" id="newmobilecode"></span>
						<span class="imporant" id="newmobilesp"></span>
					</li>
					<li>
						<label class="alert-label alert-labellarge">
					请输入验证码：
				</label>
						<input class="alert-input" type="text" name="newmobileauthcode" id="newmobileauthcode" value="" />
						<button class="alert-btn" id="newmgetmobilecode" name="newmgetmobilecode">获取验证码</button>
						<!-- alertactive-btn-->
						<!-- 重新获取 -->
					</li>
				</ul>
				<div class="btn-box">
					<input class="checking-btn mid-btn" type="button" id="dovalidnewmobile" name="dovalidnewmobile" value="验证" />
				</div>
			</div>
		</div>

		<!-- 手机验证成功 -->
		<div id="validmobilesucdiv" class="alert-box" style="display: none;">
			<div class="alert-title">
				手机验证
				<a id="validmobilesucdivclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<dl class="proving">
					<dt class="succeed"></dt>
					<dd>恭喜验证成功！</dd>
				</dl>
				<div class="btn-box">
					<input class="checking-btn large-btn" type="button" name="" value="关闭" />
				</div>
			</div>
		</div>

		<!-- 手机验证失败 -->
		<div id="validmobilefail" class="alert-box" style="display: none;">
			<div class="alert-title">
				手机验证
				<a id="validmobilefailclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<dl class="proving">
					<dt class="fail"></dt>
					<dd class="fail">验证失败！</dd>
				</dl>
				<div class="btn-box">
					<input class="checking-btn large-btn" type="button" name="" value="关闭" />
				</div>
			</div>
		</div>
		<!-- 手机验证 END -->
		<!-- 备用手机删除提示START -->
		<div id="delothermobilesucdiv" class="alert-box" style="display: none;width:370px;">
			<div class="alert-title">
				提示
				<a id="delothermobilesucdivclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<dl class="proving" style="padding-left:110px;">
					<p>确定删除备用手机号吗？</p>
				</dl>
				<div class="btn-box" style="padding-bottom:30px;">
					<input class="checking-btn large-btn" style="float:left;margin-left:65px;width:90px;" type="button" name="delothermobileconfirm" id="delothermobileconfirm" value="确定" />
					<input class="checking-btn large-btn" style="width:90px;color:#999;border:1px solid #999;background:#f5f5f5;" type="button" name="delothermobilecancel" id="delothermobilecancel" value="取消" />
				</div>
			</div>
		</div>
		<!--备用手机删除提示 END-->
		<!-- 邮箱验证前进行权限验证 -->
		<div id="permissionemaildiv" class="alert-box" style="display: none;">
			<div class="alert-title">
				邮箱修改权限验证
				<a id="permissionemaildivclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<ul class="alert-list">
					<li id="emobilevalidli" class="clearfix">
						<label class="alert-label alert-labellarge">
						<input class="alert-radio" type="radio" name="evalidtype" id="emobilevalidin" value="mobilevalid" checked="checked" />手机验证码：
					</label>
						<input class="alert-input" style="width:160px;" type="text" id="emoblecode" name="emobilecode" value="" />
						<button class="alert-btn" id="egetmobilecode">获取验证码</button>
						<!--<button class="alert-btn alertactive-btn"> -->
					</li>
					<li id="epassvalidli" class="clearfix">
						<label class="alert-label alert-labellarge">
						<input class="alert-radio" type="radio" name="evalidtype" id="epassvalidin" value="passvalid"/> 账 户 密 码：
					</label>
						<input class="alert-input" style="width:160px;" type="password" id="epass" name="epass" value="" />
					</li>
				</ul>
				<div class="btn-box">
					<input class="checking-btn mid-btn" type="button" id="edovalid" name="edovalid" value="马上验证" />
				</div>
			</div>
			<div class="alert-notice">
				<p>1.认证后不可取消认证，可更改邮箱重新认证。</p>
				<p>2.新邮箱修改并通过认证后，可用于登录，旧邮箱不能继续使用。</p>
			</div>
		</div>

		<!--填写需验证的目标邮箱 -->
		<div id="toemaildiv" class="alert-box" style="display: none;">
			<div class="alert-title">
				验证邮箱
				<a id="toemaildivclose" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<div class="goalmail">
					<label class="alert-label alert-labelmid">目标邮箱：</label>
					<input class="alert-input" style="width:200px;" type="text" name="toemail" id="toemail" value="" />
				</div>
				<div class="btn-box">
					<input class="checking-btn mid-btn" type="button" name="sendemail" id="sendemail" value="发送认证邮件" />
				</div>
			</div>
			<div class="alert-notice">
				<p>1.认证后不可取消认证，可更改邮箱重新认证。</p>
				<p>2.新邮箱修改并通过认证后，可用于登录，旧邮箱不能继续使用。</p>
			</div>
		</div>

		<!-- 查看目标邮箱 -->
		<div id="viewemaildiv" class="alert-box" style="display: none;">
			<div class="alert-title">
				验证邮箱
				<a id="viewemaildivclose" class="alert-close" rel="nofollow" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<div class="goalmail">
					请登录到您的邮箱
					<a id="gomaila" class="gomail" href="javascript:void(0)" target="_blank"></a> 查收认证邮件
				</div>
				<div class="btn-box">
					<input class="checking-btn mid-btn" type="button" id="gomailb" name="gomailb" url="" value="现在去认证" />
				</div>
			</div>
			<div class="alert-notice">
				<p>1.认证后不可取消认证，可更改邮箱重新认证。</p>
				<p>2.新邮箱修改并通过认证后，可用于登录，旧邮箱不能继续使用。</p>
			</div>
		</div>

		<!-- 邮箱认证成功提示 -->
		<div id="validemailsucdiv" class="alert-box" style="display: none;">
			<div class="alert-title">
				验证邮箱
				<a id="validemailsucdivclose" rel="nofollow" class="alert-close" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<dl class="proving">
					<dt class="succeed"></dt>
					<dd>恭喜邮箱认证成功！</dd>
				</dl>
				<div class="btn-box">
					<input class="checking-btn large-btn" type="button" name="" value="返回会员中心首页" />
				</div>
			</div>
			<div class="alert-notice">
				<p>1.认证后不可取消认证，可更改邮箱重新认证。</p>
				<p>2.新邮箱修改并通过认证后，可用于登录，旧邮箱不能继续使用。</p>
			</div>
		</div>
		<!-- 邮箱验证 END -->

		<!-- 减免券详情弹窗 -->
		<div class="alert-box" id="prodetaildiv" name="prodetaildiv" style="display:none;">
			<div class="alert-title">
				<span class="couponalert" id="serialnosp">序列号：<!--125454545465--></span>
				<span class="couponalert" id="parsp">面值：<!--满100减100--></span>
				<a class="alert-close" id="prodetaildivclose" name="prodetaildivclose" href="javascript:void(0)"></a>
			</div>
			<div class="alert-con">
				<table class="coupontable" id="promdetailtable">
					<tbody>
						<tr>
							<th>使用时间</th>
							<th>使用订单</th>
							<th>使用金额</th>
						</tr>
					</tbody>
				</table>
				<div class="btn-box">
					<input class="checking-btn large-btn" type="button" id="prodetaildivbtn" name="prodetaildivbtn" value="确定" />
				</div>
			</div>
		</div>
		<!-- 优惠券弹窗 END-->
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/js.js"></script>
		<!--芝麻提交身份认证-->
		<div class="safedetails">
			<div class="surveYY"></div>
			<div class="offmax shenfen_info">
				<div class="close_current"></div>
				<div class="dp_header">提交身份信息</div>
				<div class="dp_daypicker mt20 mb20">
					<form class="refuse_info_input lineheight clearfloat">
						<input type="text" placeholder="姓名" class="name_input clearfloat" maxlength="20" />
						<span class="alert_word"></span>
						<input type="text" placeholder="身份证号" class="shenfen_input clearfloat" />
						<span class="alert_word"></span>
					</form>
				</div>
				<a class="green_button shouquan" href="javascript:void(0);" target="_blank" id="id_test">立即授权</a>
			</div>
		</div>

		<!-- 修改默认结算方式弹框 -->
		<div class="alert-box" id="showSetdefaultWaydiv" name="showSetdefaultWaydiv" style="display:none;">
			<div class="MphoneV">
				<p class="t-center lineht45 pb50 mt50 f16 c322c27">确定要将默认结算方式设置为按<span class="c22bb62">订单结算</span>吗？</p>
				<div class="action_two">
					<input type="button" value="取消" class="complete_cancel">
					<input type="button" value="确定" class="complete_success fr">
				</div>
			</div>
		</div>
		<!-- 编辑头像弹框 -->
		<div class="cropper-box" id="headimagediv" style="display: none">
			<h4 class="clearfloat d-h4">
			自定义头像
		</h4>
			<div class="cropper_inner clearfloat">
				<div class="imgcropper_left" id="showimg">
					<h5>
					头像裁切：
				</h5>
					<div style="width:360px;height:360px;overflow: hidden;">
						<img id="image" src="//staticnew.mayi.com/resourcesWeb/images/account/house_default_list_img.png" alt="Picture" />
					</div>
					<div class="smallbig green_btn" id="cropper_smaller">
						<img alt="缩小" src="//staticnew.mayi.com/resourcesWeb/images/account/smaller.png" />
					</div>
					<div class="smallbig green_btn" id="cropper_bigger">
						<img alt="放大" src="//staticnew.mayi.com/resourcesWeb/images/account/bigger.png" />
					</div>
				</div>
				<div class="imgcropper_right">
					<h5>
					头像预览：
				</h5>
					<div class="col col-3">
						<div class="cropper-preview" id="cropper-preview">
							<img src="${user!=null?user.imgUrl:' '}" alt="" />
						</div>
					</div>
					<p>
						(支持jpg,png,jpeg,图片大小5M以内)
					</p>
					<div class="t-center">
						<a href="javascript:;" class="cropper-file green_btn">
							上传本地照片
							<input id="upload" type="file" value="上传照片" name="imageupload" accept="image/jpg,image/png,image/gif,image/bmp,image/jpeg" />
						</a>
					</div>
				</div>
			</div>
			<div class="cropper_buttons clearfloat">
				<a class="cropper_save green_btn" id="cropper_save">
					保存头像
				</a>
				<a class="cropper_cancel" id="cropper_cancel">
					关闭
				</a>
			</div>
		</div>
		<!-- 编辑头像弹框 结束 -->
	</body>

	</html>