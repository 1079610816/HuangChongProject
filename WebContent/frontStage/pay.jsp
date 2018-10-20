<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><html xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content=""/>
<meta name="description" content="" />
<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/order_public.css" rel="stylesheet">
<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/order.css" rel="stylesheet">
<link href="//staticnew.mayi.com/resourcesWeb/v201510/css/public_element.css" rel="stylesheet">
<link href="//staticnew.mayi.com/resourcesWeb/ordernew/css/order_money.css" rel="stylesheet">
<title>订单-支付订金</title>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/v201510/js/commom.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>

<script type="text/javascript" language="javascript">
//初始化订单详情页信息
		$(function(){
			var mayiuid = '870557712';
			if(mayiuid){
				$('.bank').show();
				var detialJson='{"showtotalprice":${requestScope.onlinePayAmountShow},"onlinePayAmount":${requestScope.onlinePayAmountShow},"payRuleRate":100,"promotionModel":{},"priceDetailModel":{"sum":26400,"showtotalPrice":264.0,"items":[{"date":"2018-10-18","originalPrice":26400,"price":26400,"priceShow":264.0,"type":10,"dayAmount":264.0,"weekNum":4}]},"haveStock":1,"firstPaying":1,"insuranceModel":{"id":5946300,"insuranceno":"","peoplenum":1,"daynum":1,"roomnum":1,"freeunitprice":23,"freeamount":23,"totalamount":23,"state":"0","paystate":"0","createtime":1539827487000,"bookorderid":857552220,"source":"1","freeamountYuan":0.23,"totalamountYuan":0.23,"policyholderstartdate":1539835200000,"policyholderenddate":1539921600000,"assurer":2},"ticketModel":{}}';
				initOrderPageInfo(detialJson);
			}else{
				$('.bank').hide();
			}
		});
		//初始化页面方法
		function initOrderPageInfo(detialJson){
		  detialJson=eval("("+detialJson+")");
		  $("#orderId").val(857552220);
		  $("#haveStock").val(detialJson.haveStock);
		  $("#firstPaying").val(detialJson.firstPaying);
		  $("#onlinePayAmount").val(detialJson.onlinePayAmount);
		  $("#showtotalpriceText").text(detialJson.showtotalprice);
		  $("#payRuleRate").text(detialJson.payRuleRate);
		  promotionModelJson=detialJson.promotionModel;
		  var userCouponEntityList=promotionModelJson.userCouponEntityList;
		  /**
		  if(promotionModelJson && promotionModelJson.type>0){
			  $("#promotionAmount").text(-promotionModelJson.promotionAmount);
			  $("#typeAlias").text(promotionModelJson.typeAlias);
			  $("#selectOnline").val(promotionModelJson.typeAlias);
			  
			  //初始化
			  if(detialJson.firstPaying){
				  $("#coupon").empty();
				  if(userCouponEntityList){
					  for(var i=0,length=userCouponEntityList.length;i<length;i++){
					    if(userCouponEntityList[i].show==1){
						  	var coupon='<label><input type="radio" name="coupon_radio" value="'+userCouponEntityList[i].id+'" amountShow="'+userCouponEntityList[i].amountShow+'"/>'+"满"+userCouponEntityList[i].useconditionShow+"减"+userCouponEntityList[i].amountShow+'<input type="hidden"  value="'+userCouponEntityList[i].id+','+userCouponEntityList[i].daypricerule+'"/></label>';
						  	$("#coupon").append(coupon);
					  	}
					  }
				  }
				  var accountEntityList=promotionModelJson.accountEntityList;
				  if(accountEntityList){
					  for(var i=0,length=accountEntityList.length;i<length;i++){
					  	var coupon='<label><input type="checkbox" name="coupon_checkbox" value="'+accountEntityList[i].id+'" amountShow="'+accountEntityList[i].amountShow+'"/>'+accountEntityList[i].amountShow+'代金券</label>';
					  	$("#coupon").append(coupon);
					  }
				  }
				  $("#coupon").append('<p id="couponConfirm" onclick="confirmOrCancle(1);">确认使用</p><p id="couponCancle" onclick="confirmOrCancle(-1);">取消使用</p>');			 
				  //完成选中
				  var type=promotionModelJson.type;
				  if(type==2){
				  	var userCouponEntityUsed=promotionModelJson.userCouponEntityUsed;
				  	$("#coupon").find(":radio[value="+userCouponEntityUsed.id+"]").prop("checked",true);
				  	$("#promotiontype").val(2);
				  	if(typeof(userCouponEntityUsed.daypricerule) != "undefined"&&userCouponEntityUsed.daypricerule==1){
				  		$("#tipSpan").text("满"+userCouponEntityUsed.useconditionShow+"减"+userCouponEntityUsed.amountShow);
				  		$("#warmTip").show();
				  	}else{
				  		$("#warmTip").hide();
				  	}
				  }else if(type==1){
				        $("#promotiontype").val(1);
				    	var accountEntityUsedList=promotionModelJson.accountEntityUsedList;
				    	$("#coupon").find(":checkbox").each(function(){
				    	    var value=$(this).val();
				    		for(var i=0,length=accountEntityUsedList.length;i<length;i++){
				    		   if(accountEntityUsedList[i].id=value){
				    		      $(this).prop("checked",true);
				    		   }
				    		}
				    	});
				    	$("#warmTip").hide();
				  }
			  }
		  }else{
		    $("#promotionAmount").hide();
		    $('#typeAlias').hide();
		  	$("#selectOnline").hide();
		    $("#coupon").hide();
		  }*/
		   //仅仅展示钱数
		   //alert("总金额："+detialJson.onlinePayAmount);
		   //alert("优惠金额："+$("#promotionAmount").text());
		   var proAmount=parseFloat($("#promotionAmount").text());
		   if(isNaN(proAmount)){
		     proAmount=0;
		   }
		   		   
		   //保险
		   var insuranceModelJson ;
		   var payamountYuan="0.0";
		   if(detialJson.insuranceModel){
		     insuranceModelJson=detialJson.insuranceModel;
		     if(insuranceModelJson.payamountYuan)
		     {
		     	payamountYuan = insuranceModelJson.payamountYuan;
		     }
		   } 
		    var ticketPriceShow="0.0";
		 	if(detialJson.ticketModel)
		 	{
			 	if(detialJson.ticketModel.totalPrice)
			 	{
			 		ticketPriceShow=detialJson.ticketModel.totalPrice/100;
			 	}
		 	}
		 
		   if(insuranceModelJson!=null)
		   {		    		    
		     if(payamountYuan=='0'||payamountYuan=='0.00'||payamountYuan=='0.0')
		     {
		        $("#insurance_online").html("");
		     	$('#s_insurance').hide();
		     }else{
		        $("#insurance_online").html("+保险"+payamountYuan);
		     	$('#s_insurance').show();
		     }
		   }
		   else
		   {
		      $("#insurance_online").html("");
		      $('#s_insurance').hide();
		   }
		   
		   var showtotalpriceText = (parseFloat($("#showtotalpriceText").text()) - parseFloat(payamountYuan)- parseFloat(ticketPriceShow))
				.toFixed(2);
		   $("#showtotalpriceText").text(showtotalpriceText);
		   //保险结束
		   //优惠券
		   var onlinePayAmountTrue =  (parseFloat(detialJson.onlinePayAmount) - parseFloat(payamountYuan)- parseFloat(ticketPriceShow)).toFixed(2);
		   $("#onlinePayAmount").val(onlinePayAmountTrue);		   
		   setPayCuponPrice();
		   
		}			
		
</script>
<script type="text/javascript" language="javascript">  
		//给动态添加的优惠券选项添加事件
		$(function(){
			bindEventForPromt();
		});
		function bindEventForPromt(){
			$("#coupon").find(":radio").on('click',function(){
			   processPromotion(this);
			   if(typeof($(this).next().val()) != "undefined"&&$(this).next().val()!=''){
				   var cpvalues=$(this).next().val().split(",");
				   var coupid=cpvalues[0];
				   if($(this).val()==''&&typeof(coupid) != "undefined"&&coupid!=''){
				   		$(this).val(coupid);
				   }
				   if(cpvalues.length>0&&typeof(cpvalues[1]) != "undefined"&&cpvalues[1]==1){
					  		$("#tipSpan").text($(this).parent().text());
					  		$("#warmTip").show();
					  	}else{
					  		$("#warmTip").hide();
				   }
			   }
			});
			$("#coupon").find(":checkbox").on('click',function(){
			   processPromotion(this);
			   var coupid=$(this).next().val();
			   if($(this).val()==''&&typeof(coupid) != "undefined"&&coupid!=''){
			   		$(this).val(coupid)
			   }
			   $("#warmTip").hide();
			});
		}
		//处理单击事件
		function processPromotion(obj){
		    var type=$(obj).attr("type");
		    if(type=="radio"){		      
		    	$("#coupon").find(":checkbox").prop("checked",false);
		    	$("#promotiontype").val(2);
		    	var amountShow= $(obj).attr("amountShow");
		    	var olpayMony=(parseFloat($("#onlinePayAmount").val())-parseFloat(amountShow)).toFixed(2);		    	
		    	$("#typeAlias").text("优惠券");
		    	$("#selectOnline").val("优惠券");
		    	$("#promotionAmount").text(-parseFloat(amountShow));
		    	//kgj add  是提交订单页面
		    	if($(".inspersonDetail").length>=1)
		    	{
		    	   setCuponPrice();
		    	}
		    	else
		    	{
		    	   setPayCuponPrice();
		    	  //$("#onlinePayAmountShow").text(olpayMony<0?'0.00':olpayMony);
		    	}		      
		    }else if(type=="checkbox"){
		    	$("#coupon").find(":radio").prop("checked",false);
		    	$("#promotiontype").val(1);
		    	var size=$("#coupon").find(":checkbox:checked").size();
		    	if(size>0){
		    		$("#promotiontype").val(1);
		    	}else{
		    		$("#promotiontype").val(0);
		    	}
		    	
		    	var amountShow= 0;
		    	$("#coupon").find(":checkbox:checked").each(function(){
		    		amountShow=(parseFloat(amountShow)+parseFloat($(this).attr("amountShow"))).toFixed(2);
		    	});
		    	$("#typeAlias").text("代金券");
		    	$("#selectOnline").val("代金券");
		    	
		    	var onlinePayAmountShow=(parseFloat($("#onlinePayAmount").val())-parseFloat(amountShow)).toFixed(2);
		        if(onlinePayAmountShow<0){
		          onlinePayAmountShow='0.00';
		          $("#promotionAmount").text('-'+$("#onlinePayAmount").val());
		        }else{
		          $("#promotionAmount").text('-'+amountShow);
		        }		        	      
		        //kgj add  是提交订单页面
		    	if($(".inspersonDetail").length>=1)
		    	{
		    	   setCuponPrice();
		    	}
		    	else
		    	{
		    	   setPayCuponPrice();
		    	   //$("#onlinePayAmountShow").text(onlinePayAmountShow);	
		    	}		
		    }
		}
		//确认或者取消的操作
		function confirmOrCancle(type){
		  if(type==1){//确认
		    var checkedsSize=$("#coupon").find(":checkbox:checked").size();
		    var radioSize=$("#coupon").find(":radio:checked").size();
		    if(checkedsSize==0 && radioSize==0){
		      alert("请选择要使用的优惠信息");
		      return;
		    }
		  	$("#coupon").hide();
		  }else if(type==-1){//取消		  	
		  	 $("#promotionAmount").text('-'+0);
		  	 $("#coupon").hide();
		  	 $("#coupon").find(":checkbox").prop("checked",false);
		  	 $("#coupon").find(":radio").prop("checked",false);
		  	 $("#promotiontype").val(0);
		  	 //kgj add  是提交订单页面
	    	if($(".inspersonDetail").length>=1)
	    	{
	    	    setCuponPrice();
	    	}
	    	else
	    	{
	    	     setPayCuponPrice();
	    	    //$("#onlinePayAmountShow").text(parseFloat($("#onlinePayAmount").val()).toFixed(2));
	    	}
		  }else if(type==2){
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
	
</script><script type="text/javascript" language="javascript">
	function pay(){	
	     var bookOrderId=$("#orderId").val();
	     $.ajax({
                type:'get',
                url:"/order/checkstate/"+bookOrderId,
                async:false,
                dataType:'json',
                success:function(re) {
                    if(re.error!=null){                        
                         layer.alert(re.error.message,5,"温馨提示",function index(){
                               var uid = $('#uid').val();	   
                               var nexturl = "/tenant/"+uid+"/orders";
                               location.href = nexturl;
                         });			        
                    }else{
                            var haveStock=$("#haveStock").val();
							if(haveStock!=1){
							  alert("当前房间已经被其他房客抢先支付.");
							  return;
							}
							if($("#onlinePayAmountShow").text()!=0){
								var paymethod=$(":radio:checked[name=paymethod]").val();
								if(!paymethod){
								  alert("请选择支付方式");
								  return ;
								}
							}
							if(paymethod==2){
								var bankCardType=3;//改为固定使用 网银 $(":radio:checked[name=bankCardType]").val(); 
								if(!bankCardType){
									alert("请选择银行卡类型");
							  		return ;
								}
								var bankId=$(":radio:checked[name=SelectPay]").attr("id");
								if(!bankId){
									alert("请选择银行");
									return;
								}
								var item=$("#item").val();
								item=eval("("+item+")");
								if(bankCardType==1){
									if(!(item.haveSaving==true)){
									  alert("当前选择银行卡不支持储蓄卡");
									  return;
									}
								}else if(bankCardType==2){
									if(!(item.haveCredit==true)){
									  alert("当前选择银行卡不支持信用卡");
									  return;
									}
								}else if(bankCardType==3){
								    if(!(item.haveOnline==true)){
									  alert("当前选择银行卡不支持网银支付");
									  return;
									}
								}
							}
							
							var orderId=$("#orderId").val();
							showMessage();
							var url="/order/pay/"+orderId;
							jQuery("#payForm").first().attr("action",url).submit();
                    } 
                },
                error:function(){   
                       layer.alert("支付失败,请稍候重试!",5,"温馨提示",function index(){location.reload();}); 
                }
         });			
    }
    
    
	 //显示提示信息 alert-close
     function showMessage(){
	    var i = $.layer({
					    type : 1,
					    title : false,
    					offset:['150px' , ''],
					    border : false,
					    area : ['auto','auto'],
					    move : ['.d-h3',true],
					    page : {dom : '#goPayShow'},
					    closeBtn: false
						});
		$('.alert-close').on('click',function(){
				layer.close(i);
				});
		$('.select-again').on('click',function(){
		layer.close(i);
		});
		$('#problems').on('click',function(){
		layer.close(i);
		});
       }
//动态改变银行
function changeBankInfo(type,bankCardType){
	var url="/order/bankinfo/"+type+"?bankCardType="+bankCardType;
	if(type==1){
	 	 //$(".OnpayWay").find(":radio").prop("checked",false);
	 	 //$(".OnpayWay").find(":radio").addClass("pay-disabled");
	}
	jQuery.post(url,{},function(result){
		result=eval("("+result+")");
		if(type==1){
			for(var i=0,length=result.length;i<length;i++){
				var item=result[i];
				if(bankCardType==1){
				  if(item.SAVING=true){
				  	  $("#"+item.id).removeClass("pay-disabled");
				  }
				}else if(bankCardType==2){
					if(item.CREDIT=true){
					  $("#"+item.id).removeClass("pay-disabled");
				    }
				}else if(bankCardType==3){
					if(item.ONLINE=true){
					 $("#"+item.id).removeClass("pay-disabled");
				    }
				}
			}
		}else if(type==2){
			var id=result.id;
		}
	})
}

$(function(){
	$(".bank_ul2").find(":radio").click(function(){
	    var bankId=$(this).attr("id");
		var url="/order/bankinfo/2?bankId="+bankId;
		 $(".bankCard").find(":radio").each(function(){
		    //$(this).prop("checked",false);
		    $(this).attr("disabled",true);
		    $(this).parent().addClass("pay-disabled");
		 });
		jQuery.post(url,{},function(result){
		    $("#item").val(result);
		    result=eval("("+result+")");
			var id=result.id;
			 if(result.haveSaving){
			    //alert(1);
			    $(":radio[name=bankCardType][value=1]").parent().removeClass("pay-disabled");
			    $(":radio[name=bankCardType][value=1]").attr("disabled",false);
			 }
			 if(result.haveCredit){
			 	//alert(2);
			 	$(":radio[name=bankCardType][value=2]").parent().removeClass("pay-disabled");
			 	$(":radio[name=bankCardType][value=2]").attr("disabled",false);
			 }
			 if(result.haveOnline){
			 	//alert(3);
			 	$(":radio[name=bankCardType][value=3]").parent().removeClass("pay-disabled");
			 	$(":radio[name=bankCardType][value=3]").attr("disabled",false);
			 }
			 
			
	    })
	});
	
	$('.yinhk').parent().siblings().click(function(){
		
		$('.bank_ul2').css('display','none');
		$(this).find('input').attr('checked',true);
		
	})
	$('.yinhk').parent().click(function(){
		$(this).find('input').attr('checked',true);
		$('.bank_ul2').css('display','block');
	
	})
	
});
function goPaysuccess(){
var orderId=$("#orderId").val();
var url="/order/paysuccess/"+orderId;
window.location.href=url;
}

function setPayCuponPrice() {
    
    var isRadio = false;
    var amountShow = 0;   
    /**
    var hasNoP = $("#coupon").find(":checkbox").length>=1;
    $("#coupon").find(":radio:checked").each(function() {
        amountShow = $(this).attr("amountShow");
        isRadio = true;
    });  
    if (!isRadio) {
        $("#coupon").find(":checkbox:checked").each(

        function() {
            amountShow = (parseFloat(amountShow) + parseFloat($(this).attr("amountShow"))).toFixed(2);
        });
    }*/
    amountShow = $('#amountShow').val();
    var detialJson='{"showtotalprice":264.0,"onlinePayAmount":264.0,"payRuleRate":100,"promotionModel":{},"priceDetailModel":{"sum":26400,"showtotalPrice":264.0,"items":[{"date":"2018-10-18","originalPrice":26400,"price":26400,"priceShow":264.0,"type":10,"dayAmount":264.0,"weekNum":4}]},"haveStock":1,"firstPaying":1,"insuranceModel":{"id":5946300,"insuranceno":"","peoplenum":1,"daynum":1,"roomnum":1,"freeunitprice":23,"freeamount":23,"totalamount":23,"state":"0","paystate":"0","createtime":1539827487000,"bookorderid":857552220,"source":"1","freeamountYuan":0.23,"totalamountYuan":0.23,"policyholderstartdate":1539835200000,"policyholderenddate":1539921600000,"assurer":2},"ticketModel":{}}';
    detialJson=eval("("+detialJson+")");
    var insuranceModelJson;
    if(detialJson.insuranceModel){
    	insuranceModelJson=detialJson.insuranceModel;
    }
    
	var  payamountYuan = "0.0";
	if(insuranceModelJson){
		if(insuranceModelJson.payamountYuan)
		{
	 		payamountYuan= insuranceModelJson.payamountYuan;
	 	}
	 }
	 var ticketPriceShow="0.0";
 	if(detialJson.ticketModel)
 	{
 		if(detialJson.ticketModel.totalPrice)
 		{
	 		ticketPriceShow=detialJson.ticketModel.totalPrice/100;
	 	}
 	}
 	/**
	if(!hasNoP)
	{
		amountShow = $("#promotionAmount").text().replace('-','');
		if(isNaN(amountShow)||amountShow=='')
		{
			amountShow=0;
		}
	}*/
	  
    var onlinePayAmountShow = (parseFloat($("#onlinePayAmount").val())  - parseFloat(amountShow)/100).toFixed(2);   
    if (onlinePayAmountShow < 0) 
    {
        onlinePayAmountShow = '0.00';
        $("#promotionAmount").text('-' + (parseFloat($("#onlinePayAmount").val())).toFixed(2));
    } else { 
        	$("#promotionAmount").text('-' + amountShow);
         
    }    
    onlinePayAmountShow = (parseFloat(onlinePayAmountShow) + parseFloat(payamountYuan)+ parseFloat(ticketPriceShow)).toFixed(2);
    var invoicetax = parseFloat('0');
    var invoicepostage = parseFloat('0');
    onlinePayAmountShow = (parseFloat(onlinePayAmountShow) + parseFloat(invoicetax) + parseFloat(invoicepostage)).toFixed(2);
    $("#onlinePayAmountShow").html(onlinePayAmountShow);
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
		   <span style="text-align: left;font-size: 30px;color: #009900;font-weight: bolder;width: 80%;position: absolute;">黄虫短租</span>

		<div class='head_cnt relave'> 
			<span class='search'></span>		
			<ul class="nav_R asote nav_right">
				 
            	 <li>
	                <div class="showinfo">
	                    <a href="javascript:menufrozen(870557712,'/tenant/870557712/orders','user')" target="_self"><img src="https://i1.mayi.com/mayi97/M30/FV/RS/9927Y95FRTKGDMKX4C9D7LX4REKJSH.jpg_35x35c.jpg" id="aaa" class="user_img">                	
	                    <span class="name" id="head_nickname"></span></a>
	                    <div class="head_pop">
	                        <div class="pop_column">
	                            <p><a href="javascript:menufrozen(870557712,'/tenant/870557712/orders','user')" target="_self" id="myorder" rel="nofollow" _mayi_rp="webaround|userinfo|order">我的订单</a></p>
	                            <p><a href="javascript:menufrozen(870557712,'/user/tenant/accountmanager','user')" target="_self" id="myorder" rel="nofollow" class="slideactive" _mayi_rp="webaround|userinfo|account">我的账户</a></p>
	                            <p><a href="javascript:menufrozen(870557712,'/user/tenant/mycollection','user')" target="_self" id="mycollect" rel="nofollow" _mayi_rp="webaround|userinfo|collection">我的收藏</a></p>
	                            <p><a href="javascript:menufrozen(870557712,'/user/tenant/msgmanager','user')" target="_self" id="mymsg" rel="nofollow" _mayi_rp="webaround|userinfo|inform">消息通知</a></p>
	                            <p class="Invite_friends" _mayi_rp="webaround|userinfo|invite">邀请好友</p>
	                            <p class="textCt"><a href="javascript:void(0)" id="loginoutbut" target="_self" class="stclick" clicktag="1_6">退出登录</a></p>
	                        </div>
	                    </div>
	                </div>
               </li>          
            	<li>
	            	<div class="showinfo" id="s_islandlord" hidden>
	            		<a href="javascript:loginowner(870557712)" target="_self" class="stclick">我是房东</a>
	                	<div class="head_pop">
		                	<div class="pop_column plr10">
		                        <p><a href="javascript:menufrozen(870557712,'/landlord/870557712/orders','landlord')">订单管理</a></p>
		                        <p><a href="javascript:menufrozen(870557712,'/user/landlord/roommanager','landlord')">房源管理</a></p>
		                        <p><a href="javascript:menufrozen(870557712,'/user/landlord/msgmanager','landlord')">消息通知</a></p>
		                        <p><a href="javascript:menufrozen(870557712,'/landlord/870557712/settlements','landlord')">结算管理</a></p>
		                        <p><a href="javascript:menufrozen(870557712,'/user/landlord/landlordweixin','landlord')">关注房东微信</a></p>
		                        <!-- 四元组控制下载元素显示情况 -->
  									<p><a href="/user/landlord/landlordhelper/">下载APP</a></p>
		                        <p hidden id="s_micro"><a href="/user/landlord/microshopmanager/">房东微店</a></p>
		                        <p><a href="javascript:menufrozen(870557712,'/user/landlord/accountmanager','landlord')">我的设置</a></p>
		                    </div>
	                	</div>
	                </div>
                </li>  
            	
            	
             <li>
             <a rel="nofollow" href="javascript:publish(870557712)" class="room-btn f16 t-center" _mayi_rp="webaround|activity|freepublish">免费发布房源</a> 
             <!--   
                <a rel="nofollow" href="javascript:publish(870557712)" class="room-btn f16 t-center" _mayi_rp="webaround|activity|freepublish">免费发布房源</a>
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
    	$(function(){
    		var userid = getCookie("MAYIUID");
    		var ca_s = getCookie("_channel");
    		var ca_n = getCookie("_caname");
    		//生成专属二维码
    		
    		//邀请好友
			var shareLink = "http://m.mayi.com/coupon/getInvitee?id="+userid+"&channel=w_qrcode&s=wap";
    		//var shareLink = "https://previewwap.mayi.com/coupon/getInvitee?id="+userid+"&channel=w_qrcode&s=wap";
			shareLink = shareLink.replace('','').replace('true','false');
			var qingdaoWx="http://m.mayi.com/wxGuide?ca_s="+ca_s+"&ca_n="+ca_n;
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
		 <img src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/images/close.png" alt="" class="hong_close"/>
		 <img src="//staticnew.mayi.com/resourcesWeb/v201612/headpub/images/hongbao1.png" alt=""  class="hongbao"/>
		 <div id="qrcode" class="ewm_img"></div>
	
	 </div>
</div>
<input  type="hidden" name="subdomain" id="subdomain" value="" />
<input  type="hidden" name="mainsite" id="mainsite" value="" />
<input  type="hidden" name="ctx" id="ctx" value="" />
<input  type="hidden" name="ctx1" id="ctx1" value="//staticnew.mayi.com" />
<input  type="hidden" name="uid" id="uid" value="870557712" />
<input  type="hidden" name="loginurl" id="loginurl" value="none" />
<input type="hidden" name="head_userName" id="head_userName" value="上帝的米缸">
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
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/webim.js"></script>  
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/im1/chat.js"></script>  
<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/im/css/IM.css" />  
<link rel="stylesheet" href="//staticnew.mayi.com/resourcesWeb/im/css/jquery-ui.css" />  

<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/swfupload2/swfupload.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/swfupload2/plugins/swfupload.queue.js?v=20160225"></script>

</head> 
<body>   
		<input type="hidden" id="MAYIUID" value="870557712" />

<style>
	#layer_settimeout{width:280px;height:60px;border-radius:5px;background:rgba(0,0,0,.7);color:#fff;position:fixed;top:300px;left:50%;margin-left:-140px;z-index:999999999;line-height:60px;text-align:center;display:none}
</style>

<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/tentantIndex/js/fk_index.js" ></script>

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
		<ul	class="img_box" id="IMImageList">
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
	<p class="report-t-left">感谢您抽出时间举报此用户，您的参与有助于黄虫短租建设成一个安全、值得信赖的平台。</p>
	<p class="report-t-left">您的举报内容如果经过核查属实，我们会对该用户处以黄虫短租全站禁言或禁止登录的惩罚。</p>
	<div id="jubaoSuccessBoxclose" class="report-green-btn f16" style="vertical-align: middle;background-image: none;">确定</div>
</div>

<div id="layer_settimeout" style="display:none;">您不是房东，无权举报</div>	<div id="point" class="contacts_landlord clearfloat IM_content ui-draggable" style="display:none;">
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
	
	<!-- Header END -->
	<!-- Content -->
	<!--MY统计所需域 -->
	<input type="hidden" name="my_p_t" id="my_p_t" value="paying"/>
	<input type="hidden" name="my_b_id" id="my_b_id" value="857552220"/>
	<input type="hidden" name="my_b_s" id="my_b_s" value="1"/>
	<input type="hidden" name="my_p_y" id ="my_p_y" value='xiamen'/>
	<!--MY统计所需域 -->
	<div class='one_workflow'>
		<div class='workflow relave'>
			<div class='progress progress_2'></div>
				<b class='workflow1'>提交订单</b>
				<b class='workflow3'>支付订金</b>
			
			
				<span class='workflow1_2'><a href="javascript:;" class='a_after'>1</a></span>
				<span class='workflow1_3'><a href="javascript:;" class='a_after'>2</a></span>
		
		</div>
	</div>
	<form id="payForm" action="" name="payForm" method="post" target="_blank">
	
	 <input type="hidden" id="promotiontype" name="promotiontype" value="0"/>
	 <input type="hidden" id="onlinePayAmount" name="onlinePayAmount" value="0"/>						
	 <input type="hidden" id="haveStock" name="haveStock" value="0"/>
	 <input type="hidden" id="firstPaying" name="firstPaying" value="0"/>
	 <input type="hidden" id="orderId" name="orderId" value="0"/>
	 <!-- 下单页带过的优惠券 -->
	 <input type="hidden" id="coupon_checkbox" name="coupon_checkbox" value=""/>
	 <input type="hidden" id="coupon_radio" name="coupon_radio" value=""/>
	 <input type="hidden" id="amountShow" name="amountShow" value="0"/>
	<div class='content clearfloat min_h'>
		<div class='cnt_tix clearfloat'>
			<div class='fl duigo_par'><span></span></div>
			<div class='fl you_ti'>
					<p class='you_p1'>此房源为速订房源，支付后即可预订成功，请放心支付</p>
					<a href="/tenant/870557712/orders" class='a_more'>查看订单</a>
				
			</div>
		</div>
		<div class='pay_parent'>
		<dl class='clearfloat'>
				<dt class='fl'>订单编号：</dt>
				<dd class='fl color_tao'><span id="orderId">${orderId}</span></dd>
			</dl>
			<dl class='clearfloat'>
				<dt class='fl'>民宿名称：</dt>
				<dd class='fl color_tao'><span id="accomTitle">${accomTitle}</span></dd>
			</dl>
			<dl class='clearfloat'>
				<dt class='fl'>线上支付到黄虫</dt>
				<dd class='fl color_tao'><span id="onlinePayAmountShow"></span>元</dd>
			</dl>
			<div id="coupon"></div>
			<!--选择支付方式-->
			<dl class='clearfloat'>
				<dt class='fl bank_dt'>选择支付方式</dt>
				<dd class='bank fl'>
					<ul class='clearfloat bank_ul1'>
						<li class='bank_radio clearfloat'><label><input type="radio" name='paymethod' value="1" checked="checked"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/zhifubao.jpg" title='支付宝'/></label></li>
						</ul>
					<ul class='clearfloat bank_ul2'>
					  	<input type="hidden" id="item" />
						<li class='bank_radio clearfloat'><label><input id="icbc" type="radio" name="SelectPay" value="icbc"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_gongs.jpg" title='工商银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="ccb" type="radio" name="SelectPay" value="ccb"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_jians.jpg" title='建设银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="abc" type="radio" name="SelectPay" value="abc"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_nongy.jpg" title='农业银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="cmb" type="radio" name="SelectPay" value="cmb"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_zhaos.jpg" title='招商银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="postgc" type="radio" name="SelectPay" value="postgc"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_youz.jpg" title='邮政银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="boc" type="radio" name="SelectPay" value="boc"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_china.jpg" title='中国银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="comm" type="radio" name="SelectPay" value="comm"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_jiaot.jpg" title='交通银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="citic" type="radio" name="SelectPay" value="citic"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_zhongx.jpg" title='中信银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="bjbank" type="radio" name="SelectPay" value="bjbank"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_beij.jpg" title='北京银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="cmbc" type="radio" name="SelectPay" value="cmbc"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_mins.jpg" title='民生银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="cib" type="radio" name="SelectPay" value="cib"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/bank_xingy.jpg" title='兴业银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="ceb" type="radio" name="SelectPay" value="ceb"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/guangda.jpg" title='中国光大银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="spdb" type="radio" name="SelectPay" value="spdb"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/pufa.jpg" title='浦发银行'/></label></li>
						<li class='bank_radio clearfloat'><label><input id="gdb" type="radio" name="SelectPay" value="gdb"/><img src="//staticnew.mayi.com/resourcesWeb/ordernew/images/guangdong.jpg" title='广东发展银行'/></label></li>
					</ul>
				</dd>
			</dl>
		</div>
		<div class='go_pay'><a id="gopay">去支付</a></div>
	</div>
	</form>
	
	<style>

	</style>
	<!-- 支付后弹窗 -->
	<div id="goPayShow" class="alert-box">
		<div class="alert-title">
			在线支付<!-- 名字可动态自定义 -->
			<a class="alert-close"rel="nofollow" href="#"></a>
		</div>
		<div class="alert-con">
			<div class="pat-hint">
				<h3>请在新打开的页面完成付款！</h3>
				<p>完成付款后请根据您的情况点击下面的按钮。</p>
			</div>
			<div class="btn-box">
				<input type="button" class="green-btn mgrt30" name="" onclick="goPaysuccess();"  value="已完成付款">
				<input type="button" class="gray-btn" name="" id="problems" value="付款遇到问题？">
			</div>
			<p class="select-again"><a href="#" rel="nofollow">返回选择其他支付方式>></a></p>
		</div>
	</div>
	<!-- 支付后弹窗 END -->
	
	<!-- Content END -->
	<!-- Footer -->

<!-- 登录弹窗 -->
<div class="loginbox" id="loginboxdiv" nexturl="none" name="loginboxdiv" style="display:none;">
	<a class="login-colse"  id="loginclose" name="loginclose" onClick="" href="javascript:void(0)"></a>
    <div class="login-ways clearfloat">
    	<div class="fl phone-account">
            <ul class="c322c27 clearfloat f18">
                <li class="phoneway_current" id="changeloginbyma">手机验证码登录</li>
                <li class="mayiway" id="changeloginbyup">帐号密码登录</li>
            </ul>
            <div class="login-phone-account">
            <!-- 手机登陆 -->		
                <div class="login-input" id="loginbymadiv" name="loginbymadiv" >
                <div class="input">
                    <span class="phone-icon"></span>
                    <input class="dlargeinput" type="text" id="loginmobile" name="loginmobile" placeholder="手机号" value=""/>
                </div>
                <div class="largeinputbox small-top clearfix">
                    <div class="dinput fl" >
                        <span class="verification-icon"></span>
                        <input class="dsmallinput" type="text" id="imagecode" placeholder="图形验证码" value=""/>
                    </div>
                    <div class="yz-code fr">
                          <img src=""  id="loginauthimage" title="点击刷新" />
                    </div>
                </div>
                <div class="largeinputbox small-top clearfix" id="maerrordiv">
                    <div class="dinput fl" id="maerrordiv">
                        <span class="password-icon"></span>
                        <input class="dsmallinput" type="text" id="loginphonecode" name="loginphonecode" placeholder="短信验证码" value=""/>
                    </div>
                    <div class="yz-code fr">
                        <input class="sendnumber defaultsend" type="button" id="getloginphonecode" name="getloginphonecode" value="获取验证码"/>
                    </div>
                </div>
                <div class="logincheckbox large-top clearfix">
                    <label class="fl">
                        <input class="selectcheckbox" type="checkbox" name="rememberloginstate" checked="checked" value=""/>自动登录
                    </label>				
                </div>	
                <div class="logincheckbox large-top clearfix"><font>未注册的手机号将自动创建为黄虫短租帐户</font></div>
                <div class="btn-wrap btnpdt20">
                    <a href="javascript:void(0)" id="loginbymado">登录</a>
                </div>
            </div>
            <!-- 手机登陆 end  -->	
            <!-- 密码登陆 start -->
                <div class="login-input" id="loginbyupdiv" name="loginbyupdiv" style="display:none;">
                <div class="input">
                    <span class="user-icon"></span>
                    <input class="dlargeinput" type="text"  id="loginnamein" name="loginnamein"  placeholder="手机号/邮箱/账号" value=""/>
                </div>
                <div class="input small-top" >
                    <span class="password-icon"></span>
                    <input class="dlargeinput" type="password" id="loginpassin" name="loginpassin" placeholder="密码" value=""/>
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
                    <a href="javascript:void(0)" id="loginbyupdo">登录</a>
                </div>
                <p class="otherwaytitle mt20">没有账号密码请 <a href="javascript:void(0)" id="changeloginbymwa">使用手机验证码登录</a></p>
            </div>
            <!-- 密码登陆 end -->
            </div>
        </div>
        <div class="fl t-center third-party">
        	<p class="f18 c322c27 mb20">其他登录方式</p>
            <ul class="otherway c322c27">
                <li class="wxway" id="loginbywx">微信登录</li>
                <li class="sinaway" id="loginbysina">微博登录</li>
                <li class="qqway" id="loginbyqq">QQ登录</li>
            </ul>
        </div>
    </div>
</div>	
<!-- 登录弹窗 END --> 
<!--公共尾部结束-->
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
<!-- load statistics js -->
<!--[statistics start]-->
<!-- load End-->
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/layer/layer.min.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/jQuery.md5.js"></script>
<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/login.js"></script>

	<!-- Footer END -->
	<script type="text/javascript" src="//staticnew.mayi.com/resourcesWeb/js/order.js"></script>
	
	<!-- 广告联盟 访问 正式：o.yiqifa.com/servlet/handleCpsIn 测试： o.test.yiqifa.com/servlet/handleCpsIn-->
	<!-- 广告联盟 访问 end-->
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
    if (bd_push != null) {
        (function () {
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https') {
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else {
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
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-63543541-1');
</script>




<!--ganji start-->
<script type="text/javascript">
var bsource = document.getElementById("channel_ganji");
if (bsource != null){
}
</script>
<!--ganji end-->
<script type="text/javascript">
 $("#gopay").click(function(){
	
	location.href="bs.action?op=gopay&onlinePayAmountShow=${onlinePayAmountShow}&orderId=${orderId}&accomId=${accomId}";
	
}); 

</script>


<!--360聚效推广的访客找回 -->



</body>
</html>