<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>下单页</title>
		<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/v201807/index_page_new/css/public.css" />
		<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/newbaoxian/css/order.css" />
		<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/public_element.css" rel="stylesheet">
		<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/order_public.css" rel="stylesheet">
		<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/tel_type.css" rel="stylesheet">
		<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/index_list_calendar.css" rel="stylesheet" type="text/css">
		<link href="//staticnew.mayi.com/resourcesWeb/js/layer/skin/layer.css" rel="stylesheet" type="text/css">
		<link href="//staticnew.mayi.com/resourcesWeb/newbaoxian/css/fdbx.css" rel="stylesheet">
		<link href="//staticnew.mayi.com/resourcesWeb/newbaoxian/css/book2.css" rel="stylesheet">
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" language="javascript">
			$(function() {
				 m={
					        roomid:'852883945',
					   	 	minday:'1',
					    	detialJson:'{"checkinday":"${checkinday}","checkoutday":"${checkoutday}","specialdiscount":true,"checkinOfWeek":"${checkinOfWeek}","checkoutOfWeek":"${checkoutOfWeek}","nights":${nights},"roomNum":1,"totalPrice":${price*nights},"showtotalprice":${price*nights},"onlinePayAmount":${price*nights},"onlineAmount":${price*nights},"payRuleRate":100,"allrefundday":"2018-10-18","promotionModel":{"userCouponEntityList":[],"accountEntityList":[]},"priceDetailModel":{"sum":${price*nights},"showtotalPrice":${price*nights},"items":[{"date":"2018-10-21","originalPrice":228,"price":${price},"priceShow":${price},"type":10,"dayAmount":${price}},{"date":"2018-10-22","originalPrice":${price},"price":${price},"priceShow":${price},"type":10,"dayAmount":${price},"weekNum":1}]},"haveStock":1,"from":2,"originalPrice":${price*nights},"refundRullno":"退款政策：下单后取消订单，将收取未住房费的50%作为违约金支付给房东。"}'
					    };



				
				$('.App_download').mouseover(function() {
					$(this).find('.order_head_pop').show();
				})
				$('.App_download').mouseout(function() {
					$(this).find('.order_head_pop').hide();
				})
				/*查看开票须知*/
				$(".showInvo").click(function() {
					$(".invoice_link").show();
				})
				$(".invoice_close").click(function() {
					$(".invoice_link").hide();
				})
			});
		</script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/c.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/order/ticket.js"></script>
		<!--kgj add保险JS START-->
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/newbaoxian/js/insurance.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/ordernew/js/insurance_newbaoxian_supple.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/regx/idcard.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/regx/mayi.validate.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/v201510/js/maputil.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/ordernew/js/usercontact.js"></script>
		<!--kgj add保险JS END-->
		<!--日历-->
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/index/yui-min.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/ordernew/js/index_list_calendar1.js"></script>

		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/newbaoxian/js/order.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/ordernew/js/bookorder.js"></script>
		<!--右侧滚动效果-->
		<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/ordernew/js/scroll_zi.js"></script>
		<script type="text/javascript" src="//staticnew.mayi.com/resources/js/util.js"></script>

		<script>
			var inoviceTaxPoint = 0.05;
			var inoviceExpressFee = 7;
			//初始化保险身份类型
			var papertypemap = new Map();
			papertypemap.put("111", "身份证");
			papertypemap.put("516", "港澳通行证");
			papertypemap.put("511", "台湾通行证");
			papertypemap.put("233", "军官证");
			papertypemap.put("414", "护照");
			var nationlist = [{
				"name": "汉族",
				"id": 20,
				"orderno": 1,
				"pinyin": "hanzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "壮族",
				"id": 56,
				"orderno": 2,
				"pinyin": "zhuangzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "满族",
				"id": 31,
				"orderno": 3,
				"pinyin": "manzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "回族",
				"id": 22,
				"orderno": 4,
				"pinyin": "huizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "苗族",
				"id": 35,
				"orderno": 5,
				"pinyin": "miaozu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "维吾尔族",
				"id": 49,
				"orderno": 6,
				"pinyin": "weiwuerzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "土家族",
				"id": 46,
				"orderno": 7,
				"pinyin": "tujiazu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "彝族",
				"id": 53,
				"orderno": 8,
				"pinyin": "yizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "蒙古族",
				"id": 34,
				"orderno": 9,
				"pinyin": "mengguzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "藏族",
				"id": 55,
				"orderno": 10,
				"pinyin": "zangzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "阿昌族",
				"id": 1,
				"orderno": 11,
				"pinyin": "achangzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "白族",
				"id": 2,
				"orderno": 12,
				"pinyin": "baizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "保安族",
				"id": 3,
				"orderno": 13,
				"pinyin": "baoanzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "布朗族",
				"id": 4,
				"orderno": 14,
				"pinyin": "bulangzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "布依族",
				"id": 5,
				"orderno": 15,
				"pinyin": "buyizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "朝鲜族",
				"id": 6,
				"orderno": 16,
				"pinyin": "chaoxianzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "达斡尔族",
				"id": 7,
				"orderno": 17,
				"pinyin": "dawoerzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "傣族",
				"id": 8,
				"orderno": 18,
				"pinyin": "daizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "德昂族",
				"id": 9,
				"orderno": 19,
				"pinyin": "deangzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "东乡族",
				"id": 10,
				"orderno": 20,
				"pinyin": "dongxiangzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "侗族",
				"id": 11,
				"orderno": 21,
				"pinyin": "dongzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "独龙族",
				"id": 12,
				"orderno": 22,
				"pinyin": "dulongzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "俄罗斯族",
				"id": 13,
				"orderno": 23,
				"pinyin": "eluosizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "鄂伦春族",
				"id": 14,
				"orderno": 24,
				"pinyin": "elunchunzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "鄂温克族",
				"id": 15,
				"orderno": 25,
				"pinyin": "ewenkezu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "高山族",
				"id": 16,
				"orderno": 26,
				"pinyin": "gaoshanzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "仡佬族",
				"id": 17,
				"orderno": 27,
				"pinyin": "gelaozu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "哈尼族",
				"id": 18,
				"orderno": 28,
				"pinyin": "hanizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "哈萨克族",
				"id": 19,
				"orderno": 29,
				"pinyin": "hasakezu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "赫哲族",
				"id": 21,
				"orderno": 30,
				"pinyin": "hezhezu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "基诺族",
				"id": 23,
				"orderno": 31,
				"pinyin": "jinuozu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "京族",
				"id": 24,
				"orderno": 32,
				"pinyin": "jingzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "景颇族",
				"id": 25,
				"orderno": 33,
				"pinyin": "jingpozu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "柯尔克孜族",
				"id": 26,
				"orderno": 34,
				"pinyin": "keerkezizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "拉祜族",
				"id": 27,
				"orderno": 35,
				"pinyin": "lahuzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "傈僳族",
				"id": 29,
				"orderno": 36,
				"pinyin": "lisuzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "黎族",
				"id": 28,
				"orderno": 37,
				"pinyin": "lizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "珞巴族",
				"id": 30,
				"orderno": 39,
				"pinyin": "luobazu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "毛南族",
				"id": 32,
				"orderno": 41,
				"pinyin": "maonanzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "门巴族",
				"id": 33,
				"orderno": 43,
				"pinyin": "menbazu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "仫佬族",
				"id": 36,
				"orderno": 45,
				"pinyin": "mulaozu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "纳西族",
				"id": 37,
				"orderno": 47,
				"pinyin": "naxizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "怒族",
				"id": 38,
				"orderno": 49,
				"pinyin": "nuzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "普米族",
				"id": 39,
				"orderno": 51,
				"pinyin": "pumizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "羌族",
				"id": 40,
				"orderno": 53,
				"pinyin": "qiangzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "撒拉族",
				"id": 41,
				"orderno": 55,
				"pinyin": "salazu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "畲族",
				"id": 42,
				"orderno": 57,
				"pinyin": "shezu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "水族",
				"id": 43,
				"orderno": 59,
				"pinyin": "shuizu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "塔吉克族",
				"id": 44,
				"orderno": 61,
				"pinyin": "tajikezu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "塔塔尔族",
				"id": 45,
				"orderno": 63,
				"pinyin": "tataerzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "土族",
				"id": 47,
				"orderno": 65,
				"pinyin": "tuzu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "佤族",
				"id": 48,
				"orderno": 67,
				"pinyin": "wazu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "乌孜别克族",
				"id": 50,
				"orderno": 69,
				"pinyin": "wuzibiekezu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "锡伯族",
				"id": 51,
				"orderno": 71,
				"pinyin": "xibozu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "瑶族",
				"id": 52,
				"orderno": 73,
				"pinyin": "yaozu",
				"createtime": 1449056611000,
				"isuse": 1
			}, {
				"name": "裕固族",
				"id": 54,
				"orderno": 75,
				"pinyin": "yuguzu",
				"createtime": 1449056611000,
				"isuse": 1
			}];
			var countrylist = [{
				"id": 3,
				"createtime": 1448627540000,
				"cname": "阿富汗",
				"isuse": 1,
				"simplespile": "AF",
				"englishname": "AFGHANISTANA"
			}, {
				"id": 4,
				"createtime": 1448627540000,
				"cname": "阿尔巴尼亚",
				"isuse": 1,
				"simplespile": "AL",
				"englishname": "ALBANIA"
			}, {
				"id": 5,
				"createtime": 1448627540000,
				"cname": "阿尔及利亚",
				"isuse": 1,
				"simplespile": "DZ",
				"englishname": "ALGERIA"
			}, {
				"id": 6,
				"createtime": 1448627540000,
				"cname": "安道尔",
				"isuse": 1,
				"simplespile": "AD",
				"englishname": "ANDORRA"
			}, {
				"id": 7,
				"createtime": 1448627540000,
				"cname": "安哥拉",
				"isuse": 1,
				"simplespile": "AO",
				"englishname": "ANGOLA"
			}, {
				"id": 8,
				"createtime": 1448627540000,
				"cname": "安提瓜和巴布达",
				"isuse": 1,
				"simplespile": "AG",
				"englishname": "ANTIGUABARBUDA"
			}, {
				"id": 9,
				"createtime": 1448627540000,
				"cname": "阿拉伯联合酋长国",
				"isuse": 1,
				"simplespile": "AE",
				"englishname": "ARAB"
			}, {
				"id": 10,
				"createtime": 1448627540000,
				"cname": "阿根廷",
				"isuse": 1,
				"simplespile": "AR",
				"englishname": "ARGENTINA"
			}, {
				"id": 11,
				"createtime": 1448627540000,
				"cname": "亚美尼亚",
				"isuse": 1,
				"simplespile": "AM",
				"englishname": "ARMENIA"
			}, {
				"id": 12,
				"createtime": 1448627540000,
				"cname": "阿鲁巴",
				"isuse": 1,
				"simplespile": "AW",
				"englishname": "ARUBA"
			}, {
				"id": 13,
				"createtime": 1448627540000,
				"cname": "澳大利亚",
				"isuse": 1,
				"simplespile": "AU",
				"englishname": "AUSTRALIA"
			}, {
				"id": 14,
				"createtime": 1448627540000,
				"cname": "奥地利",
				"isuse": 1,
				"simplespile": "AT",
				"englishname": "AUSTRIA"
			}, {
				"id": 15,
				"createtime": 1448627540000,
				"cname": "阿塞拜疆共和国",
				"isuse": 1,
				"simplespile": "AZ",
				"englishname": "AZERBAIJAN"
			}, {
				"id": 16,
				"createtime": 1448627540000,
				"cname": "巴哈马",
				"isuse": 1,
				"simplespile": "BS",
				"englishname": "BAHAMAS"
			}, {
				"id": 17,
				"createtime": 1448627540000,
				"cname": "巴林",
				"isuse": 1,
				"simplespile": "BH",
				"englishname": "BAHRAIN"
			}, {
				"id": 18,
				"createtime": 1448627540000,
				"cname": "孟加拉国",
				"isuse": 1,
				"simplespile": "BD",
				"englishname": "BANGLADESH"
			}, {
				"id": 19,
				"createtime": 1448627540000,
				"cname": "巴巴多斯",
				"isuse": 1,
				"simplespile": "BB",
				"englishname": "BARBADOS"
			}, {
				"id": 20,
				"createtime": 1448627540000,
				"cname": "白俄罗斯",
				"isuse": 1,
				"simplespile": "BY",
				"englishname": "BELARUS"
			}, {
				"id": 21,
				"createtime": 1448627540000,
				"cname": "比利时",
				"isuse": 1,
				"simplespile": "BE",
				"englishname": "BELGIUM"
			}, {
				"id": 22,
				"createtime": 1448627540000,
				"cname": "伯里兹",
				"isuse": 1,
				"simplespile": "BZ",
				"englishname": "BELIZE"
			}, {
				"id": 23,
				"createtime": 1448627540000,
				"cname": "伯利兹",
				"isuse": 1,
				"simplespile": "BZ",
				"englishname": "BELIZE"
			}, {
				"id": 24,
				"createtime": 1448627540000,
				"cname": "贝宁",
				"isuse": 1,
				"simplespile": "BJ",
				"englishname": "BENIN"
			}, {
				"id": 25,
				"createtime": 1448627540000,
				"cname": "不丹",
				"isuse": 1,
				"simplespile": "BT",
				"englishname": "BHUTAN"
			}, {
				"id": 26,
				"createtime": 1448627540000,
				"cname": "玻利维亚",
				"isuse": 1,
				"simplespile": "BO",
				"englishname": "BOLIVIA"
			}, {
				"id": 27,
				"createtime": 1448627540000,
				"cname": "波斯尼亚和黑塞哥维那",
				"isuse": 1,
				"simplespile": "BA",
				"englishname": "BOSNIA"
			}, {
				"id": 28,
				"createtime": 1448627540000,
				"cname": "博茨瓦纳",
				"isuse": 1,
				"simplespile": "BW",
				"englishname": "BOTSWANA"
			}, {
				"id": 29,
				"createtime": 1448627540000,
				"cname": "巴西",
				"isuse": 1,
				"simplespile": "BR",
				"englishname": "BRAZIL"
			}, {
				"id": 33,
				"createtime": 1448627540000,
				"cname": "文莱",
				"isuse": 1,
				"simplespile": "BN",
				"englishname": "BruneiDarussalam"
			}, {
				"id": 30,
				"createtime": 1448627540000,
				"cname": "保加利亚",
				"isuse": 1,
				"simplespile": "BG",
				"englishname": "BULGARIA"
			}, {
				"id": 31,
				"createtime": 1448627540000,
				"cname": "布基纳法索",
				"isuse": 1,
				"simplespile": "BF",
				"englishname": "BURKINAFASO"
			}, {
				"id": 32,
				"createtime": 1448627540000,
				"cname": "布隆迪",
				"isuse": 1,
				"simplespile": "BI",
				"englishname": "BURUNDI"
			}, {
				"id": 34,
				"createtime": 1448627540000,
				"cname": "柬埔寨",
				"isuse": 1,
				"simplespile": "KH",
				"englishname": "CAMBODIA"
			}, {
				"id": 35,
				"createtime": 1448627540000,
				"cname": "喀麦隆",
				"isuse": 1,
				"simplespile": "CM",
				"englishname": "CAMEROON"
			}, {
				"id": 36,
				"createtime": 1448627540000,
				"cname": "加拿大",
				"isuse": 1,
				"simplespile": "CA",
				"englishname": "CANADA"
			}, {
				"id": 37,
				"createtime": 1448627540000,
				"cname": "佛得角",
				"isuse": 1,
				"simplespile": "KY",
				"englishname": "CAPEVERDE"
			}, {
				"id": 50,
				"createtime": 1448627540000,
				"cname": "中非共和国",
				"isuse": 1,
				"simplespile": "CF",
				"englishname": "Central Africa Republic"
			}, {
				"id": 38,
				"createtime": 1448627540000,
				"cname": "乍得",
				"isuse": 1,
				"simplespile": "TD",
				"englishname": "CHAD"
			}, {
				"id": 39,
				"createtime": 1448627540000,
				"cname": "智利",
				"isuse": 1,
				"simplespile": "CL",
				"englishname": "CHILE"
			}, {
				"id": 1,
				"createtime": 1448627540000,
				"cname": "中国",
				"isuse": 1,
				"simplespile": "CN",
				"englishname": "CHINA"
			}, {
				"id": 40,
				"createtime": 1448627540000,
				"cname": "哥伦比亚",
				"isuse": 1,
				"simplespile": "CO",
				"englishname": "COLOMBIA"
			}, {
				"id": 42,
				"createtime": 1448627540000,
				"cname": "科摩罗",
				"isuse": 1,
				"simplespile": "KM",
				"englishname": "COMOROS"
			}, {
				"id": 43,
				"createtime": 1448627540000,
				"cname": "刚果（布）",
				"isuse": 1,
				"simplespile": "CG",
				"englishname": "CONGO"
			}, {
				"id": 44,
				"createtime": 1448627540000,
				"cname": "库克群岛",
				"isuse": 1,
				"simplespile": "CK",
				"englishname": "COOKISLANDS"
			}, {
				"id": 51,
				"createtime": 1448627540000,
				"cname": "哥斯达黎加",
				"isuse": 1,
				"simplespile": "CRC",
				"englishname": "CostaRica"
			}, {
				"id": 45,
				"createtime": 1448627540000,
				"cname": "科特迪瓦",
				"isuse": 1,
				"simplespile": "CI",
				"englishname": "COTEDLVOIRE"
			}, {
				"id": 46,
				"createtime": 1448627540000,
				"cname": "克罗地亚",
				"isuse": 1,
				"simplespile": "HR",
				"englishname": "CROATIA"
			}, {
				"id": 47,
				"createtime": 1448627540000,
				"cname": "古巴共和国",
				"isuse": 1,
				"simplespile": "CU",
				"englishname": "CUBA"
			}, {
				"id": 48,
				"createtime": 1448627540000,
				"cname": "塞浦路斯",
				"isuse": 1,
				"simplespile": "CY",
				"englishname": "CYPRUS"
			}, {
				"id": 49,
				"createtime": 1448627540000,
				"cname": "捷克共和国",
				"isuse": 1,
				"simplespile": "CZ",
				"englishname": "CZECHREPUBLIC"
			}, {
				"id": 52,
				"createtime": 1448627540000,
				"cname": "刚果（金）",
				"isuse": 1,
				"simplespile": "CD",
				"englishname": "DEMOCRATIC REPUBLIC OF CONGO"
			}, {
				"id": 53,
				"createtime": 1448627540000,
				"cname": "也门民主人民共和国",
				"isuse": 1,
				"simplespile": "YD",
				"englishname": "DEMOCRATICYEMEN"
			}, {
				"id": 54,
				"createtime": 1448627540000,
				"cname": "丹麦",
				"isuse": 1,
				"simplespile": "DK",
				"englishname": "DENMARK"
			}, {
				"id": 55,
				"createtime": 1448627540000,
				"cname": "吉布提",
				"isuse": 1,
				"simplespile": "DJ",
				"englishname": "DJIBOUTI"
			}, {
				"id": 56,
				"createtime": 1448627540000,
				"cname": "多米尼克",
				"isuse": 1,
				"simplespile": "DM",
				"englishname": "DOMINICA"
			}, {
				"id": 57,
				"createtime": 1448627540000,
				"cname": "多米尼加",
				"isuse": 1,
				"simplespile": "DO",
				"englishname": "DOMINICAN REPUBLIC"
			}, {
				"id": 58,
				"createtime": 1448627540000,
				"cname": "厄瓜多尔",
				"isuse": 1,
				"simplespile": "EC",
				"englishname": "ECUADOR"
			}, {
				"id": 59,
				"createtime": 1448627540000,
				"cname": "埃及",
				"isuse": 1,
				"simplespile": "EG",
				"englishname": "EGYPT"
			}, {
				"id": 60,
				"createtime": 1448627540000,
				"cname": "萨尔瓦多",
				"isuse": 1,
				"simplespile": "EV",
				"englishname": "EL SALVADOR"
			}, {
				"id": 61,
				"createtime": 1448627540000,
				"cname": "赤道几内亚",
				"isuse": 1,
				"simplespile": "GQ",
				"englishname": "EQUATORIALGUINEA"
			}, {
				"id": 62,
				"createtime": 1448627540000,
				"cname": "厄立特里亚",
				"isuse": 1,
				"simplespile": "ER",
				"englishname": "ERITREA"
			}, {
				"id": 63,
				"createtime": 1448627540000,
				"cname": "爱沙尼亚",
				"isuse": 1,
				"simplespile": "EE",
				"englishname": "ESTONIA"
			}, {
				"id": 64,
				"createtime": 1448627540000,
				"cname": "埃塞俄比亚",
				"isuse": 1,
				"simplespile": "ET",
				"englishname": "ETHIOPIA"
			}, {
				"id": 65,
				"createtime": 1448627540000,
				"cname": "斐济",
				"isuse": 1,
				"simplespile": "FJ",
				"englishname": "FIJI"
			}, {
				"id": 66,
				"createtime": 1448627540000,
				"cname": "芬兰",
				"isuse": 1,
				"simplespile": "FI",
				"englishname": "FINLAND"
			}, {
				"id": 67,
				"createtime": 1448627540000,
				"cname": "法国",
				"isuse": 1,
				"simplespile": "FR",
				"englishname": "FRANCE"
			}, {
				"id": 68,
				"createtime": 1448627540000,
				"cname": "加蓬",
				"isuse": 1,
				"simplespile": "GA",
				"englishname": "GABON"
			}, {
				"id": 69,
				"createtime": 1448627540000,
				"cname": "冈比亚",
				"isuse": 1,
				"simplespile": "GM",
				"englishname": "GAMBIA"
			}, {
				"id": 70,
				"createtime": 1448627540000,
				"cname": "格鲁吉亚",
				"isuse": 1,
				"simplespile": "CE",
				"englishname": "GEORGIA"
			}, {
				"id": 71,
				"createtime": 1448627540000,
				"cname": "德国",
				"isuse": 1,
				"simplespile": "DE",
				"englishname": "GERMANY"
			}, {
				"id": 72,
				"createtime": 1448627540000,
				"cname": "加纳",
				"isuse": 1,
				"simplespile": "GH",
				"englishname": "GHANA"
			}, {
				"id": 73,
				"createtime": 1448627540000,
				"cname": "希腊",
				"isuse": 1,
				"simplespile": "GR",
				"englishname": "GREECE"
			}, {
				"id": 74,
				"createtime": 1448627540000,
				"cname": "格林纳达",
				"isuse": 1,
				"simplespile": "GL",
				"englishname": "GRENADA"
			}, {
				"id": 79,
				"createtime": 1448627540000,
				"cname": "危地马拉",
				"isuse": 1,
				"simplespile": "GT",
				"englishname": "Guatemala"
			}, {
				"id": 75,
				"createtime": 1448627540000,
				"cname": "几内亚",
				"isuse": 1,
				"simplespile": "GN",
				"englishname": "GUINEA"
			}, {
				"id": 77,
				"createtime": 1448627540000,
				"cname": "几内亚比绍",
				"isuse": 1,
				"simplespile": "GW",
				"englishname": "GUINEABISSAU"
			}, {
				"id": 78,
				"createtime": 1448627540000,
				"cname": "圭亚那",
				"isuse": 1,
				"simplespile": "GY",
				"englishname": "GUYANA"
			}, {
				"id": 80,
				"createtime": 1448627540000,
				"cname": "海地",
				"isuse": 1,
				"simplespile": "HT",
				"englishname": "HAITI"
			}, {
				"id": 81,
				"createtime": 1448627540000,
				"cname": "荷兰",
				"isuse": 1,
				"simplespile": "NL",
				"englishname": "HOLLAND"
			}, {
				"id": 82,
				"createtime": 1448627540000,
				"cname": "洪都拉斯",
				"isuse": 1,
				"simplespile": "HN",
				"englishname": "HONDURAS"
			}, {
				"id": 83,
				"createtime": 1448627540000,
				"cname": "匈牙利",
				"isuse": 1,
				"simplespile": "HU",
				"englishname": "HUNGARY"
			}, {
				"id": 84,
				"createtime": 1448627540000,
				"cname": "冰岛",
				"isuse": 1,
				"simplespile": "IS",
				"englishname": "ICELAND"
			}, {
				"id": 85,
				"createtime": 1448627540000,
				"cname": "印度",
				"isuse": 1,
				"simplespile": "IN",
				"englishname": "INDIA"
			}, {
				"id": 86,
				"createtime": 1448627540000,
				"cname": "印度尼西亚",
				"isuse": 1,
				"simplespile": "ID",
				"englishname": "INDONESIA"
			}, {
				"id": 87,
				"createtime": 1448627540000,
				"cname": "伊朗",
				"isuse": 1,
				"simplespile": "IR",
				"englishname": "IRAN"
			}, {
				"id": 88,
				"createtime": 1448627540000,
				"cname": "伊拉克",
				"isuse": 1,
				"simplespile": "IQ",
				"englishname": "IRAQ"
			}, {
				"id": 89,
				"createtime": 1448627540000,
				"cname": "爱尔兰",
				"isuse": 1,
				"simplespile": "IE",
				"englishname": "IRELAND"
			}, {
				"id": 90,
				"createtime": 1448627540000,
				"cname": "以色列",
				"isuse": 1,
				"simplespile": "IL",
				"englishname": "ISRAEL"
			}, {
				"id": 91,
				"createtime": 1448627540000,
				"cname": "意大利",
				"isuse": 1,
				"simplespile": "IT",
				"englishname": "ITALY"
			}, {
				"id": 92,
				"createtime": 1448627540000,
				"cname": "牙买加",
				"isuse": 1,
				"simplespile": "JM",
				"englishname": "JAMAICA"
			}, {
				"id": 93,
				"createtime": 1448627540000,
				"cname": "日本",
				"isuse": 1,
				"simplespile": "JP",
				"englishname": "JAPAN"
			}, {
				"id": 94,
				"createtime": 1448627540000,
				"cname": "约旦",
				"isuse": 1,
				"simplespile": "JO",
				"englishname": "JORDAN"
			}, {
				"id": 95,
				"createtime": 1448627540000,
				"cname": "哈萨克斯坦",
				"isuse": 1,
				"simplespile": "KZ",
				"englishname": "KAZAKHSTAN"
			}, {
				"id": 96,
				"createtime": 1448627540000,
				"cname": "肯尼亚",
				"isuse": 1,
				"simplespile": "KE",
				"englishname": "KENYA"
			}, {
				"id": 97,
				"createtime": 1448627540000,
				"cname": "吉尔吉斯共和国",
				"isuse": 1,
				"simplespile": "KG",
				"englishname": "KIRGIZSTAN"
			}, {
				"id": 98,
				"createtime": 1448627540000,
				"cname": "基里巴斯",
				"isuse": 1,
				"simplespile": "KI",
				"englishname": "KIRIBATI"
			}, {
				"id": 99,
				"createtime": 1448627540000,
				"cname": "韩国",
				"isuse": 1,
				"simplespile": "KR",
				"englishname": "KOREA"
			}, {
				"id": 101,
				"createtime": 1448627540000,
				"cname": "朝鲜",
				"isuse": 1,
				"simplespile": "DPR",
				"englishname": "Korea"
			}, {
				"id": 100,
				"createtime": 1448627540000,
				"cname": "科威特",
				"isuse": 1,
				"simplespile": "KW",
				"englishname": "KUWAIT"
			}, {
				"id": 102,
				"createtime": 1448627540000,
				"cname": "老挝",
				"isuse": 1,
				"simplespile": "LA",
				"englishname": "LAOS"
			}, {
				"id": 103,
				"createtime": 1448627540000,
				"cname": "拉脱维亚",
				"isuse": 1,
				"simplespile": "LV",
				"englishname": "LATVIA"
			}, {
				"id": 104,
				"createtime": 1448627540000,
				"cname": "黎巴嫩",
				"isuse": 1,
				"simplespile": "LB",
				"englishname": "LEBANON"
			}, {
				"id": 105,
				"createtime": 1448627540000,
				"cname": "莱索托",
				"isuse": 1,
				"simplespile": "LS",
				"englishname": "LESOTHO"
			}, {
				"id": 106,
				"createtime": 1448627540000,
				"cname": "利比里亚",
				"isuse": 1,
				"simplespile": "LR",
				"englishname": "LIBERIA"
			}, {
				"id": 107,
				"createtime": 1448627540000,
				"cname": "利比亚",
				"isuse": 1,
				"simplespile": "LY",
				"englishname": "LIBYA"
			}, {
				"id": 108,
				"createtime": 1448627540000,
				"cname": "列支敦士登",
				"isuse": 1,
				"simplespile": "LI",
				"englishname": "LIECHTENSTEIN"
			}, {
				"id": 109,
				"createtime": 1448627540000,
				"cname": "立陶宛",
				"isuse": 1,
				"simplespile": "LT",
				"englishname": "LITHUANIA"
			}, {
				"id": 110,
				"createtime": 1448627540000,
				"cname": "卢森堡",
				"isuse": 1,
				"simplespile": "LU",
				"englishname": "LUXEMBOURG"
			}, {
				"id": 111,
				"createtime": 1448627540000,
				"cname": "马其顿",
				"isuse": 1,
				"simplespile": "MK",
				"englishname": "MACEDONIA"
			}, {
				"id": 112,
				"createtime": 1448627540000,
				"cname": "马达加斯加",
				"isuse": 1,
				"simplespile": "MG",
				"englishname": "MADAGASCAR"
			}, {
				"id": 113,
				"createtime": 1448627540000,
				"cname": "马拉维",
				"isuse": 1,
				"simplespile": "MW",
				"englishname": "MALAWI"
			}, {
				"id": 114,
				"createtime": 1448627540000,
				"cname": "马来西亚",
				"isuse": 1,
				"simplespile": "MY",
				"englishname": "MALAYSIA"
			}, {
				"id": 115,
				"createtime": 1448627540000,
				"cname": "马尔代夫",
				"isuse": 1,
				"simplespile": "MV",
				"englishname": "MALDIVES"
			}, {
				"id": 116,
				"createtime": 1448627540000,
				"cname": "马里",
				"isuse": 1,
				"simplespile": "ML",
				"englishname": "MALI"
			}, {
				"id": 117,
				"createtime": 1448627540000,
				"cname": "马耳他",
				"isuse": 1,
				"simplespile": "MT",
				"englishname": "MALTA"
			}, {
				"id": 118,
				"createtime": 1448627540000,
				"cname": "马绍尔群岛",
				"isuse": 1,
				"simplespile": "MH",
				"englishname": "MARSHALL ISLANDS"
			}, {
				"id": 119,
				"createtime": 1448627540000,
				"cname": "毛里塔尼亚",
				"isuse": 1,
				"simplespile": "MR",
				"englishname": "MAURITANIA"
			}, {
				"id": 120,
				"createtime": 1448627541000,
				"cname": "毛里求斯",
				"isuse": 1,
				"simplespile": "MU",
				"englishname": "MAURITIUS"
			}, {
				"id": 121,
				"createtime": 1448627541000,
				"cname": "墨西哥",
				"isuse": 1,
				"simplespile": "MX",
				"englishname": "MEXICO"
			}, {
				"id": 122,
				"createtime": 1448627541000,
				"cname": "密克罗尼西亚联邦",
				"isuse": 1,
				"simplespile": "FM",
				"englishname": "MICRONESIA"
			}, {
				"id": 123,
				"createtime": 1448627541000,
				"cname": "摩尔多瓦",
				"isuse": 1,
				"simplespile": "MD",
				"englishname": "MOLDOVA"
			}, {
				"id": 124,
				"createtime": 1448627541000,
				"cname": "摩纳哥",
				"isuse": 1,
				"simplespile": "MC",
				"englishname": "MONACO"
			}, {
				"id": 125,
				"createtime": 1448627541000,
				"cname": "蒙古",
				"isuse": 1,
				"simplespile": "MN",
				"englishname": "MONGOLIA"
			}, {
				"id": 126,
				"createtime": 1448627541000,
				"cname": "黑山",
				"isuse": 1,
				"simplespile": "ME",
				"englishname": "MONTENEGRO"
			}, {
				"id": 127,
				"createtime": 1448627541000,
				"cname": "摩洛哥",
				"isuse": 1,
				"simplespile": "MA",
				"englishname": "MOROCCO"
			}, {
				"id": 128,
				"createtime": 1448627541000,
				"cname": "莫桑比克",
				"isuse": 1,
				"simplespile": "MZ",
				"englishname": "MOZAMBIQUE"
			}, {
				"id": 129,
				"createtime": 1448627541000,
				"cname": "缅甸",
				"isuse": 1,
				"simplespile": "MM",
				"englishname": "MYANMAR"
			}, {
				"id": 130,
				"createtime": 1448627541000,
				"cname": "纳米比亚",
				"isuse": 1,
				"simplespile": "NA",
				"englishname": "NAMIBIA"
			}, {
				"id": 131,
				"createtime": 1448627541000,
				"cname": "瑙鲁",
				"isuse": 1,
				"simplespile": "NR",
				"englishname": "NAURU"
			}, {
				"id": 132,
				"createtime": 1448627541000,
				"cname": "尼泊尔",
				"isuse": 1,
				"simplespile": "NP",
				"englishname": "NEPAL"
			}, {
				"id": 133,
				"createtime": 1448627541000,
				"cname": "新西兰",
				"isuse": 1,
				"simplespile": "NZ",
				"englishname": "NEWZEALAND"
			}, {
				"id": 134,
				"createtime": 1448627541000,
				"cname": "尼加拉瓜",
				"isuse": 1,
				"simplespile": "NI",
				"englishname": "NICARAGUA"
			}, {
				"id": 135,
				"createtime": 1448627541000,
				"cname": "尼日尔",
				"isuse": 1,
				"simplespile": "NE",
				"englishname": "NIGER"
			}, {
				"id": 136,
				"createtime": 1448627541000,
				"cname": "尼日利亚",
				"isuse": 1,
				"simplespile": "NG",
				"englishname": "NIGERIA"
			}, {
				"id": 137,
				"createtime": 1448627541000,
				"cname": "挪威",
				"isuse": 1,
				"simplespile": "NO",
				"englishname": "NORWAY"
			}, {
				"id": 138,
				"createtime": 1448627541000,
				"cname": "阿曼",
				"isuse": 1,
				"simplespile": "OM",
				"englishname": "OMAN"
			}, {
				"id": 139,
				"createtime": 1448627541000,
				"cname": "巴基斯坦",
				"isuse": 1,
				"simplespile": "PK",
				"englishname": "PAKISTAN"
			}, {
				"id": 140,
				"createtime": 1448627541000,
				"cname": "帕劳",
				"isuse": 1,
				"simplespile": "PW",
				"englishname": "PALAU"
			}, {
				"id": 141,
				"createtime": 1448627541000,
				"cname": "巴勒斯坦",
				"isuse": 1,
				"simplespile": "BL",
				"englishname": "PALESTINE"
			}, {
				"id": 142,
				"createtime": 1448627541000,
				"cname": "巴拿马",
				"isuse": 1,
				"simplespile": "PA",
				"englishname": "PANAMA"
			}, {
				"id": 143,
				"createtime": 1448627541000,
				"cname": "巴布亚新几内亚",
				"isuse": 1,
				"simplespile": "PG",
				"englishname": "PAPUANEWGUINEA"
			}, {
				"id": 144,
				"createtime": 1448627541000,
				"cname": "巴拉圭",
				"isuse": 1,
				"simplespile": "PY",
				"englishname": "PARAGUAY"
			}, {
				"id": 145,
				"createtime": 1448627541000,
				"cname": "秘鲁",
				"isuse": 1,
				"simplespile": "PE",
				"englishname": "PERU"
			}, {
				"id": 146,
				"createtime": 1448627541000,
				"cname": "菲律宾",
				"isuse": 1,
				"simplespile": "PH",
				"englishname": "PHILIPPINES"
			}, {
				"id": 147,
				"createtime": 1448627541000,
				"cname": "波兰",
				"isuse": 1,
				"simplespile": "PL",
				"englishname": "POLAND"
			}, {
				"id": 148,
				"createtime": 1448627541000,
				"cname": "葡萄牙",
				"isuse": 1,
				"simplespile": "PT",
				"englishname": "PORTUGAL"
			}, {
				"id": 149,
				"createtime": 1448627541000,
				"cname": "波多黎各",
				"isuse": 1,
				"simplespile": "PR",
				"englishname": "PUERTO RICO"
			}, {
				"id": 150,
				"createtime": 1448627541000,
				"cname": "卡塔尔",
				"isuse": 1,
				"simplespile": "QA",
				"englishname": "QATAR"
			}, {
				"id": 151,
				"createtime": 1448627541000,
				"cname": "罗马尼亚",
				"isuse": 1,
				"simplespile": "RO",
				"englishname": "ROMANIA"
			}, {
				"id": 152,
				"createtime": 1448627541000,
				"cname": "俄罗斯",
				"isuse": 1,
				"simplespile": "RU",
				"englishname": "RUSSIA"
			}, {
				"id": 153,
				"createtime": 1448627541000,
				"cname": "卢旺达",
				"isuse": 1,
				"simplespile": "RW",
				"englishname": "RWANDA"
			}, {
				"id": 154,
				"createtime": 1448627541000,
				"cname": "圣基茨和尼维斯",
				"isuse": 1,
				"simplespile": "KNA",
				"englishname": "SAINT KITTS"
			}, {
				"id": 155,
				"createtime": 1448627541000,
				"cname": "圣文森特和格林纳丁斯",
				"isuse": 1,
				"simplespile": "VC",
				"englishname": "SAINT VINCENT AND THE GRENADIN"
			}, {
				"id": 156,
				"createtime": 1448627541000,
				"cname": "圣卢西亚",
				"isuse": 1,
				"simplespile": "LC",
				"englishname": "SAINTLUCIA"
			}, {
				"id": 157,
				"createtime": 1448627541000,
				"cname": "美属萨摩亚",
				"isuse": 1,
				"simplespile": "WS",
				"englishname": "SAMOA"
			}, {
				"id": 158,
				"createtime": 1448627541000,
				"cname": "圣马力诺",
				"isuse": 1,
				"simplespile": "SM",
				"englishname": "SANMARINO"
			}, {
				"id": 159,
				"createtime": 1448627541000,
				"cname": "圣多美和普林西比",
				"isuse": 1,
				"simplespile": "ST",
				"englishname": "SAOTOMEPRINCIPE"
			}, {
				"id": 160,
				"createtime": 1448627541000,
				"cname": "沙特阿拉伯",
				"isuse": 1,
				"simplespile": "SA",
				"englishname": "SAUDIARABIA"
			}, {
				"id": 161,
				"createtime": 1448627541000,
				"cname": "塞内加尔",
				"isuse": 1,
				"simplespile": "SN",
				"englishname": "SENEGAL"
			}, {
				"id": 162,
				"createtime": 1448627541000,
				"cname": "塞尔维亚",
				"isuse": 1,
				"simplespile": "CS",
				"englishname": "SERBIA"
			}, {
				"id": 163,
				"createtime": 1448627541000,
				"cname": "塞舌尔",
				"isuse": 1,
				"simplespile": "SC",
				"englishname": "SEYCHELLES"
			}, {
				"id": 164,
				"createtime": 1448627541000,
				"cname": "塞拉利昂",
				"isuse": 1,
				"simplespile": "SL",
				"englishname": "SIERRALEONE"
			}, {
				"id": 165,
				"createtime": 1448627541000,
				"cname": "新加坡",
				"isuse": 1,
				"simplespile": "SG",
				"englishname": "SINGAPORE"
			}, {
				"id": 166,
				"createtime": 1448627541000,
				"cname": "斯洛伐克",
				"isuse": 1,
				"simplespile": "SK",
				"englishname": "SLOVAKIA"
			}, {
				"id": 167,
				"createtime": 1448627541000,
				"cname": "斯洛伐克共和国",
				"isuse": 1,
				"simplespile": "SK",
				"englishname": "SLOVAKREPUBLIC"
			}, {
				"id": 168,
				"createtime": 1448627541000,
				"cname": "斯洛文尼亚",
				"isuse": 1,
				"simplespile": "SI",
				"englishname": "SLOVENIA"
			}, {
				"id": 169,
				"createtime": 1448627541000,
				"cname": "所罗门群岛",
				"isuse": 1,
				"simplespile": "SB",
				"englishname": "SOLOMON ISLANDS"
			}, {
				"id": 170,
				"createtime": 1448627541000,
				"cname": "索马里",
				"isuse": 1,
				"simplespile": "SO",
				"englishname": "SOMALI"
			}, {
				"id": 172,
				"createtime": 1448627541000,
				"cname": "南非",
				"isuse": 1,
				"simplespile": "ZA",
				"englishname": "SOUTHAFRICA"
			}, {
				"id": 173,
				"createtime": 1448627541000,
				"cname": "西班牙",
				"isuse": 1,
				"simplespile": "ES",
				"englishname": "SPAIN"
			}, {
				"id": 174,
				"createtime": 1448627541000,
				"cname": "斯里兰卡",
				"isuse": 1,
				"simplespile": "LK",
				"englishname": "SRILANKA"
			}, {
				"id": 175,
				"createtime": 1448627541000,
				"cname": "苏丹",
				"isuse": 1,
				"simplespile": "SD",
				"englishname": "SUDAN"
			}, {
				"id": 176,
				"createtime": 1448627541000,
				"cname": "苏里南",
				"isuse": 1,
				"simplespile": "SR",
				"englishname": "SURINAM"
			}, {
				"id": 177,
				"createtime": 1448627541000,
				"cname": "斯威士兰",
				"isuse": 1,
				"simplespile": "SZ",
				"englishname": "SWAZILAND"
			}, {
				"id": 178,
				"createtime": 1448627541000,
				"cname": "瑞典",
				"isuse": 1,
				"simplespile": "SE",
				"englishname": "SWEDEN"
			}, {
				"id": 179,
				"createtime": 1448627541000,
				"cname": "瑞士",
				"isuse": 1,
				"simplespile": "CH",
				"englishname": "SWITZERLAND"
			}, {
				"id": 180,
				"createtime": 1448627541000,
				"cname": "叙利亚",
				"isuse": 1,
				"simplespile": "SY",
				"englishname": "SYRIA"
			}, {
				"id": 181,
				"createtime": 1448627541000,
				"cname": "塔吉克斯坦",
				"isuse": 1,
				"simplespile": "TJ",
				"englishname": "TAJIKISTAN"
			}, {
				"id": 182,
				"createtime": 1448627541000,
				"cname": "坦桑尼亚",
				"isuse": 1,
				"simplespile": "TZ",
				"englishname": "TANZANIA"
			}, {
				"id": 183,
				"createtime": 1448627541000,
				"cname": "泰国",
				"isuse": 1,
				"simplespile": "TH",
				"englishname": "THAILAND"
			}, {
				"id": 184,
				"createtime": 1448627541000,
				"cname": "乌干达",
				"isuse": 1,
				"simplespile": "UGA",
				"englishname": "THE REPUBLIC OF UGANDA"
			}, {
				"id": 185,
				"createtime": 1448627541000,
				"cname": "东帝汶",
				"isuse": 1,
				"simplespile": "TL",
				"englishname": "TIMOR"
			}, {
				"id": 186,
				"createtime": 1448627541000,
				"cname": "多哥",
				"isuse": 1,
				"simplespile": "TG",
				"englishname": "TOGO"
			}, {
				"id": 187,
				"createtime": 1448627541000,
				"cname": "汤加",
				"isuse": 1,
				"simplespile": "TO",
				"englishname": "TONGA"
			}, {
				"id": 188,
				"createtime": 1448627541000,
				"cname": "特立尼达和多巴哥",
				"isuse": 1,
				"simplespile": "TT",
				"englishname": "TRINIDADANDTOBAGO"
			}, {
				"id": 189,
				"createtime": 1448627541000,
				"cname": "突尼斯",
				"isuse": 1,
				"simplespile": "TN",
				"englishname": "TUNISIA"
			}, {
				"id": 190,
				"createtime": 1448627541000,
				"cname": "土耳其",
				"isuse": 1,
				"simplespile": "TR",
				"englishname": "TURKEY"
			}, {
				"id": 191,
				"createtime": 1448627541000,
				"cname": "土库曼斯坦",
				"isuse": 1,
				"simplespile": "TM",
				"englishname": "TURKMENISTAN"
			}, {
				"id": 192,
				"createtime": 1448627541000,
				"cname": "乌克兰",
				"isuse": 1,
				"simplespile": "UKR",
				"englishname": "UKRAINE"
			}, {
				"id": 193,
				"createtime": 1448627541000,
				"cname": "英国",
				"isuse": 1,
				"simplespile": "GB",
				"englishname": "UNITED KINGDOM"
			}, {
				"id": 2,
				"createtime": 1448627540000,
				"cname": "美国",
				"isuse": 1,
				"simplespile": "US",
				"englishname": "UNITEDSTATES"
			}, {
				"id": 195,
				"createtime": 1448627541000,
				"cname": "乌拉圭",
				"isuse": 1,
				"simplespile": "UY",
				"englishname": "Uruguay"
			}, {
				"id": 194,
				"createtime": 1448627541000,
				"cname": "乌兹别克斯坦",
				"isuse": 1,
				"simplespile": "UZB",
				"englishname": "UZBEKISTAN"
			}, {
				"id": 196,
				"createtime": 1448627541000,
				"cname": "瓦努阿图",
				"isuse": 1,
				"simplespile": "VU",
				"englishname": "VANUATU"
			}, {
				"id": 197,
				"createtime": 1448627541000,
				"cname": "梵蒂冈",
				"isuse": 1,
				"simplespile": "VA",
				"englishname": "VATICAN"
			}, {
				"id": 199,
				"createtime": 1448627541000,
				"cname": "委内瑞拉",
				"isuse": 1,
				"simplespile": "VE",
				"englishname": "Venezuela"
			}, {
				"id": 198,
				"createtime": 1448627541000,
				"cname": "越南",
				"isuse": 1,
				"simplespile": "VIE",
				"englishname": "VIETNAM"
			}, {
				"id": 200,
				"createtime": 1448627541000,
				"cname": "赞比亚",
				"isuse": 1,
				"simplespile": "ZM",
				"englishname": "ZAMBIA"
			}, {
				"id": 201,
				"createtime": 1448627541000,
				"cname": "津巴布韦",
				"isuse": 1,
				"simplespile": "ZW",
				"englishname": "ZIMBABWE"
			}];

			function loginShow() {
				$("#loginshow").click();
			}
		</script>
		<script type="text/javascript" language="javascript">
			//给动态添加的优惠券选项添加事件
			$(function() {
				bindEventForPromt();
			});

			function bindEventForPromt() {
				$("#coupon").find(":radio").on('click', function() {
					processPromotion(this);
					if(typeof($(this).next().val()) != "undefined" && $(this).next().val() != '') {
						var cpvalues = $(this).next().val().split(",");
						var coupid = cpvalues[0];
						if($(this).val() == '' && typeof(coupid) != "undefined" && coupid != '') {
							$(this).val(coupid);
						}
						if(cpvalues.length > 0 && typeof(cpvalues[1]) != "undefined" && cpvalues[1] == 1) {
							$("#tipSpan").text($(this).parent().text());
							$("#warmTip").show();
						} else {
							$("#warmTip").hide();
						}
					}
				});
				$("#coupon").find(":checkbox").on('click', function() {
					processPromotion(this);
					var coupid = $(this).next().val();
					if($(this).val() == '' && typeof(coupid) != "undefined" && coupid != '') {
						$(this).val(coupid)
					}
					$("#warmTip").hide();
				});
			}
			//处理单击事件
			function processPromotion(obj) {
				var type = $(obj).attr("type");
				if(type == "radio") {
					$("#coupon").find(":checkbox").prop("checked", false);
					$("#promotiontype").val(2);
					var amountShow = $(obj).attr("amountShow");
					var olpayMony = (parseFloat($("#onlinePayAmount").val()) - parseFloat(amountShow)).toFixed(2);
					$("#typeAlias").text("优惠券");
					$("#selectOnline").val("优惠券");
					$("#promotionAmount").text(-parseFloat(amountShow));
					//kgj add  是提交订单页面
					if($(".inspersonDetail").length >= 1) {
						setCuponPrice();
					} else {
						setPayCuponPrice();
						//$("#onlinePayAmountShow").text(olpayMony<0?'0.00':olpayMony);
					}
				} else if(type == "checkbox") {
					$("#coupon").find(":radio").prop("checked", false);
					$("#promotiontype").val(1);
					var size = $("#coupon").find(":checkbox:checked").size();
					if(size > 0) {
						$("#promotiontype").val(1);
					} else {
						$("#promotiontype").val(0);
					}

					var amountShow = 0;
					$("#coupon").find(":checkbox:checked").each(function() {
						amountShow = (parseFloat(amountShow) + parseFloat($(this).attr("amountShow"))).toFixed(2);
					});
					$("#typeAlias").text("代金券");
					$("#selectOnline").val("代金券");

					var onlinePayAmountShow = (parseFloat($("#onlinePayAmount").val()) - parseFloat(amountShow)).toFixed(2);
					if(onlinePayAmountShow < 0) {
						onlinePayAmountShow = '0.00';
						$("#promotionAmount").text('-' + $("#onlinePayAmount").val());
					} else {
						$("#promotionAmount").text('-' + amountShow);
					}
					//kgj add  是提交订单页面
					if($(".inspersonDetail").length >= 1) {
						setCuponPrice();
					} else {
						setPayCuponPrice();
						//$("#onlinePayAmountShow").text(onlinePayAmountShow);	
					}
				}
			}
			//确认或者取消的操作
			function confirmOrCancle(type) {
				if(type == 1) { //确认
					var checkedsSize = $("#coupon").find(":checkbox:checked").size();
					var radioSize = $("#coupon").find(":radio:checked").size();
					if(checkedsSize == 0 && radioSize == 0) {
						alert("请选择要使用的优惠信息");
						return;
					}
					$("#coupon").hide();
				} else if(type == -1) { //取消		  	
					$("#promotionAmount").text('-' + 0);
					$("#coupon").hide();
					$("#coupon").find(":checkbox").prop("checked", false);
					$("#coupon").find(":radio").prop("checked", false);
					$("#promotiontype").val(0);
					//kgj add  是提交订单页面
					if($(".inspersonDetail").length >= 1) {
						setCuponPrice();
					} else {
						setPayCuponPrice();
						//$("#onlinePayAmountShow").text(parseFloat($("#onlinePayAmount").val()).toFixed(2));
					}
				} else if(type == 2) {
					$("#coupon").show();
				}
			}
			//给td添加绑定事件
			//$(function(){    
			//$(".dp_daypicker").on('click','td',function(){
			//var num=$(this).text();
			//alert("come in .....");
			//$("#checkoutday").val('2013-12-5');
			// });
			//});
		</script>
	</head>

	<body>

		<!--header-->
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
			<span style="text-align: left;font-size: 30px;color: #009900;font-weight: bolder;width: 80%;position: absolute;">黄虫短租</span>

			<div class='head_cnt relave'>
				<span class='search'></span>
				<ul class="nav_R asote nav_right">

					
					<li>
						<a rel="nofollow" href="javascript:publish(0)" class="room-btn f16 t-center" _mayi_rp="webaround|activity|freepublish">免费发布房源</a>
						<!--   
               <a href="javascript:void(0)"rel="nofollow" nexturl="/room/publish/basicinfo" class="loginatother room-btn f16 t-center"  target="_self" _mayi_rp="webaround|activity|freepublish">免费发布房源</a>
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
				<p>如有疑问，请联系黄虫短租客服400-028-6868</p>
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
				<p class="text_para">扫码后，通过分享活动邀请好友注册黄虫短租，双方均可获得100元住宿基金！</p>

			</div>
		</div>
		<input type="hidden" name="subdomain" id="subdomain" value="" />
		<input type="hidden" name="mainsite" id="mainsite" value="" />
		<input type="hidden" name="ctx" id="ctx" value="" />
		<input type="hidden" name="ctx1" id="ctx1" value="//staticnew.mayi.com" />
		<input type="hidden" name="uid" id="uid" value="0" />
		<input type="hidden" name="loginurl" id="loginurl" value="none" />
		<input type="hidden" name="head_userName" id="head_userName" value="">
		<script type='text/javascript' src='//webchat.7moor.com/javascripts/7moorInit.js?accessId=73859f20-f357-11e6-b43e-3b18b16942dc&autoShow=false' async='async'></script>
		<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<html xmlns:wb="http://open.weibo.com/wb">

		<head>
			<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/im/css/IM.css?v=1" />
		</head>

		<body>
		</body>

		</html> -->
		
		<!--header-->

		<!-- 黄虫统计所需 隐藏域 -->
		<input type="hidden" name="my_p_t" id="my_p_t" value='bookorder' />
		<input type="hidden" name="my_b_s" id="my_b_s" value="1" />
		<input type="hidden" name="my_r_id" id="my_r_id" value='852883945' />
		<input type="hidden" name="my_p_y" id="my_p_y" value='xiamen' />
		<!-- 黄虫统计所需 隐藏域 -->
		<!-- Content -->
		<input type="hidden" id="specialdiscount" value="" />
		<input type="hidden" id="tenantid" value="" />
		<span id="luid" value="852883945"></span>
		<input type="hidden" id="onlinePayAmount" name="onlinePayAmount" value="0" />
		<input type="hidden" id="hasStock" value="" />
		<input type="hidden" id="tenantValidMobile" value="0" />
		<input type="hidden" id="validingMobile" mobile="0" validResult="-1" />
		<input type="hidden" id="userid" value="0" />
		<input type="hidden" id="platform" value="10" />
		<form id="orderForm" name="orderForm" method="post" style="position:relative">

			<input type="hidden" name="comefrom" value="">
			<input type="hidden" id="mobileno" name="mobileno" value="" />
			<input type="hidden" id="" name="" value="0" />
			<!-- 促销类型需要传到后台 -->
			<input type="hidden" id="promotiontype" name="promotiontype" value="0" />
			<input type="hidden" id="totalPrice" name="totalPrice" value="0" />
			<input type="hidden" id="onlineAmount" name="onlineAmount" value="0" />
			<input type="hidden" id="lodgeunitState" name="lodgeunitState" value="4" />
			<input type="hidden" id="visitormobile" name="visitormobile" value="" />
			<!--保险增加-->
			<input type="hidden" id="policyholdername" name="policyholdername" value="" autocomplete="off" />
			<input type="hidden" id="policyholderidcard" name="policyholderidcard" value="" autocomplete="off" />
			<input type="hidden" id="insurancePeopleNum" name="insurancePeopleNum" value="0" autocomplete='off' />
			<input type="hidden" id="dayNum" name="dayNum" value="0" />
			<input type="hidden" id="insuranceInputIds" name="insuranceInputIds" value="" autocomplete='off' />
			<input type="hidden" id="orderroomprice" name="orderroomprice" value="0" autocomplete='off' />
			<input type="hidden" id="ctx" name="ctx" value="" />
			<!-- 优惠券/代金券选择 -->
			<input type="hidden" id="coupon_checkbox" name="coupon_checkbox" value="" />
			<input type="hidden" id="coupon_radio" name="coupon_radio" value="" />
			<input type="hidden" id="promotionAmount" name="promotionAmount" value="" />

			<input type="hidden" id="cityid" name="cityid" value="76" />
			<input type="hidden" id="isInsurance" name="isInsurance" value="0" />
			<input type="hidden" id="insuranceJson" name="insuranceJson" value="0" />
			<input type="hidden" id="checkinnum" name="checkinnum" value="0" />
			<input type="hidden" id="deposit" name="deposit" value="" />
			<!-- 开发票相关-->
			<input type="hidden" id="isInvoice" name="isInvoice" value="no" />
			<input type="hidden" id="inoviceTaxPoint" name="inoviceTaxPoint" value="0.05" />
			<input type="hidden" id="inoviceExpressFee" name="inoviceExpressFee" value="7" />
			<!--内容部分开始-->
			<!--流程图-->
			<div class='one_workflow'>
				<div class='workflow relave'>
					<div class='progress progress_0'></div>
					<b class='workflow2'>提交订单</b>
					<b class='workflow3'>支付订金</b>
					<!--<b class='workflow3'>房东确认</b>
					<b class='workflow4'>预订成功</b>-->
					<span class='workflow1_2'><a href="javascript:;" class='a_after'>1</a></span>
					<span class='workflow1_3'><a href="javascript:;">2</a></span>
					<!--<span class='workflow1_3'><a href="javascript:;">3</a></span>
					<span class='workflow1_4'><a href="javascript:;" class='duigo'></a></span>-->

				</div>
			</div>
			<div class='content clearfloat'>
				<div class='fl content_left'>
					<div class='cnt'>

						<div class='cnt1 clearfloat'>
							<!--预订信息-->
							<h2>预订信息</h2>
							<div class='fl bt-border'>
							<dl class='cnt1_dl clearfloat mt15'>
							<dt class='fl'>订单编号：</dt>
							<dd class='fl roomer_cnt'>
							<label style="font-size: 15px;">${orderId}</label>
							</dd>
							</dl>
							<dl class='cnt1_dl clearfloat mt15'>
							<dt class='fl'>民宿标题：</dt>
							<dd class='fl roomer_cnt'>
							<label style="font-size: 15px;">${accomTitle}</label>
							</dd>
							</dl>
								<dl class='cnt1_dl clearfloat mt15'>
									<dt class='fl'>预订日期</dt>
									<dd class='fl roomer_cnt'><input type="text" readonly="readonly" id="checkinday" class='date1' value='' autocomplete="off"/><span id="checkinOfWeek"></span>&nbsp;&nbsp;至&nbsp;&nbsp;<input type="text" readonly="readonly" id="checkoutday" class='date2' value='' autocomplete="off" /><span id="checkoutOfWeek"></span>&nbsp;&nbsp;&nbsp;&nbsp;共<span id='nights'>${requestScope.nights}</span>晚
									</dd>
								</dl>
								<!--预订套数-->
								<!--预订套数-->
								<dl class="cnt1_dl clearfloat mt15">
									<dt class="fl">预订套数</dt>
									<dd class="fl relave">
										<!--<div class="dianj2 fl"><i id="roomNum">1</i></div>-->
										<div class="select_parent w92 mar_r_6 fl">
											<select class="select_css w92" autocomplete="off" id="roomNum">
												<option value="1">1套</option>
											</select>
										</div>
									</dd>
								</dl>
								<!-- 联系人手机号 -->
								
								<!--是否开发票-->
								<input type="hidden" id="isOnlineInvoice" name="isOnlineInvoice" value="2" />
							</div>
						</div>
					</div>

					<!--优惠券-->
					<div id="user_coupon" class='cnt1 cnt2 clearfloat' style="display: none">
						<h2>优惠</h2>
						<div class='fl bt-border'>
							<dl class='cnt1_dl clearfloat'>
								<dt class='fl'>优惠券</dt>
								<dd class='fl relave people_in people_in1 IE_border'>
									<div class='dianj4' style='background:#fff;'><i></i><span class='asote dingw'></span></div>
									<ul class='people havDai' style='display:none'>
									</ul>
								</dd>
								<b class='fl room_pice'><span class="couponcun"></span>优惠券可用</b>
							</dl>
						</div>
					</div>

					<!--start-->
					<div id="insuranceDiv" class='cnt1 cnt2 cnt3 cnt4 clearfloat'>
						<h2 class='need'> 入住人信息     
	          		<div class="insurance relave">
	          			
	          			<div class="insurance_layer">
	          				<dl class="limit_dl">
	          					<dt>保障范围及保额：</dt>
	          					<dd>1. 住客人身意外伤害，保额120000元</dd>
	          					<dd>2. 住客人身意外医疗，保额10000元 </dd>
	          					<dd>3. 意外造成房屋损坏，保额40000元</dd>
	          					<dd>4. 意外造成装修、家电、家具损坏，共享保额10000元</dd>
	          				</dl>
	                    <p class="limit_remind">详情见<a href="/insurance?assurer=2" target="_blank">《保险条款》</a></p>
	                </div>
	          		</div>
	          	</h2>
						<!--意外险部分-->
						<div class='fl cle bt-border'>
							<!--入住人数-->
							<dl class="cnt1_dl clearfloat mt15">
								<dt class="fl">入住人数</dt>
								<dd class="fl relave people_in">
									<input type="hidden" id="maxguest" value="4" />
									<div class="select_parent w92 mar_r_6 fl">
										<select class="select_css w92 rens" autocomplete="off">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>

								</dd>
							</dl>
							
							<!--门票-->
							<!--特色服务-->
							<div class='relave accident3' style='display:none'>

								<p class='insurance'><label class='insurance_label'><input type="checkbox" autocomplete='off'/>房东提供特色服务</label><span class='insurance_btn'>&nbsp;&nbsp;选择您需要的服务，费用由您入住时支付给房东，黄虫不收取此部分费用</span><i>&nbsp;&nbsp;租车&nbsp;&nbsp;早餐&nbsp;&nbsp;机场接送...</i></p>

								<ul class='mingxi clearfloat optional' id='mingxi'>

									<!--class=li_click为房客选中特色服务时li的样式-->
									<li>早餐&nbsp;<span>20</span>/位</li>
									<li>机场接送&nbsp;<span>20</span>元</li>
									<li>车站接送&nbsp;<span>200</span>元</li>
									<li>租车&nbsp;<span>300</span>元</li>
									<li>自行车&nbsp;<span>200</span>元</li>
									<li>本地导游&nbsp;<span>300</span>元</li>
									<li>婴儿车&nbsp;免费</li>
									<li>婴儿床&nbsp;免费</li>
							</div>
						</div>
					</div>
					<!--end-->

					
					<div class='cnt_foot' style="position:relative;">
						<!--温馨提示暂时无特色服务相关的费用 ，以及您选定房东提供的特色服务费用 -->
						<div class='order_sub_parent'>
							<a class='submit fl' id="submitOrder">提交订单</a>
						</div>
					</div>

				</div>
				<!--右侧开始-->
				<div class="fr content_right  pin" id="pin1">
					<div class='right_cnt'>
						<img src="${pageContext.request.contextPath}/../img/${accomId}/1.png" width="338" height="228" style="vertical-align: middle" />
						<!--右侧房间开始-->
						<div class='room_intro relave clearfloat'>
							<strong>${accomTitle}</strong>
							<!-- <span>厦门思明区黄厝社</span> -->
						</div>
						
						<div class='time_true'>
							<p><span id="checkindayr"></span><span id="checkinOfWeekr"></span>&nbsp;至&nbsp;<span id="checkoutdayr"></span><span id="checkoutOfWeekr"></span></p>
							<p>共<span id="totlenight3"></span>晚&nbsp;&nbsp;<span id="roomNumr"></span>套<span id="guestnum"></span></p>
						</div>
						<!--右侧表格开始-->
						<table class='tab_fr'>
							<tr class='room_tr'>
								<td>
									<div style='width:178px;'>房费</div>
								</td>
								<td class='relave bon tab_tex'>
									<div style='width:130px;'>¥<i id="showtotalprice2"></i>
										<p id="nightShowPrice2" style="display:inline-block;font-size:14px; margin-left:8px;line-height:45px;text-decoration: line-through;color:#777" class="f16"></p><span class='tab_tan tab_tan2'></span>
										<!--房费弹出层-->
										<%-- <div class='asote price_par price_par2' style='display:none;'>
											<p class="sanj sanj2 asote"></p>
											<table class='price price_fixed'>
												<tr class='relave'>
													<th width=92>
														<div style='width:92px;'>日期</div>
													</th>
													<th width=126>
														<div style='width:126px;'>单价</div>
													</th>
													<th width=43>
														<div style='width:43px;'>数量</div>
													</th>
													<th width=75 class='bon'>
														<div style='width:75px;'>小计</div>
													</th>
												</tr>
											</table>
											<div class='tab_par'>
												<table class='price' id='righttable'>
												</table>
											</div>
											<div class='tfoot relave'>
												<div class='fr_fu'>共<b id='totlenight2'></b>晚&nbsp;合计¥<b id='totleprice2'>${requestScope.totalPrice}</b></div>
												<ul class='fl_fu' id='rlandlordrule'></ul>
											</div>
										</div> --%>
									</div>
								</td>
							</tr>
							<tr id="tr_coupon">
								<td>
									<div style='width:174px;'><span id="ctip">优惠券</span>&nbsp;</div>
								</td>
								<td class='relave bon tab_ipt'>
									<div style='width:98px;margin-left:3px;'><i class='jianmq'></i>
									</div>
								</td>
							</tr>
							

						</table>

						<!--支付方式-->
						<div class='on-line'>
							<div class='online_1 relave clearfloat'>
								<div class="clearfloat"><b class='color font'>订单总额</b>¥<i class='font2' id="actuallytotalprice"></i></div>
								<div class="clearfloat invoiceTax" style="display: none;"><b class="color font">手续费</b>¥<i class="font2" id="invoiceTax">0</i></div>
								<div class="clearfloat invoicepostage" style="display: none;"><b class="color font">配送服务费</b>¥<i class="font2" id="invoicepostage">0</i></div>
								<div class="clearfloat" style="display: none;"><b class="color font">押金</b>¥<i class="font2" id="depositprice">0</i></div>
								<div class="clearfloat relave">
									<b class='color font3'>线上支付到黄虫</b>
									<i style='float:left;line-height:35px;margin-right:4px;font-size:24px;color:#ff5d51;'>¥</i>
									<i class='font4' id="onlinePayAmountShow" style='color:#ff5d51'></i>
									<span class='asote dingw4'></span>
								</div>
								<div class='asote online_asote'>
									<p class="sanj sanj3 asote"></p>
									预付比例由房东设置，当前房间的预付比例为支付总房费的<i id="payRuleRate"></i>%
								</div>
							</div>

						</div>

					</div>
					
					<p class="f14 c999">房屋描述失真、到店无房、房东恶意涨价，全部退房费并补偿</p>
				</div>
			</div>
		</form>
		<!--左侧保单信息弹层-->
		<div class="details_link_details details_link_details1" style="display: none;">
			<div class="surveYY"></div>
			<div class="offmax1" id="offmax1">
				<div class="dp_header">保单信息</div>
				<div class="safe_content">
					<div class="table_box">
						<div class="table_head">阳光财产保险股份有限公司黄虫短租住宿旅客综合意外伤害保险</div>
						<ul>
							<li><b>保险责任</b><b>保险金额（单位：元）</b></li>
							<li><b>住宿旅客意外身故</b><b>6万</b></li>
							<li><b>住宿旅客意外残疾</b><b>6万</b></li>
							<li><b>住宿旅客意外伤害医疗</b><b>0.6万</b></li>
						</ul>
						<p>1.每一被保险人最高限2份；</p>
						<p>2.70周岁以上及16周岁以下的被保险人限1份；</p>
						<p>3.根据国家保险监督管理委员会相关规定，未成年人累计身故保险金额最高位人民币10万元整</p>
					</div>
					<h3>【保险对象】</h3>
					<p>凡身体健康，在黄虫短租租赁房屋，正式登记住宿并成功投保的旅客，可作为本保险合同的被保险人。</p>
					<h3>【保险期间】</h3>
					<p>在黄虫短租网订单中约定的入住日12时起至约定的退房日12点止（每24小时为1天，不足24小时以24小时计算）</p>
					<h3>【保险责任】</h3>
					<p>（一）“住宿宾馆内意外伤害”保障</p>
					<p>1、“住宿宾馆内意外伤害”<span class="bold">身故</span>保险金给付</p>
					<p>在保险期间内，被保险人在本保险合同约定的住宿宾馆内发生意外伤害事故，并自该事故发生之日起180日内以该事故为直接且单独原因导致身故的，保险人按保险合同所载的“住宿宾馆内意外伤害”保险金额给付“住宿宾馆内意外伤害”身故保险金，对该被保险人保险责任终止。</p>
					<p>被保险人因在本保险合同约定的住宿宾馆内遭受意外伤害事故且自该事故发生日起下落不明，后经人民法院宣告死亡的，保险人按保险合同所载的“住宿宾馆内意外伤害”保险金额给付“住宿宾馆内意外伤害”身故保险金。但若被保险人被宣告死亡后生还的，保险金受领人应于知道或应当知道被保险人生还后30日内退还保险人给付的身故保险金。</p>
					<p>如果本保险的被保险人于身故前曾领取“住宿宾馆内意外伤害”残疾保险金，则其“住宿宾馆内意外伤害”身故保险金应扣除已给付的“住宿宾馆内意外伤害”残疾保险金。</p>
					<p>2、“住宿宾馆内意外伤害”<span class="bold">残疾</span>保险金给付</p>
					<p>在保险期间内，被保险人在本保险合同约定的住宿宾馆内发生意外伤害事故，并自该事故发生之日起180日内以该事故为直接且单独原因造成本保险合同所附《人身保险伤残评定标准》（简称“《标准》”）所列残疾之一的，保险人按该《标准》所列给付比例乘以本保险合同所载的“住宿宾馆内意外伤害”保险金额给付“住宿宾馆内意外伤害”残疾保险金。如到第180日治疗仍未结束的，按第180日的身体情况进行残疾鉴定，并据此给付“住宿宾馆内意外伤害”残疾保险金。</p>
					<p>（1）被保险人因同一意外伤害事故造成两处或两处以上伤残时，应首先根据《标准》对各处伤残程度分别进行评定，如果几处伤残等级不同，以最重的伤残等级作为最终的评定结论并据此给付残疾保险金；如果两处或两处以上伤残等级相同，伤残等级在原评定基础上最多晋升一级，最高晋升至第一级。同一部位和性质的伤残，不应采用《标准》条文两条以上或者同一条文两次以上进行评定。</p>
					<p>（2）被保险人如在本次意外伤害事故之前已有残疾，保险人按合并后的残疾程度在《标准》中所对应的给付比例给付残疾保险金，但应扣除原有残疾程度在《标准》中所对应的残疾保险金。</p>
					<p>（二）“住宿宾馆内意外伤害<span class="bold">医疗</span>”保障</p>
					<p>1、在保险期间内，被保险人在本保险合同约定的住宿宾馆内发生意外伤害事故，须在中华人民共和国卫生行政部门评定的二级以上（含二级）医院诊疗而实际支出的，符合保险单签发地政府社会医疗保险（指城镇职工基本医疗保险、城镇居民基本医疗保险、新型农村合作医疗保险、公务员医疗补助、城乡医疗救助等非商业性质保险，下同）管理规定的医疗费用，保险人按照本保险合同约定在意外伤害医疗保险金额内给付意外伤害医疗保险金。</p>
					<p>被保险人因保险事故须到医院进行合理且必需的治疗，在本保险合同载明的保险期间内，<span class="bold">保险人以该次保险事故发生之日起180日为限，对超出部分不承担给付“住宿宾馆内意外伤害医疗”保险金责任。</span>若至本保险合同终止日治疗仍未结束的，保险人继续承担给付保险金责任，最长延续至本保险合同终止日起第30日且不超过该次保险事故发生之日起第180日；累计保险金给付不超过“住宿宾馆内意外伤害医疗”保险金额。</p>
					<p>2、本保险合同的“住宿宾馆内意外伤害医疗”保险责任遵循医疗费用补偿原则。保险人给付的“住宿宾馆内意外伤害医疗”保险金与被保险人从其所参加的社会医疗保险、其它保险计划、或从住宿宾馆、第三者责任方、社会福利机构等任何其他途径取得医疗费用补偿总额，以被保险人实际支出的医疗费用金额为限。</p>
					<h3>【责任免除】</h3>
					<p class="bold">第一条</p>
					<p class="bold">被保险人未按《旅馆业治安管理办法》及保险单签发地公安部门旅馆业住宿登记管理相关办法，依法登记身份证明信息，发生意外伤害事故的，保险人不承担给付保险金责任。</p>
					<p class="bold">第二条</p>
					<p class="bold">因下列情形之一造成本保险合同的被保险人身故、残疾或支出医疗费用的，保险人不承担给付保险金责任：</p>
					<p class="bold">（一）投保人的故意行为；</p>
					<p class="bold">（二）被保险人自致伤害或自杀，但被保险人自杀时为无民事行为能力人的除外；</p>
					<p class="bold">（三）因被保险人的挑衅或故意行为而导致的殴斗、被袭击或被谋杀；</p>
					<p class="bold">（四）被保险人从事违法、故意犯罪活动或抗拒依法采取的刑事强制措施而导致的伤害；</p>
					<p class="bold">（五）被保险人未遵医嘱，私自服用、涂用、注射药物；</p>
					<p class="bold">（六）被保险人妊娠（含宫外孕）、流产、分娩（含剖腹产）、不孕不育症（包括人工受孕、试管婴儿等）、避孕及节育手术或由妊娠、分娩、流产、节育所导致的任何并发症；</p>
					<p class="bold">（七）被保险人患精神类疾病如精神分裂症、抑郁症、厌食症、失眠症；被保险人患先天性疾病、遗传性疾病、先天性畸形、变形或染色体异常；</p>
					<p class="bold">（八）被保险人从事潜水、滑水、滑雪、风浪板、蹦极、跳伞、水上摩托艇、滑翔翼、攀岩运动、探险活动、拳击、柔道、跆拳道、空手道、武术比赛、摔跤比赛、特技表演、马术、赛马、各种车辆表演、赛车运动、驾驶卡丁车等高风险运动；</p>
					<p class="bold">（九）被保险人投保前已有残疾的康复或治疗；修复、安装及购买残疾用具（如轮椅、假肢、助听器、假眼、假牙等）；</p>
					<p class="bold">（十）被保险人因意外伤害而支付的交通费、食宿费、生活补助费、误工补贴费、护理费；</p>
					<p class="bold">（十一）本保险合同签发地的社会医疗保险规定的不予支付的情形，或不符合本保险合同签发地的社会医疗保险药品目录、诊疗项目目录以及服务设施范围和支付标准规定的医疗费用；</p>
					<p class="bold">（十二）被保险人洗牙、洁齿、验光、心理咨询、器官移植；</p>
					<p class="bold">（十三）被保险人因意外伤害事故以外的原因失踪而被法院宣告死亡的；</p>
					<p class="bold">（十四）被保险人因任何疾病、食物/药物过敏、食物中毒、中暑、整容手术、高原反应、猝死、椎间盘突出症（包括椎间盘膨出、椎间盘突出、椎间盘脱出、游离型椎间盘等类型）、医疗事故或其他医疗导致的伤害；</p>
					<p class="bold">（十五）战争、军事行动、暴乱或武装叛乱；任何生物、化学、原子能武器，原子能或核能装置所造成的爆炸、灼伤、污染或辐射。</p>
					<p class="bold">第三条</p>
					<p class="bold">被保险人在下列期间遭受伤害导致身故、残疾或支出医疗费用的，保险人也不承担给付保险金责任：</p>
					<p class="bold">（一）被保险人依法被拘禁或服刑期间；</p>
					<p class="bold">（二）被保险人醉酒或受酒精、毒品、管制药物的影响期间；</p>
					<p class="bold">（三）被保险人患有艾滋病或感染艾滋病病毒期间；</p>
					<p class="bold">（四）被保险人酒后驾驶、无照驾驶及驾驶无有效行驶证的机动交通工具期间。</p>
					<p class="bold">若由于本保险合同中责任免除的情形导致的被保险人死亡，保险人将退还未满期净保险费。</p>
					<h3>【保险金的申请与给付】</h3>
					<p>保险金申请人向保险人申请给付保险金时，应提交作为索赔依据的证明和材料。保险金申请人因特殊原因不能提供以下材料的，应提供其它合法有效的材料。若保险金申请人委托他人申请的，还应提供授权委托书原件、委托人和受托人的身份证明等相关证明文件。<span class="bold">保险金申请人未能提供有关材料，导致保险人无法核实该申请的真实性的，保险人对无法核实部分不承担给付保险金的责任。</span></p>
					<p>（一）被保险人身故，由身故保险金受益人作为申请人填写保险金给付申请书，并凭下列证明和资料向保险人申请给付保险金：</p>
					<p>1、保险单正本原件或其它保险凭证原件；</p>
					<p>2、被保险人的住宿证明材料；</p>
					<p>3、受益人户籍证明或身份证明；</p>
					<p>4、公安等部门出具的意外伤害事故证明；</p>
					<p>5、公安部门或卫生行政部门批准的二级以上（含二级）医院或保险人认可的医疗机构出具的被保险人死亡证明；如被保险人因意外事故宣告死亡，须提供人民法院出具的宣告死亡判决书；</p>
					<p>6、被保险人遗体殡葬证明；</p>
					<p>7、被保险人户籍注销证明；</p>
					<p>8、保险金申请人所能提供的其他与确认意外伤害事故的性质、原因等有关的证明和资料。</p>
					<p>（二）被保险人残疾的，保险金申请人应填写保险金给付申请书，并凭下列证明和资料向保险人申请给付保险金：</p>
					<p>1、保险单正本原件或其它保险凭证原件；</p>
					<p>2、被保险人住宿证明材料；</p>
					<p>3、受益人户籍证明或身份证明；</p>
					<p>4、公安等部门出具的意外伤害事故证明；</p>
					<p>5、卫生行政部门批准的二级以上（含二级）有鉴定资质的医疗机构或保险人认可的医疗机构或司法鉴定机构出具的残疾鉴定书；</p>
					<p>6、保险金申请人所能提供的其他与确认意外伤害事故的性质、原因、伤害程度等有关的证明和资料。</p>
					<p>（三）被保险人领取意外伤害医疗保险金的，由被保险人作为申请人，填写保险金给付申请书，并凭下列证明和资料向保险人申请给付保险金：</p>
					<p>1、保险单正本原件或其它保险凭证原件；</p>
					<p>2、被保险人住宿证明材料；</p>
					<p>3、被保险人的户籍证明或者身份证明；</p>
					<p>4、卫生行政部门批准的二级以上（含二级）医院出具医疗费用收据原件、出院证明、住院费用清单、病历；</p>
					<p>5、保险金申请人所能提供的其他与确认意外伤害事故的性质、原因、伤害程度等有关的证明和资料。</p>
					<p>被保险人支出医疗费用并提出索赔申请时，应向保险人提交医疗费用收据原件。</p>
					<p>如被保险人在社会医疗保险经办机构、其他保险人或其它单位已经获得部分医疗费用赔偿，医疗费用收据原件已被赔付或报销单位留存，被保险人在提出索赔申请时，应向保险人提交医疗费用收据财务分割单或在医疗费用收据复印件上注明已赔付金额，并加盖赔付单位的财务章。</p>
					<h3>【注意事项】</h3>
					<p class="bold">1、本条款摘要未尽事宜详见《阳光财产保险股份有限公司住宿旅客综合意外伤害保险条款（2014版)》</p>
					<p class="bold">2、保单查询方式：拨打全国统一客服电话95510或登录网站查询
						<a href="http://query.sinosig.com/testfwl/fwebs/Prpcmain/search_fwq.jsp">http://query.sinosig.com/testfwl/fwebs/Prpcmain/search_fwq.jsp</a>查询</p>
					<h1>报案电话95510</h1>
					<h2 class="red">投保前提示</h2>
					<p class="red">被保险人本人或监护人均认真阅读本保险说明,了解该产品投保范围,保障内容并同意投保。被保险人本人或监护人确认对投保险种条款尤其是对保险责任条款，免除责任条款，合同解约条款，特别约定，指定受益人进行了认真阅读，理解并同意遵守，所填写资料真实正确。详见<span class="bold">《阳光财产保险股份有限公司住宿旅客综合意外伤害保险条款（2014版)》</span> 若保险合同成立生效，投保时所填写的资料将作为保险合同的一部分，如有隐瞒或不实告知，将承担由此带来的法律责任。
					</p>
					<p></p>
					<p></p>
					<p></p>
				</div>
				<a class="makeSure1" href="javascript:closeDiv()">关闭</a>
			</div>
		</div>

		<!--门票详细说明弹层-->
		<div class="ticket_link_details details_link_details2" style="display: none;">
			<div class="surveYY"></div>
			<div class="offmax1 offmax2" id="offmax1">
				<div class="dp_header">门票说明</div>
				<div class="safe_content safe_content2">
					<h3>发放时间</h3>
					<p>在您入住黄虫短租房源前一天发放；</p>
					<h3>入园方式</h3>
					<p>请您凭短信，至景区售票处换票进入；</p>
					<h3>包含项目</h3>
					<p>仅门票一张。请注意选择出游日期，门票当天有效，过期作废。</p>
					<h3>预订说明</h3>
					<p>为保证取票、入园顺利，预订时请务必填写真实姓名、手机号码等信息。</p>
					<h3>发票说明</h3>
					<p>暂不提供发票，敬请谅解。</p>
					<h3>退改规则</h3>
					<p>入住日前一天12:00前取消预订请登录黄虫短租修改；</p>
					<p>入住日前一天12:00后不支持退改门票，敬请谅解。</p>
					<h3>其它说明</h3>
					<p>房源预订咨询黄虫短租：400-028-6868</p>
					<p>景点门票咨询同程旅游：4007-777-777</p>
				</div>
				<a class="makeSure2" href="javascript:closeDiv()">关闭</a>
			</div>
		</div>
		<!-- 芝麻信用弹窗 -->
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
				<a class="green_button shouquan" href="javascript:void(0);" target="_self" id="id_test">立即授权</a>
			</div>
		</div>
		<!--footer-->
		<!--底部统计加登录-->
		<div class="foot index-foot">
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
		<!--公共尾部结束-->
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
				$(".email").show();
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
		<!-- footer end -->
		<!--取消确定按钮弹出层-->
		<div id='layer_rz'>
			<div class='ruzT_mark'></div>
			<div class='ruzT'>
				<img src="https://staticnew.mayi.com/resourcesWeb/v201510/images/btn_pc_close1.png" class="layer_close" id="vf_layer_close">
				<!--<h2>删除</h2>-->
				<p>确定删除该入住人吗？</p>
				<div class='btn_T'>
					<input type="button" value='取消' class='cancel' />
					<input type="button" value='确定' class='sure' />
				</div>
			</div>
		</div>

		<!--有未保存入住人保险的提示-->
		<input type="hidden" id="iseditperson" value="0">
		<div id='layer_rz_notsave'>
			<div class='ruzT_mark'></div>
			<div class='ruzT'>
				<img src="https://staticnew.mayi.com/resourcesWeb/v201510/images/btn_pc_close1.png" class="layer_close" id="vfsave_layer_close">
				<!--<h2>删除</h2>-->
				<p>您有尚未保存的入住人信息</p>
				<div class='btn_T'>
					<input type="button" value='放弃保存' class='cancel' />
					<input type="button" value='继续编辑' class='sure' />
				</div>
			</div>
		</div>
		<!-- 绑定  -->
		<div id="valid_success_bangding" class="alert-box">
			<div class="alert-title" style="text-align:center;">
				验证完成
				<a class="alert-close" id="valid_success_bangding_close" href="javascript:void(0);"></a>
			</div>
			<div class="alert-con">
				<dl class="proving">
					<dt class="succeed"></dt>
					<dd>
						<p><span>恭喜验证成功！</span></p>
						<p>通过绑定以后可通过此手机号码登录查看订单信息</p>
						<!--
                    <p><input id="nobangding" class="checking-btn large-btn" type="button" name="nobangding" value="以后在说"/> 
                       <input id="bangding" class="checking-btn large-btn" type="button" onclick="bangding();" name="bangding" value="点击绑定"/></p>
                       -->
						<div class="submit-wrap">
							<a href="javascript:void(0);" rel="nofollow" class="submit" onclick="bangding();">点击绑定</a>
							<a href="javascript:void(0);" rel="nofollow" class="laterhandle">以后再说</a>
						</div>

					</dd>
				</dl>
			</div>
		</div>
		<div id="valid_success" class="alert-box">
			<div class="alert-title" style="text-align:center;">
				验证完成
				<a class="alert-close" id="valid_success_close" rel="nofollow" href="javascript:void(0);"></a>
			</div>
			<div class="alert-con">
				<dl class="proving" style="padding-left:140px;">
					<dt class="succeed"></dt>
					<dd>
						<p><span style="margin-top:20px;line-height:41px;">恭喜验证成功！</span></p>
					</dd>
				</dl>
			</div>
		</div>
		<!--商旅开发票弹层-->
		<div class="invoice_link">
			<div class="surveYY"></div>
			<div class="offmax1" id="offmax2">
				<div class="b_fff pb70">
					<div class="invoice_dp_header">开票须知</div>
					<div class="invoice_content">
						<strong>1、线上开具发票的类型</strong>
						<p>目前黄虫支持线上开具增值税纸质普通发票，最常用发票形式，不能抵扣进项税额，供各种纳税人企业使用。</p>
						<strong>2、线上开票时长以及发票配送范围</strong>
						<p>我们将在您入住完成后15个自然日内，完成发票开具、快递寄出。快递运输时长您可参考网购的收件时长。快递配送范围支持中国大陆地区，暂不支持港澳台以及海外。</p>
						<strong>3、在线开具发票的额外费用</strong>
						<p>若您选择在线开具发票，每笔订单您需额外支付7元的配送服务费以及在线实际支付房费金额5%的手续费。这2项额外费用会在您支付房费时一并收取。</p>
						<strong>4、线上开票金额的计算</strong>
						<p>开票金额=在线实际支付的房费+配送服务费+手续费。押金、保险以及优惠券抵扣的金额不开具发票。</p>
						<strong>5、若订单退款，配送服务费和手续费的退还说明</strong>
						<p class="pl26">一、若订单全额退款，则配送服务费和手续费会随同订单金额一起退回原支付账户，并取消开票。</p>
						<p class="pl26">二、若订单部分退款，则已收取的配送服务费和手续费不予退还，黄虫会继续为此订单开具发票，开票金额=退款后实际支付的房费+配送服务费+手续费。</p>
					</div>
				</div>
				<a class="invoice_close" href="javascript:closeDiv()"></a>
			</div>
		</div>
		<!--芝麻满600分，但是不能免押金 说明弹窗-->
		<div class="zm_no_why" id="zm_no_why">
			<div class="all_1"></div>
			<div class="zm_no_why_info">
				<img src="//staticnew.mayi.com/resourcesWeb/v201510/images/btn_pc_close1.png" alt="" class="zm_btn_close" id="zm_btn_close">
				<div class="info_title">
					暂不满足信用免押金入住条件
				</div>
				<div class="info_content">
					如果信用分已满600，但您依然无法享受免押金特权，那可能是因为您此前在芝麻信用的各类合作伙伴（如金融机构、电商、酒店等）中存在违约行为，我们对此感到非常抱歉，您可以选择线上支付押金预订房源。
				</div>
			</div>
		</div>
		<!-- 黄虫点击 -->
		<script src="//staticnew.mayi.com/duanzu/resources/common/js/mayi.js"></script>
		<!-- 黄虫分析 -->
		<script src="//staticnew.mayi.com/resources/js/mayi/mayi_rp.js"></script>

		<!-- 百度统计 -->
		<script type="text/javascript">
			var _hmt = _hmt || [];
			(function() {
				var hm = document.createElement("script");
				hm.src = "https://hm.baidu.com/hm.js?0294bbb72b1c6a6b342da076397c9af2";
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(hm, s);
			})();
		</script>

		<!--百度推送代码  -->
		<script>
			var bd_push = document.getElementById("baidu_push");
			if(bd_push != null) {
				(function() {
					var bp = document.createElement('script');
					var curProtocol = window.location.protocol.split(':')[0];
					if(curProtocol === 'https') {
						bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
					} else {
						bp.src = 'http://push.zhanzhang.baidu.com/push.js';
					}
					var s = document.getElementsByTagName("script")[0];
					s.parentNode.insertBefore(bp, s);
				})();
			}
		</script>

		<!--GA 统计所需js 新  2018-01-25-->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-63543541-1"></script>
		<script>
			window.dataLayer = window.dataLayer || [];

			function gtag() {
				dataLayer.push(arguments);
			}
			gtag('js', new Date());

			gtag('config', 'UA-63543541-1');
		</script>

		<!--ganji start-->
		<script type="text/javascript">
			var bsource = document.getElementById("channel_ganji");
			if(bsource != null) {}
		</script>
		<!--ganji end-->

		<!--360聚效推广的访客找回 -->
		
		<script type="text/javascript">
		$("#submitOrder").click(function(){
			
			var onlinePayAmountShow = $("#onlinePayAmountShow").html();
			
			location.href="bs.action?op=pay&onlinePayAmountShow="+onlinePayAmountShow+"&orderId=${orderId}&accomId=${accomId}";
			
		});
		
		
		
		
		</script>
	

	</body>

	</html>