var img = new Image(); 
$(document).ready(function(){
	var usertype = $("#usertype").val();
	if(usertype == "landlord"){
		var date = new Date();
		var time = date.getTime();
		var land_cookie = "MAYI_LA_TIME" + '=' + time;
		date.setTime(time+365*24*3600*1000);
		land_cookie += ';expires =' + date.toGMTString()+';path=/';
		document.cookie = land_cookie; //添加房东点击账户管理的时间
	}
	
	img.onload = function(){ 
	    $("#morebig").click();
		$("#moresmall").click();
	} 

	//获取字符真实长度
	function getRealLength(str){
		var realLength = 0, len = str.length, charCode = -1;
		for (var i = 0; i < len; i++) {
			charCode = str.charCodeAt(i);
			if (charCode >= 0 && charCode <= 128){ realLength += 1;}
			else{realLength += 2;}
		}
		return realLength;
	}

	function showHeadImageDiv(){
		headImagelayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			fix : true,
			offset:['50px' , ''],
			border : [0,0,'',false],
			move : ['.d-h4',true],
			area : ['auto','auto'],
			page : {dom : '#headimagediv'}
	    });
	    $('.cropper_cancel').on('click',function(){
	    	layer.close(headImagelayer);
	    });
	}
	
	function each(arr, callback) {
	    var length = arr.length;
	    var i;
	    for (i = 0; i < length; i++) {
	      callback.call(arr, arr[i], i, arr);
	    }
	    return arr;
	}

	function getRoundedCanvas(sourceCanvas) {
	    var canvas = document.createElement('canvas');
	    var context = canvas.getContext('2d');
	    var width = sourceCanvas.width;
	    var height = sourceCanvas.height;
	    canvas.width = width;
	    canvas.height = height;
	    context.imageSmoothingEnabled = true;
	    context.drawImage(sourceCanvas, 0, 0, width, height);
	    return canvas;
	}
	
	function dataURItoBlob(dataURI) {
	    var byteString = atob(dataURI.split(',')[1]);
	    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
	    var ab = new ArrayBuffer(byteString.length);
	    var ia = new Uint8Array(ab);
	    for (var i = 0; i < byteString.length; i++) {
	        ia[i] = byteString.charCodeAt(i);
	    }
	    return new Blob([ab], {type: mimeString});
	}

	var base64=null;
	  (function(){
	    var image = document.getElementById('image');
	    var previews = document.querySelectorAll('.cropper-preview');
	    var result = document.getElementById('headimage_div');
	    var croppable = false;
	    var cropBoxData;
	    var canvasData;
	    var cropper;
	    var file = {
	      upload: function(e){
	        if(cropper){
	          cropper.destroy();
	        }
	        var file = e.target.files[0];
	        if(!file){
	          return;
	        }
	        var type = file.type.split('/')[0];

	        if (type !='image') {
	          alert('请上传图片');
	          return;
	        }
	        var size = Math.floor(file.size / 1024 /1024);
	        if (size > 5) {
	          alert('图片大小不得超过5M');
	          return;
	        };
	        var reader = new FileReader();
	        reader.readAsDataURL(file);
	        reader.onloadend = function (e) {
	          if(cropper){
	            cropBoxData = cropper.getCropBoxData();
	            canvasData = cropper.getCanvasData();
	            cropper.destroy();
	          }
	          var dataURL = reader.result;
	          var image=document.getElementById("image")
	          image.src=dataURL;
	          cropper = new Cropper(image, {
	            minCanvasWidth:300,
	            minCanvasHeight:300,
	            dragMode: 'move',
	            aspectRatio:1,
	            autoCropArea:0.8,//定义自动剪裁区域的大小
	            restore: false,
	            guides: true,//是否在剪裁框上显示虚线
	            center: true,
	            highlight: true,//是否在剪裁框上显示白色的模态窗口
	            cropBoxMovable: false,
	            cropBoxResizable: false,
	            toggleDragModeOnDblclick: false,
	            ready: function () {
	              cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);   //输出剪裁区域的位置和尺寸大小
	              var clone = this.cloneNode();
	              clone.className = ''
	              clone.style.cssText = (
	                'display: block;' +
	                'width: 100%;' +
	                'min-width: 0;' +
	                'min-height: 0;' +
	                'max-width: none;' +
	                'max-height: none;'
	              );
	              each(previews, function (elem) {
	                elem.innerHTML = "";
	                elem.appendChild(clone.cloneNode());
	              });
	              croppable = true;
	            },
	            crop: function (e) {
	              var data = e.detail;   //选框中图片左上角坐标
	              var cropper = this.cropper;   //信息
	              var imageData = cropper.getImageData();  //原始图片信息
	              var previewAspectRatio = data.width / data.height;  //预览图长宽比
	              each(previews, function (elem) {
	                var previewImage = elem.getElementsByTagName('img').item(0);
	                var previewWidth = elem.offsetWidth;
	                var previewHeight = previewWidth / previewAspectRatio;
	                var imageScaledRatio = data.width / previewWidth;
	                elem.style.height = previewHeight + 'px';
	                previewImage.style.width = imageData.naturalWidth / imageScaledRatio + 'px';
	                previewImage.style.height = imageData.naturalHeight / imageScaledRatio + 'px';
	                previewImage.style.marginLeft = -data.x / imageScaledRatio + 'px';
	                previewImage.style.marginTop = -data.y / imageScaledRatio + 'px';
	              });
	            }

	          });

	          $(".cropper_save").off().click(function(){
	        	  var spinnerOnbtn ='<div class="bg_cover">'
	                    +'<div class="spinner">'
	                    +'	<div class="bounce1"></div>'
	                    +'	<div class="bounce2"></div>'
	                    +'	<div class="bounce3"></div>'
	                    +'</div>'
	                    +'</div>';
	        	  $("#headimagediv").append(spinnerOnbtn);
	        	  var croppedCanvas;
	        	  var roundedCanvas;
	        	  var roundedImage;
	        	  // Crop
	        	  croppedCanvas = cropper.getCroppedCanvas();    //改变剪裁区域的位置和尺寸大小
	        	  // Round
	        	  roundedCanvas = getRoundedCanvas(croppedCanvas);
	        	  // Show
	        	  roundedImage = document.createElement('img');
	        	  var wait = setInterval(function(){
	        		  var dataURL = roundedCanvas.toDataURL('image/jpeg', 0.5);
	        		  base64=dataURL;
	                  roundedImage.src = dataURL;
	                  result.innerHTML = '';
	                  result.appendChild(roundedImage);
	                  if (dataURL != 0 && dataURL != null && dataURL != undefined && dataURL != '') {
	                    clearInterval(wait);
	                    $("#cropper_save").html("保存")
	                    $(".bg_cover").remove();
	                    layer.close(headImagelayer);
	                  }
	        	  },50);
	          });

	          $("#cropper_bigger").click(function(){
	        	  cropper.zoom(0.1);
	          })
	          $("#cropper_smaller").click(function(){
	        	  cropper.zoom(-0.1);
	          })
	        };
	      },

	      event: function(){
	        $("#upload").click(function(){
	          if(navigator.appName == "Microsoft Internet Explorer"&&parseInt(navigator.appVersion.split(";")[1].replace(/[ ]/g, "").replace("MSIE",""))<10){
	            alert("请使用IE 10以上版本或其他浏览器");
	            $(this).attr('disabled', 'disabled');
	            return;
	          }
	          var s = document.createElement('script');
	          var ctx1 = $("#ctx1").val();
	          s.src = ctx1 + "/resourcesWeb/js/account/cropper.js";  //ie8不支持cropper中的某些方法，所以需要先判断
	          document.getElementsByTagName("head")[0].appendChild(s);
	        });
	        $("#upload").change(function(e){
	          file.upload(e);
	        });
	      },
	      init: function(){
	        this.event();
	      }
	    }
	    file.init();
	}());
	//保存头像
	$("#tjbc").click(function () {
	    if(base64==null){
	    	base64="null";
	    }
	    var userInfo={"userName":$("#userName").val(),"nickName":$("#nickname").val(),"base64":base64};
	    $.ajax({
			url : "../us.action?op=upUserInfo",
			type : 'POST',
			async:true,
			data : userInfo,
			dataType:'text',
			error: function(data){
				layer.alert("保存失败，请稍候再试！",8);
			},
			success : function(data){
				if("true"==data){
					layer.alert("保存成功",9,"提示信息",function callF(){
						window.location.href=window.location.href;
					});
				}else{
					layer.alert("保存失败",9,"提示信息",function callF(){
						window.location.href=window.location.href;
					});
				}
			}
		});
	})

	//修改邮箱前的权限验证 弹窗
	var permissionemaillayer;
	function showPermissionEmailDiv(){
		$('#egetmobilecode').attr('disabled',false);  
		$('#egetmobilecode').removeClass('alertactive-btn');  
		$('#egetmobilecode').text("获取验证码"); 
		permissionemaillayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			offset:['150px' , ''],
			border : [0,0,'',false],
			area : ['auto','auto'],
			// move : ['.d-h3',true],
			page : {dom : '#permissionemaildiv'}
		});
		$('#permissionemaildivclose').on('click',function(){
			layer.close(permissionemaillayer);
		});
	}

	//发送目标邮箱 弹窗
	var toemaillayer;
	function showToEmailDiv(){
		toemaillayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			offset:['150px' , ''],
			border : [0,0,'',false],
			area : ['auto','auto'],
			// move : ['.d-h3',true],
			page : {dom : '#toemaildiv'}
		});
		$('#toemaildivclose').on('click',function(){
			layer.close(toemaillayer);
		});
	}

	//查看验证邮箱 弹窗
	function showViewEmailDiv(){
		var viewemaillayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			offset:['150px' , ''],
			border : [0,0,'',false],
			area : ['auto','auto'],
			// move : ['.d-h3',true],
			page : {dom : '#viewemaildiv'}
		});
		$('#viewemaildivclose').on('click',function(){
			layer.close(viewemaillayer);
		});
	}

	//验证邮箱成功提示  弹窗
	function showValidEmailSucDiv(){
		var validemailsuclayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			offset:['150px' , ''],
			border : [0,0,'',false],
			area : ['auto','auto'],
			// move : ['.d-h3',true],
			page : {dom : '#validemailsucdiv'}
		});
		$('#validemailsucdivclose').on('click',function(){
			layer.close(validemailsuclayer);
		});
	}

	//修改头像 
	$('#upheadimgdo').click(function(){
		showHeadImageDiv();
	});

	$("#saveheadimage").click(function(){
		var picture = $('#picture').val();
		var ctx = $('#ctx').val();
		if(picture!=null&&picture!=""){
			var txt_width = $('#txt_width').val();
			var txt_height = $('#txt_height').val();
			var txt_top = $('#txt_top').val();
			var txt_left = $('#txt_left').val();
			var txt_DropWidth = $('#txt_DropWidth').val();
			var txt_DropHeight = $('#txt_DropHeight').val();
			var txt_Zoom = $('#txt_Zoom').val();
			var postdata = {picture:picture,txt_width:txt_width,txt_height:txt_height,txt_top:txt_top,txt_left:txt_left,txt_DropWidth:txt_DropWidth,txt_DropHeight:txt_DropHeight,txt_Zoom:txt_Zoom};
			$.ajax({
				url : ctx+"/user/account/headimage/upload.do",
				type : 'POST',
				async:true,
				data : postdata,
				dataType:'json',
				error: function(data){
					layer.alert("头像保存失败，请稍候再试！",8);
				},
				success : function(data){
					if(data.error){
						layer.alert(data.error.message,8);
					}else{
						$('#headimage').attr("src",data.data.result);  //修改头像
						//恢复裁剪div默认值	
						$('#picture').val("");
						$("#ImageDrag").attr("src", null);
						$("#ImageIcon").attr("src",null);
						layer.close(headImagelayer);//关闭 div
						layer.alert("头像保存成功",9);
						$("#headimage_refuse").remove();
//						window.location.href=window.location.href;
					}
				}
			});
		}else{
			layer.alert("请您先选择头像图片！",5,"温馨提示");	
			return false;
		}
	});
	
	$("#savemisheadimage").click(function(){
		var picture = $('#picture').val();
		var userid =$('#frozenOwnerid').val();
		var ctx = $('#ctx').val();
		if(picture!=null&&picture!=""){
			var txt_width = $('#txt_width').val();
			var txt_height = $('#txt_height').val();
			var txt_top = $('#txt_top').val();
			var txt_left = $('#txt_left').val();
			var txt_DropWidth = $('#txt_DropWidth').val();
			var txt_DropHeight = $('#txt_DropHeight').val();
			var txt_Zoom = $('#txt_Zoom').val();
			var postdata = {picture:picture,txt_width:txt_width,txt_height:txt_height,txt_top:txt_top,txt_left:txt_left,txt_DropWidth:txt_DropWidth,txt_DropHeight:txt_DropHeight,txt_Zoom:txt_Zoom,userid:userid};
			$.ajax({
				url : ctx+"/mis/user/account/headimage/upload",
				type : 'POST',
				async:true,
				data : postdata,
				dataType:'json',
				error: function(data){
					layer.alert("头像保存失败，请稍候再试！",8);
				},
				success : function(data){
					if(data.error){
						layer.alert(data.error.message,8);
					}else{
						$('#headimage').attr("src",data.data.result);  //修改头像
						//恢复裁剪div默认值	
						$('#picture').val("");
						$("#ImageDrag").attr("src", null);
						$("#ImageIcon").attr("src",null);
						layer.close(headImagelayer);//关闭 div
						layer.alert("头像保存成功",9);
						$("#headimage_refuse").remove();
//						window.location.href=window.location.href;
					}
				}
			});
		}else{
			layer.alert("请您先选择头像图片！",5,"温馨提示");	
			return false;
		}
	});
	
	
	$('#savemisheadimagestaff').click(function(){
		var picture = $('#picture').val();
		var userid =$('#frozenOwnerid').val();
		var ctx = $('#ctx').val();
		if(picture!=null&&picture!=""){
			var txt_width = $('#txt_width').val();
			var txt_height = $('#txt_height').val();
			var txt_top = $('#txt_top').val();
			var txt_left = $('#txt_left').val();
			var txt_DropWidth = $('#txt_DropWidth').val();
			var txt_DropHeight = $('#txt_DropHeight').val();
			var txt_Zoom = $('#txt_Zoom').val();
			var postdata = {picture:picture,txt_width:txt_width,txt_height:txt_height,txt_top:txt_top,txt_left:txt_left,txt_DropWidth:txt_DropWidth,txt_DropHeight:txt_DropHeight,txt_Zoom:txt_Zoom,userid:userid};
			$.ajax({
				url : ctx+"/mis/user/account/headImage/userStaffUpload",
				type : 'POST',
				async:true,
				data : postdata,
				dataType:'json',
				error: function(data){
					layer.alert("头像保存失败，请稍候再试！",8);
				},
				success : function(data){
					if(data.error){
						layer.alert(data.error.message,8);
					}else{
						$('#headimage').attr("src",data.data.result);  //修改头像
						//恢复裁剪div默认值	
						$('#picture').val("");
						$("#ImageDrag").attr("src", null);
						$("#ImageIcon").attr("src",null);
						layer.close(headImagelayer);//关闭 div
						layer.alert("头像保存成功",9);
						$("#headimage_refuse").remove();
//						window.location.href=window.location.href;
					}
				}
			});
		}else{
			layer.alert("请您先选择头像图片！",5,"温馨提示");	
			return false;
		}
	});
	
	
	//昵称检测方法
	function checkNickname(){
		var nickname = $("#nickname").val();
		if(nickname==null||nickname==""){
			layer.alert("昵称不能为空！",5,"温馨提示");	  				
			return false;
		}
		var length = getRealLength(nickname);//nickname.length;
		if(length<4||length>20){
			layer.alert("昵称为4-20个字符（汉字、字母、数字、下划线）",5,"温馨提示");	  
			return false;
		}
		
		if(!/^[\w|\u4E00-\u9FA5]*$/.test(nickname)){
			layer.alert("昵称仅可使用汉字、字母、数字或下划线。",5,"温馨提示");	  
			return false;
		}
		if(/(13|15|18)[0-9]{9}/.test(nickname)||/[1-9][0-9]{4}/.test(nickname)||/\w+((-|\.)\w+)*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/.test(nickname)){
			layer.alert("昵称中请勿出现手机、QQ、邮箱等联系方式。",5,"温馨提示");	  
			return false;
		}
		return true;
	}

	//离开昵称文本框
	$("#nickname").bind('focusout', function(){
		checkNickname();
	});

	//真实姓名检测方法
	function checkRealname(){
		var realname = $("#realname").val();
		if(realname==null||realname==""){
			layer.alert("真实姓名不能为空！",5,"温馨提示");	  				
			return false;
		}
		var length = realname.length;
		if(length<2||length>20){
			layer.alert("真实姓名为2-10个汉字或2-20个英文",5,"温馨提示");	  
			return false;
		}
		if(!/^[A-Za-z|\u4E00-\u9FA5]*$/.test(realname)){
			layer.alert("真实姓名仅可使用汉字、字母。",5,"温馨提示");	  
			return false;
		}
		return true;
	}

	//离开真实姓名文本框
	$("#realname").bind('focusout', function(){
		checkRealname();
	});

	//省份级联事件
	$("#provinceselect,#housetownprov").change(function(){
		var cid = $(this).attr('id');
		var provinceid =$(this).val();
		var cityselect;
		if(cid=='provinceselect'){
			cityselect = $('#cityselect');
		}
		if(cid=='housetownprov'){
			cityselect = $('#housetowncity');
		}
		getCity(provinceid,cityselect);
	})
	
	function getCity(provinceid,cityselect){
		cityselect.empty();
		if(provinceid==0){
			var option = $('<option></option>').text("请选择").val(0); 
			cityselect.append(option);
			return false;
		}else{
			var ctx = $('#ctx').val();	  			
			$.get(ctx+"/province/"+provinceid+"/citylist.json",function(re) {
				for (var cityinfo in re.data){
					var city = re.data[cityinfo];
					var option = $('<option></option>').text(city.short_name).val(city.city_id); 
					cityselect.append(option);
				}
			},'JSON'); 
		}
	}

	//城市下拉单选择时提示
	$("#cityselect").bind('click',function(){
		if($("#provinceselect").val()==0){   
			layer.alert("请先选择省份。",5,"温馨提示");	  
			return false;
		}   
	});

	//ie 8 兼容
	//判断浏览器是否支持placeholder属性
	var supportPlaceholder='placeholder'in document.createElement('input'),
	placeholder=function(obj){
		var text = obj.attr('placeholder'),value = obj.val();
		if(value != ""){
			obj.val(value).removeClass("phcolor");
		}else{
			obj.val(text).addClass("phcolor");
		}
		obj.focus(function(){
			if(obj.val() == text && obj.hasClass("phcolor")){
				$(this).val("");
			}
		});
		obj.blur(function(){
			if(obj.val() == ""){
				$(this).val(text).addClass("phcolor");
			}
		});
		//输入的字符不为灰色
		obj.keydown(function(){
			$(this).removeClass("phcolor");
		});
	};
	//当浏览器不支持placeholder属性时，调用placeholder函数
	if(!supportPlaceholder){
//		$('input[id="profession"],input[id="welcomes"],textarea[id="introduce"]').each(function(){
		$('.hasPlaceholder').each(function(){
			text = $(this).attr("placeholder");
			if($(this).attr("type") == "text"){
				placeholder($(this));
			}
		});
	} 
	//	保存按钮事件
	$("#saveuser").bind('click',function(){
		//检查昵称
		var cansave = checkNickname()&&checkRealname();
		if(cansave){
			//var provinceid =$("#provinceselect").val();
			var profession=$("#profession").val();
			var welcomes=$("#welcomes").val();
			var introduce=$("#introduce").val();
			//证件类型
			var papertype=$('#papertype').val();
			//国籍
			var country=$('#country').val();
			//证件号码
			var paperno = $('#paperno').val();
			//民族
			var nation = $('#nation').val();
			//北京房东
			var bjlandlord=$('#bjlandlord').val();
//			if(provinceid==0){
//				layer.alert("请选择省份与城市！",5,"温馨提示");
//				return false;
//			}
			if($("#usertype").val() == 'landlord'){
//				if(/(13|15|18)[0-9]{9}/.test(profession)||/[1-9][0-9]{4}/.test(profession)||/\w+((-|\.)\w+)*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/.test(profession)){
//				if(/[0-9]{6,}$/g.test(profession)){
				if(profession.length>6){
					layer.alert("职业最多为6个字符",5,"温馨提示");
					return false;
				}
				if(/[1-9][0-9]{4}/.test(profession)||/\w+((-|\.)\w+)*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/.test(profession)){
					layer.alert("职业中请勿出现手机、QQ、邮箱等联系方式。",5,"温馨提示");
					return false;
				}
				//if(welcomes.length>15){
				//	layer.alert("欢迎语最多为15个字符",5,"温馨提示");
				//	return false;
				//}
				if(/[1-9][0-9]{4}/.test(welcomes)||/\w+((-|\.)\w+)*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/.test(welcomes)){
					layer.alert("欢迎语中请勿出现手机、QQ、邮箱等联系方式。",5,"温馨提示");
					return false;
				}
				if(introduce.length>300){
					layer.alert("简介最多为300个字符",5,"温馨提示");
					return false;
				}
				if(/[1-9][0-9]{4}/.test(introduce)||/\w+((-|\.)\w+)*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/.test(introduce)){
					layer.alert("简介中请勿出现手机、QQ、邮箱等联系方式。",5,"温馨提示");
					return false;
				}
				
				
				if(bjlandlord==1){
					if(papertype==0){
						layer.alert("请选择证件类型",5,"温馨提示");
						return false;
					}
					
					if(null!=paperno && paperno.length>0){
						if(papertype==111){
							var checkFlag = new clsIDCard(paperno);
							if(!checkFlag.IsValid()){
								layer.alert("请输入合法证件号码",5,"温馨提示");
								return false;
							}
						}
						
						//港澳通行证
						if(papertype==516){
							var reg = /^[H|M|h|m][0-9]{10}/;
							if(!reg.test(paperno)){
								layer.alert("请输入合法的证件号码",5,"温馨提示");
								return false;
							}
						}
						
						//军官证
						if(papertype==233){
							var reg = /^[\u4e00-\u9fa5]+[0-9]+/;
							if(!reg.test(paperno)){
								layer.alert("请输入合法的证件号码",5,"温馨提示");
								return false;
							}
						}
						
						//护照
						if(papertype==414){
							if(country==0){
								layer.alert("请选择国家",5,"温馨提示");
								return false;
							}
						}
					}else{
						layer.alert("请输入证件号码",5,"温馨提示");
						return false;
					}
					
					if(country==1){
						if(nation==null||nation==''||nation==0){
							layer.alert("民族不允许为空",5,"温馨提示");
							return false;
						}
					}
				}
			}
			//进行保存，但不保存手机、邮箱
			var ctx = $('#ctx').val();
			var uid = $('#uid').val();
			var usertype = $("#usertype").val();
			var nickname = $('#nickname').val();
			var realname = $('#realname').val();
			var sex = $("#sex").val();
//			var cityid = $("#cityselect").val();
			var age=$("select[name=age]").val();
			var housetownprov=$("#housetownprov").val();
			var housetowncity=$("#housetowncity").val();
			var bloodtype=$("select[name=bloodtype]").val();
			var constellation=$("#constellation").val();
			var postdata = {nickname:nickname,realname:realname,sex:sex,
//					provinceid:provinceid,cityid:cityid,
					age:age,profession:profession,welcomes:welcomes,introduce:introduce,usertype:usertype,housetownprov:housetownprov,housetowncity:housetowncity,bloodtype:bloodtype,constellation:constellation,papertype:papertype,country:country,paperno:paperno,nation:nation};
			$.ajax({
				url : ctx+"/user/"+uid+"/updateinfo.do",
				type : 'POST',
				async:true,
				data : postdata,
				dataType:'json',
				error: function(data){
					layer.alert("保存失败，请稍候再试！",8);
				},
				success : function(data){
					if(data.error){
						layer.alert(data.error.message,8);
					}else{
						layer.alert("保存成功",9,"提示信息",function callF(){
							window.location.href=window.location.href;
						});
					}
				}
			});
		}
	});	  

//	open validemail div
	function openValidEmail(email){
		var length = email.length;
		if(length>50||!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)){
			$("#email").val("");	  		   
			layer.alert("请正确输入邮箱！",5,"温馨提示");
			return false;
		}else{//还需进行邮件是否已被绑定验证
			var ctx = $('#ctx').val();				  	   	    
			$.post(ctx+"/user/email/checkemail.do",{'email':email},function(re) {
				if(re.error!=null){
					$("#email").val("");
					layer.alert(re.error.message,5,"温馨提示");
					return false;
				}else{		  	   	   	
					$('#toemail').val(email);
					$('#toemail').attr("disabled","disabled");
					showToEmailDiv();
				}
			},'JSON');
		}
	}
//	邮箱输入框 监听
	$('#email').bind('focusout', function(){
		var email = $("#email").val();
		if(email!=null&&email!=""){	  	   
			openValidEmail(email); 
		}
	});

//	验证邮箱 按钮监听
	$('#validemail').click(function(){
		var email = $("#email").val();
		if(email!=null&&email!=""){	  	   
			openValidEmail(email);
		}else{
			layer.alert("请先填写邮箱！",5,"温馨提示");	  
		}
	});

//	修改邮箱 按钮监听
	$('#updateemail').click(function(){
		var issetpass = $('#issetpass').val();
		var isbandmobile = $('#isbandmobile').val();
		if(issetpass=="false"&&isbandmobile=="false"){
			showToEmailDiv();
		}else{
			if(isbandmobile=="false"){
				$('#emobilevalidli').remove();
				$('#epassvalidin').attr("checked","checked");
			}
			if(issetpass=="false"){
				$('#epassvalidli').remove();
				$('#emobilevalidin').attr("checked","checked");	  	  	  	
			}
			showPermissionEmailDiv();
		}
	});

//	倒计时方法
	var wait=60;
	function countdown(){
		if (wait == 0) {
			$('#egetmobilecode').attr('disabled',false);  
			$('#egetmobilecode').removeClass('alertactive-btn');  
			$('#egetmobilecode').text("重新获取");      
			wait =60;
		} else {
			$('#egetmobilecode').attr('disabled', true);
			$('#egetmobilecode').addClass('alertactive-btn');
			$('#egetmobilecode').text(wait+"s");
			wait--;
			setTimeout(
					function() {
						countdown();
					},
					1000
			);
		}
	}

//	验证邮箱时获取手机验证码
	$('#egetmobilecode').click(function(){
		countdown();//加入倒计时
		var ctx = $('#ctx').val();		
		$.get(ctx+"/user/sendmobileauthcode.do",function(re) {
			if(re.error!=null){
				layer.alert(re.error.message,5,"温馨提示");
				wait=0;					
				return false;
			}
		},'JSON');
	});

//	发送验证邮件
	$('#sendemail').click(function(){
		var email = $('#toemail').val();
		if(email!=null&&email!=""){
			if(email.length>50||!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)){
				layer.alert("请正确输入目标邮箱！",5,"温馨提示");	  				
				return false;
			}else{//还需进行邮件是否已被绑定验证
				var ctx = $('#ctx').val();				  	   	    
				$.post(ctx+"/user/email/checkemail.do",{'email':email},function(re) {
					if(re.error!=null){
						layer.alert(re.error.message,5,"温馨提示");	  				
						return false;
					}else{		  	   	   	
						$.post(ctx+"/user/email/sendemailauthcode.do",{'email':email},function(re) {
							if(re.error!=null){
								layer.alert("认证邮件发送失败！",5,"温馨提示");	  				
								return false;
							}else{		  	   	   	
								var emailurl = re.data.result;
								$('#gomaila').attr("href",emailurl);
								$('#gomailb').attr("url",emailurl);
								layer.close(toemaillayer);
								$('#gomaila').text(email);
								showViewEmailDiv();
							}
						},'JSON');
					}
				},'JSON');
			}
		}else{
			layer.alert("请先填写目标邮箱！",5,"温馨提示");	  
		}
	});

//	去邮箱认证按钮 事件
	$('#gomailb').click(function(){
		var url = $('#gomailb').attr("url");
		window.open(url);
	});

//	修改邮箱权限验证
	$('#edovalid').click(function(){
		var validtype = $("input[name=evalidtype]:checked").val();
		if(validtype=="passvalid"){//账户密码
			var epass = $('#epass').val();
			if(epass!=null&&epass!=""){
				var encrypass = $.md5(epass);
				var ctx = $('#ctx').val();	
				$.post(ctx+"/user/validpassword.do",{'encrypass':encrypass},function(re) {
					if(re.error!=null){
						layer.alert(re.error.message,5,"温馨提示");	  				
						return false;
					}else{
						if(re.data.result=="fail"){
							layer.alert("抱歉，密码错误！",5,"温馨提示");
						}else{
							$('#epass').val("");
							layer.close(permissionemaillayer);
							showToEmailDiv();
						}
					}
				},'JSON');	  	  	 
			}else{
				layer.alert("请先填写用户密码！",5,"温馨提示");	
			}
		}else{//手机
			var authcode = $('#emoblecode').val();
			if(authcode!=null&&authcode!=""){
				var ctx = $('#ctx').val();	
				$.post(ctx+"/user/validmobileauthcode.do",{'code':authcode},function(re) {
					if(re.error!=null){
						layer.alert(re.error.message,5,"温馨提示");	  				
						return false;
					}else{
						if(re.data.result!="true"){
							layer.alert("抱歉，验证码错误！",5,"温馨提示");
						}else{
							$('#emoblecode').val("");
							wait=0;
							layer.close(permissionemaillayer);
							showToEmailDiv();
						}
					}
				},'JSON');
			}else{
				layer.alert("请输入您获得的手机验证码！",5,"温馨提示");	
			}
		}	  	  
	});
//	*******************************************************开始绑定手机处理
//	-------------------------支付账号管理 start--------------------------------------------------------------------
	//增加样式(ie 特有)
	$('#aliaccountno,#tenaccountno,#bankaccountid,#rebankaccountid').css({"ime-mode":"disabled"});
	var bind_input_flag=true;
	var bind_input_name = 'input';
	if (navigator.userAgent.indexOf("MSIE") != -1){
		bind_input_name = 'propertychange';
	}
	var pTime;
	var bind_value,bind_obj;
	
	//	添加保存 账号 弹窗
	var savepaymentlayer;
	function showSavepaymentDiv(){
		savepaymentlayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			offset:['150px' , ''],
			border : [0,0,'',false],
			area : ['auto',''],
			move : ['.alert-title',true],
			page : {dom : '#savepaymentdiv'}
		});
		$('#savepaymentlayerclose').on('click',function(){
			layer.close(savepaymentlayer);
		});
	}
	
//	添加
	$('#addnewpayment').click(function(){
		//支付宝
		$('#aliaccountno').val("");
		$('#aliaccountname').val("");
		//财付通
		$('#tenaccountno').val("");
		$('#tenaccountname').val("");
		//银行
		$('#paymentidhi').val(0);
		$('#bankidhi').val(0);
		$('#bankprovinceidhi').val(0);
		$('#bankcityidhi').val(0);
		$('#bankbranchidhi').val(0);
		var bankcityselect = $('#bankcityselect');//清空城市信息
		bankcityselect.empty();
		var option = $('<option></option>').text("请选择").val(0); 
		bankcityselect.append(option);
		var bankbranchselect = $('#bankbranchselect');//清空分行信息
		bankbranchselect.empty();
		$('#bankaccountid').val("");
		$('#rebankaccountid').val("");
		$('#bankaccountname').val("");
		
		$('#showalipayui').click();//默认添加支付宝
		showSavepaymentDiv();
	});

	//切换到收款账户
	//$('#paymentli').click(function(){
	//	refPaymentTable();
		//加载结算方式
	//	loadSettlementWay();
	//});

//	加载 分行信息
	function loadbankbrach(banktypeid,provinceid,cityid){
		var bankbranchid = $('#bankbranchidhi').val();
		if(banktypeid>0){
			if(provinceid>0&&cityid>0){
				document.getElementById("bankbranchtextli").style.display = "none";
				if(bankbranchid==-1){
					document.getElementById("bankbranchtextli").style.display = "block";
				}
				var bankbranchselect = $('#bankbranchselect');
				bankbranchselect.empty();
				var ctx = $('#ctx').val();
				$.get(ctx+"/payment/"+banktypeid+"/"+provinceid+"/"+cityid+"/bankbranchlist.json",function(re) {
					if(re.data.total>0){
						var flag=0;
						if(bankbranchid==-1){
							var option = $('<option id="non"></option>').text("没有我的支行").val(-1); 
							bankbranchselect.append(option);
							flag=1;
							if($('#bankcityselect').click()||$('#bankprovinceselect').click()){
								$('#non').hide();
								flag=0;
							}
						}
						var option = $('<option ></option>').text("请选择").val(0); 
						bankbranchselect.append(option);
						for(var bankbranchinfo in re.data.bankarray){
							var bankbranch = re.data.bankarray[bankbranchinfo];
							var option = $('<option></option>').text(bankbranch.bank_name).val(bankbranch.id).attr("title",bankbranch.bank_name); 
							if(bankbranchid!=0&&bankbranchid==bankbranch.id){
								option.attr("selected","selected");
							}
							bankbranchselect.append(option);
						}
						if(flag==0){
							bankbranchselect.append($('<option ></option>').text("没有我的支行").val(-1));
						}
					}else{
						bankbranchselect.append($('<option ></option>').text("没有我的支行").val(-1));
						document.getElementById("bankbranchtextli").style.display = "block";
					}
				},'JSON');
			}else{
				$('#bankbranchselect').empty();
				var optionno = $('<option ></option>').text("没有我的支行").val(-1); 
				$('#bankbranchselect').append(optionno);
				document.getElementById("bankbranchtextli").style.display = "block";
			}
		}else{
			$('#bankbranchselect').val(0);
			document.getElementById("bankbranchtextli").style.display = "none";
			$('#bankbranchtext').val(null);
		}
	}

//	切换到 支付宝 添加
	$('#showalipayui').click(function(){
		//清除错误信息
		$('#aliaccountnoli .tooltip').remove();
		$('#aliaccountnameli .tooltip').remove();
		//清除错误信息---end----
		$('#savepaymentbtn').attr("paytype","alipay");
	});

//	切换到 财付通 添加
	$('#showtenpayui').click(function(){
		//清除错误信息
		$('#tenaccountnoli .tooltip').remove();
		$('#tenaccountnameli .tooltip').remove();
		//清除错误信息---end----
		$('#savepaymentbtn').attr("paytype","tenpay");
	});	

//	银行类型下拉单
	$('#bankselect').bind('click',function(){
		if($("#bankselect").val()==0){  
			$('#bankli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请选择开户银行</span>';
			$('#bankli').append(span);
			$('#bankprovinceselect').val(0);
			$('#bankcityselect').empty();
			$('#bankbranchselect').empty();

		}   
	});	
	$('#bankselect').change(function(){
		var banktypeid = $("#bankselect").val();
		if(banktypeid>0){   
			$('#bankli .tooltip').remove();	      	 
			var provinceid = $('#bankprovinceselect').val();
			var cityid = $('#bankcityselect').val();
			loadbankbrach(banktypeid,provinceid,cityid);//加载银行信息
		}
	});

//	加载城市信息
	function loadCitylistinfo(banktypeid,provinceid){
		var bankcityselect = $('#bankcityselect');
		var cityid =  $('#bankcityselect').val();
		bankcityselect.empty();
		$('#bankcityselect').click();
		if(provinceid==0){
			var option = $('<option></option>').text("请选择").val(0); 
			bankcityselect.append(option);
			return false;
		}else{
			$('#bankprovinceli .tooltip').remove();
			var ctx = $('#ctx').val();
			$.get(ctx+"/payment/bank/"+provinceid+"/citylist.json",function(re) {
				for (var cityinfo in re.data.cityarray){
					var city = re.data.cityarray[cityinfo];
					var option = $('<option></option>').text(city.city_name).val(city.city_id);
					if(cityid!=0&&cityid==city.city_id){
						option.attr("selected","selected");
					}
					bankcityselect.append(option);
				}
				if(banktypeid==0){
					banktypeid = $("#bankselect").val();
				}
				cityid = $("#bankcityselect").val();
				loadbankbrach(banktypeid,provinceid,cityid);//加载银行信息
			},'JSON');
		}	
	}

//	省份下拉单
//	$('#bankprovinceselect').bind('click',function(){
//	if($("#bankprovinceselect").val()==0){
//	$('#bankprovinceli .tooltip').remove();
//	var span = '<span class="tooltip ltleft">请选择开户省份</span>';
//	$('#bankprovinceli').append(span);
//	}   
//	}); //省份级联事件	  
	$("#bankprovinceselect").change(function(){
		var provinceid =$("#bankprovinceselect").val();
		loadCitylistinfo(0,provinceid);  
	});

//	城市下拉单选择时提示
	$("#bankcityselect").bind('click',function(){
		if($("#bankcityselect").val()==0){
			$('#bankcityli .tooltip').remove();
//			var span = '<span class="tooltip ltleft">请选择开户城市</span>';
//			$('#bankcityli').append(span);
		}   
	});//城市级联事件	  
	$("#bankcityselect").change(function(){
		var cityid = $('#bankcityselect').val();
		if(cityid>0){
			$('#bankcityli .tooltip').remove();
			var banktypeid = $("#bankselect").val();
			var provinceid = $('#bankprovinceselect').val();
			cityid = $('#bankcityselect').val();
			loadbankbrach(banktypeid,provinceid,cityid);//加载银行信息 
		}	   
	});

//	分行下拉单 监听
//	$('#bankbranchselect').bind('click',function(){
//	var bankbranchid = $("#bankbranchselect").val();
//	if(bankbranchid==null||bankbranchid==0){  
//	$('#bankbranchli .tooltip').remove();
//	var span = '<span class="tooltip ltleft">请选择开户支行</span>';
//	$('#bankbranchli').append(span);
//	}   
//	});
//	$("#bankbranchselect").change(function(){
//	var bankbranchid = $("#bankbranchselect").val();
//	if(bankbranchid==null||bankbranchid==0){  
//	$('#bankbranchli .tooltip').remove();
//	var span = '<span class="tooltip ltleft">请选择开户支行</span>';
//	$('#bankbranchli').append(span);
//	}else{
//	$('#bankbranchli .tooltip').remove();
//	}
//	});

//	银行卡输入框监听
	$('#bankaccountid').bind('focusin', function(){
		var bankaccountid = $('#bankaccountid').val();
		if(bankaccountid==null||bankaccountid==""){
			$('#bankaccountli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入银行卡号</span>';
			$('#bankaccountli').append(span);
		}
	});
	$('#bankaccountid').bind('focusout', function(){
		var bankaccountid = $('#bankaccountid').val();
		if(bankaccountid!=null&&bankaccountid!=""){
			$('#bankaccountli .tooltip').remove();
			if(bankaccountid.length<8){
				var span = '<span class="tooltip ltleft">银行卡号位数错误</span>';
				$('#bankaccountli').append(span);
			}
		}else{
			$('#bankaccountli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入银行卡号</span>';
			$('#bankaccountli').append(span);
		}	  	   
	});

//	银行卡输入框监听
	$('#rebankaccountid').bind('focusin', function(){
		var rebankaccountid = $('#rebankaccountid').val();
		if(rebankaccountid==null||rebankaccountid==""){
			$('#rebankaccountli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入确认帐号</span>';
			$('#rebankaccountli').append(span);
		}
	});
	$('#rebankaccountid').bind('focusout', function(){
		var rebankaccountid = $('#rebankaccountid').val();
		var bankaccountid = $('#bankaccountid').val();
		if(rebankaccountid!=null&&rebankaccountid!=""){
			$('#rebankaccountli .tooltip').remove();
			if(bankaccountid!=rebankaccountid){
				var span = '<span class="tooltip ltleft">两次账号不一致</span>';
				$('#rebankaccountli').append(span);
			}
		}else{
			$('#rebankaccountli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入确认帐号</span>';
			$('#rebankaccountli').append(span);
		}

	});

//	银行开户姓名输入框监听
	$('#bankaccountname').bind('focusin', function(){
		var bankaccountname = $('#bankaccountname').val();
		if(bankaccountname==null||bankaccountname==""){
			$('#bankaccountnameli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入户主姓名</span>';
			$('#bankaccountnameli').append(span);
		}
	});
	$('#bankaccountname').bind('focusout', function(){
		var bankaccountname = $('#bankaccountname').val();
		if(bankaccountname!=null&&bankaccountname!=""){
			$('#bankaccountnameli .tooltip').remove();
		}else{
			$('#bankaccountnameli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入户主姓名</span>';
			$('#bankaccountnameli').append(span);
		}	  	   
	});

//	加载银行类型信息
	function loadbanklistinfo(){
		var bankid = $('#bankidhi').val();
		var bankselect = $('#bankselect');
		bankselect.empty();
		var ctx = $('#ctx').val();	  			
		$.get(ctx+"/payment/banklist.json",function(re) {
			var optiond = $('<option></option>').text("请选择开户银行").val(0); 
			bankselect.append(optiond);
			var groupchina = $('<optgroup label="国内银行"></optgroup>');
			var groupout = $('<optgroup label="国外银行"></optgroup>');
			for (var bankinfo in re.data.banktypearray){
				var bank = re.data.banktypearray[bankinfo];
				var option = $('<option></option>').text(bank.name).val(bank.id); 
				if(bankid!=0&&bank.id==bankid){
					option.attr("selected","selected");
				}
				if(bank.order>=10000){
					groupout.append(option);
				}else{
					groupchina.append(option);
				}
			}
			bankselect.append(groupchina);
			bankselect.append(groupout);
		},'JSON');
	}

//	加载银行省份信息
	function loadbankprovinceinfo(){
		var bankprovinceselect = $('#bankprovinceselect');
		bankprovinceselect.empty();
		var ctx = $('#ctx').val();
		var provinceid =  $('#bankprovinceidhi').val();
		$.get(ctx+"/payment/bank/provincelist.json",function(re) {
			var optiond = $('<option></option>').text("请选择").val(0); 
			bankprovinceselect.append(optiond);
			for (var provinceinfo in re.data.provincearray){
				var province = re.data.provincearray[provinceinfo];
				var option = $('<option></option>').text(province.province_name).val(province.province_id); 
				if(provinceid!=0&&province.province_id==provinceid){
					option.attr("selected","selected");
				}
				bankprovinceselect.append(option);
			}
		},'JSON');
	}

//	切换到 银行卡 添加
	$('#showbankcardui').click(function(){
		//清除错误提示
		$('#bankli .tooltip').remove();
		$('#bankprovinceli .tooltip').remove();
		$('#bankcityli .tooltip').remove();
		$('#bankbranchli .tooltip').remove();
		$('#bankaccountli .tooltip').remove();
		$('#bankaccountli .tooltip').remove();
		$('#rebankaccountli .tooltip').remove();
		$('#rebankaccountli .tooltip').remove();
		$('#bankaccountnameli .tooltip').remove();
		$('#bankbranchtext').val(null);
		$('#bankbranchtextli .tooltip').remove();

		//清除错误提示
		$('#savepaymentbtn').attr("paytype","bankcard");
		loadbanklistinfo();//加载银行类型
		loadbankprovinceinfo();//加载省份	  		
	});

//	保存账号方法 包含 添加，编辑的处理
	function savePayment(postdata){
		var ctx = $('#ctx').val();
		var uid = $('#uid').val();
		var pid = $('#paymentidhi').val();
		var url = ctx+"/user/"+uid+"/paymentlist/addpayment.do";
		if(pid>0){
			url = ctx+"/user/"+uid+"/payment/"+pid+"/updatepayment.do";
		}
		$.ajax({
			url :url,
			type : 'POST',
			async:true,
			data : postdata,
			dataType:'json',
			timeout: 5000,
			error: function(data){
				layer.alert("保存失败，请稍候再试！",8);
			},
			success : function(data){
				if(data.error){
					layer.alert(data.error.message,8);
				}else{//1,添加行 2、关闭div 3、提示
//					var payment = data.data;
//					var row = makerow(payment);
//					$(row).appendTo($("#paymenttable"));
					layer.close(savepaymentlayer);
//					layer.alert("收款账户保存成功！",9);
					refPaymentTable();
				}
			}
		});
	}
	
//	移除提示
	$('#aliaccountno').bind('focusin', function(){
		$('#aliaccountnoli .tooltip').remove();
	});	  
	$('#aliaccountname').bind('focusin', function(){
		$('#aliaccountnameli .tooltip').remove();
	});
	$('#tenaccountno').bind('focusin', function(){
		$('#tenaccountnoli .tooltip').remove();
	});	  
	$('#tenaccountname').bind('focusin', function(){
		$('#tenaccountnameli .tooltip').remove();
	});
	
//	移除提示end
	// 输入监听
	$('#aliaccountno,#tenaccountno').bind('keyup',function(ev){
		var event = ev || window.event;
		var pos=getCursorPos(this);
		if(event.ctrlKey==false && event.keyCode != 17){
			var value=$(this).val();
			$(this).val(formatAccountNo(value));
			pos=pos-(value.length-$(this).val().length);
			setCursorPos(this,pos);
		}else{
			return false;
		}
	});
	// 输入监听
	$('#aliaccountno,#tenaccountno').bind(bind_input_name, function(){
		if(bind_input_flag != true){
			return ;
		}
		bind_input_flag=false;
		bind_obj=this;
		pTime=setTimeout(function(){
			var pos=getCursorPos(bind_obj);
			bind_value=$(bind_obj).val();
			$(bind_obj).val(formatAccountNo(bind_value));
			pos=pos-(bind_value.length-$(bind_obj).val().length);
			setCursorPos(bind_obj,pos);
			bind_input_flag=true;
		},100);
	})
	
	// 输入监听
	$('#aliaccountno,#tenaccountno').bind('paste',function(){
		$(this).val(formatAccountNo($(this).val()));
	});	
	
	//js正则实现用户输支付宝/财付通的控制及格式化
	function formatAccountNo (accountNo){
	    if (accountNo == "") return "";
	    var accountStr = new String (accountNo);
	    accountNo = accountStr.replace(new RegExp(" ","gm"),""); 
	    /* 对照格式 */
	    var accountNumeric = accountChar = "", i;
	    for (i=0;i<accountNo.length;i++){
	    	accountChar = accountNo.substr (i,1);
	    	if(/[0-9a-zA-Z_@.-]/.test(accountChar)){
	    		accountNumeric = accountNumeric + accountChar;
	    	}
	    }
	    return accountNumeric;
	}
	
//	添加支付宝账号 pre
	function saveAliPayment(){
		$('#aliaccountnoli .tooltip').remove();
		$('#aliaccountnameli .tooltip').remove();
		var aliaccountno = $('#aliaccountno').val();
		var aliaccountname =$('#aliaccountname').val();
		var cansave = true;
		if(aliaccountname==null||aliaccountname==""){
			var span = '<span class="tooltip">忘记填写支付宝账号姓名啦</span>';
			$('#aliaccountnameli').append(span);
			cansave=false;
		}
		if(aliaccountno==null||aliaccountno==""){
			var span = '<span class="tooltip">忘记填写支付宝账号啦</span>';
			$('#aliaccountnoli').append(span);
			return ;
		}
		if(/[\u4e00-\u9fa5]/.test(aliaccountno)||/[\s]/.test(aliaccountno)){
			var span = '<span class="tooltip">支付宝账号不能含有汉字或空格</span>';
			$('#aliaccountnoli').append(span);
			return ;
		}
		if(/@yahoo.com|@yahoo.cn/i.test(aliaccountno)){
			var span = '<span class="tooltip">支付宝账号不支持Yahoo邮箱打款，请更换其他账号</span>';
			$('#aliaccountnoli').append(span);
			return ;
		}
		if(cansave){
			var postdata = {paytype:'alipay',aliaccountno:aliaccountno,aliaccountname:aliaccountname};
			savePayment(postdata);
		}
	}

//	添加财付通账号 pre
	function saveTenPayment(){
		$('#tenaccountnoli .tooltip').remove();
		$('#tenaccountnameli .tooltip').remove();
		var tenaccountno = $('#tenaccountno').val();
		var tenaccountname =$('#tenaccountname').val();
		var cansave = true;
		if(tenaccountname==null||tenaccountname==""){
			var span = '<span class="tooltip">忘记填写财付通账号姓名啦</span>';
			$('#tenaccountnameli').append(span);
			cansave = false;
		}
		if(tenaccountno==null||tenaccountno==""){
			var span = '<span class="tooltip">忘记填写财付通账号啦</span>';
			$('#tenaccountnoli').append(span);
			return ;
		}
		if(/[\u4e00-\u9fa5]/.test(tenaccountno)||/[\s]/.test(tenaccountno)){
			var span = '<span class="tooltip">财付通账号不能含有汉字或空格</span>';
			$('#tenaccountnoli').append(span);
			return ;
		}
		if(/@yahoo.com|@yahoo.cn/i.test(tenaccountno)){
			var span = '<span class="tooltip">财付通账号不支持Yahoo邮箱打款，请更换其他账号</span>';
			$('#tenaccountnoli').append(span);
			return ;
		}
		if(cansave){
			var postdata = {paytype:'tenpay',tenaccountno:tenaccountno,tenaccountname:tenaccountname};
			savePayment(postdata);
		}	
	}

	// 输入监听
	$("#bankaccountid,#rebankaccountid").bind('keyup',function(ev){
		var event = ev || window.event;
		var pos=getCursorPos(this);
		if(event.ctrlKey==false && event.keyCode != 17){
			var value=$(this).val();
			$(this).val(formatBankNo(value));
			pos=pos-(value.length-$(this).val().length);
			setCursorPos(this,pos);
		}else{
			return false;
		}
	});
	
	//js input value值变化 
	$('#bankaccountid,#rebankaccountid').bind(bind_input_name, function(){
		if(bind_input_flag != true){
			return ;
		}
		bind_input_flag=false;
		bind_obj=this;
		pTime=setTimeout(function(){
			var pos=getCursorPos(bind_obj);
			bind_value=$(bind_obj).val();
			$(bind_obj).val(formatBankNo(bind_value));
			pos=pos-(bind_value.length-$(bind_obj).val().length);
			setCursorPos(bind_obj,pos);
			bind_input_flag=true;
		},100);
	});
	
	$("#bankaccountid,#rebankaccountid").bind('paste',function(){
		$(this).val(formatBankNo($(this).val()));
	});
	
	//js正则实现用户输入银行卡号的控制及格式化
	function formatBankNo (bankNo){
	    if (bankNo == "") return "";
	    var noStr = new String (bankNo);
	    bankNo = noStr.replace(new RegExp(" ","gm"),""); 
	    /* 对照格式 */
	    var bankNumeric = bankChar = "", i;
	    for (i=0;i<bankNo.length;i++){
	    	bankChar = bankNo.substr (i,1);
	    	if(/[0-9]/.test(bankChar)){
	    		bankNumeric = bankNumeric + bankChar;
	    	}
	    }
	    bankNumeric=bankNumeric.length>22 ? bankNumeric.substr(0,22) : bankNumeric
	    bankNo = "";
	    for (i=0;i<bankNumeric.length;i++){    /* 可将以下空格改为-,效果也不错 */
	    	if (i != 0 && i%4 == 0) bankNo = bankNo + " "; /* 帐号每四位数后加空格 */
	    	bankNo = bankNo + bankNumeric.substr (i,1)
	    }
	    return bankNo;
	}
	
//	添加银行卡账号 pre
	function saveBankPayment(){
		var banktypeid = $('#bankselect').val();
		var cansave = true;
		if(banktypeid==0){  
			$('#bankli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请选择开户银行</span>';
			$('#bankli').append(span);
			cansave = false;
		}
		var bankprovinceid = $("#bankprovinceselect").val();
		if(bankprovinceid==0){
			$('#bankprovinceli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请选择开户省份</span>';
			$('#bankprovinceli').append(span);
			cansave = false;
		}
		var bankcityid = $("#bankcityselect").val();
		if(bankcityid==0){
			$('#bankcityli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请选择开户城市</span>';
			$('#bankcityli').append(span);
			cansave = false;
		} 
		var bankbranchid = $("#bankbranchselect").val();
		var bankbranchtext;
		if(bankbranchid==null||bankbranchid==0||bankbranchid==-1){
			if(bankbranchid==0){
				$('#bankbranchli .tooltip').remove();
				var span = '<span class="tooltip ltleft">请选择开户支行</span>';
				$('#bankbranchli').append(span);
				cansave = false;
			}

			bankbranchtext=$("#bankbranchtext").val();
			if(bankbranchtext==null||bankbranchtext==''){
				var span = '<span class="tooltip ltleft">支行不能为空</span>';
				$('#bankbranchtextli').append(span);
				cansave = false;
			}
		}
		var bankaccountid = $('#bankaccountid').val().replace(new RegExp(" ","gm"),"");
		if(bankaccountid!=null&&bankaccountid!=""){
			$('#bankaccountli .tooltip').remove();
			if(bankaccountid.length<8){
				var span = '<span class="tooltip ltleft">银行卡号位数错误</span>';
				$('#bankaccountli').append(span);
				cansave = false;
			}
		}else{
			$('#bankaccountli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入银行卡号</span>';
			$('#bankaccountli').append(span);
			cansave = false;
		}
		var rebankaccountid = $('#rebankaccountid').val().replace(new RegExp(" ","gm"),"");
		if(rebankaccountid!=null&&rebankaccountid!=""){
			$('#rebankaccountli .tooltip').remove();
			if(bankaccountid!=rebankaccountid){
				var span = '<span class="tooltip ltleft">两次账号不一致</span>';
				$('#rebankaccountli').append(span);
				cansave = false;
			}
		}else{
			$('#rebankaccountli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入确认帐号</span>';
			$('#rebankaccountli').append(span);
			cansave = false;
		}
		var bankaccountname = $('#bankaccountname').val();
		if(bankaccountname==null||bankaccountname==""){
			$('#bankaccountnameli .tooltip').remove();
			var span = '<span class="tooltip ltleft">请输入户主姓名</span>';
			$('#bankaccountnameli').append(span);
			cansave = false;
		}
		if(cansave){
			var postdata = {paytype:'bankcard',banktypeid:banktypeid,bankprovinceid:bankprovinceid,bankcityid:bankcityid,bankbranchid:bankbranchid,bankbranchtext:bankbranchtext,bankaccountid:bankaccountid,bankaccountname:bankaccountname};
			savePayment(postdata);
		}	
	}

//	点击保存账号 按钮
	$('#savepaymentbtn').click(function(){
		var paytype = $('#savepaymentbtn').attr("paytype");
		if(paytype=="alipay"){
			saveAliPayment();
		}else if(paytype=="tenpay"){
			saveTenPayment(); 
		}else{
			saveBankPayment();
		}  	  
	});

//	设置默认收款账号
	function setDefaultPayment(pid){
		var ctx = $('#ctx').val();
		var uid = $('#uid').val();
		$.ajax({
			url : ctx+"/user/"+uid+"/payment/"+pid+"/setdefaultpayment.do",
			type : 'POST',
			async:true,
			dataType:'json',
			timeout: 5000,
			error: function(data){
				layer.alert("设置失败，请稍候再试！",8);
			},
			success : function(data){
				if(data.error){
					layer.alert(data.error.message,8);
				}else{
					refPaymentTable();
				}
			}
		});
	}

	//删除收款账号
	function delPayment(pid){
		var ctx = $('#ctx').val();
		var uid = $('#uid').val();
		$.ajax({
			url : ctx+"/user/"+uid+"/payment/"+pid+"/deletepayment.do",
			type : 'POST',
			async:true,
			dataType:'json',
			timeout: 5000,
			error: function(data){
				layer.alert("删除失败，请稍候再试！",8);
			},
			success : function(data){
				if(data.error){
					layer.alert(data.error.message,8);
				}else{
					refPaymentTable();
//					$("#ptr"+pid).remove();
				}
			}
		});
	}

	//修改收款账号方法
	function updatePayment(pid){ //先插入，再删除  insertAfter
		var ctx = $('#ctx').val();
		var uid = $('#uid').val();
		$.ajax({
			url : ctx+"/user/"+uid+"/payment/"+pid+".json",
			type : 'POST',
			async:true,
			dataType:'json',
			timeout: 5000,
			error: function(data){
				layer.alert("获取收款账号详情失败，请稍候再试！",8);
			},
			success : function(data){
				if(data.error){
					layer.alert(data.error.message,8);
				}else{//初始化各下拉单
					//清空信息------------
					//支付宝
					$('#aliaccountno').val("");
					$('#aliaccountname').val("");
					//财付通
					$('#tenaccountno').val("");
					$('#tenaccountname').val("");
					//银行
					$('#paymentidhi').val(0);
					$('#bankidhi').val(0);
					$('#bankprovinceidhi').val(0);
					$('#bankcityidhi').val(0);
					$('#bankbranchidhi').val(0);
					$('#bankaccountid').val("");
					$('#rebankaccountid').val("");
					$('#bankaccountname').val("");
					//清空信息------------end
					//赋值
					$('#paymentidhi').val(pid);
					var payment = data.data;
					var paytype = payment.paytype;
					if(paytype=="alipay"){
						$('#showalipayui').click();
						$('#aliaccountno').val(payment.bankaccountid);
						$('#aliaccountname').val(payment.bankaccountname);
					}else if(paytype=="tenpay"){
						$('#showtenpayui').click();
						$('#tenaccountno').val(payment.bankaccountid);
						$('#tenaccountname').val(payment.bankaccountname);
					}else{
						$('#bankidhi').val(payment.bankid);
						$('#bankprovinceidhi').val(payment.bankprovice);
						$('#bankcityidhi').val(payment.bankcity);
						$('#bankbranchidhi').val(payment.bankbranchid);
						$('#showbankcardui').click();//这里会加载银行和 省份信息		
						loadCitylistinfo(payment.bankid,payment.bankprovice);//加载城市，并同时加载 支行信息				    	
						$('#bankaccountid').val(formatBankNo(payment.bankaccountid));
						$('#rebankaccountid').val(formatBankNo(payment.bankaccountid));
						$('#bankaccountname').val(payment.bankaccountname);
						if(payment.bankbranchid==-1){
							$('#bankbranchtext').val(payment.bankbranchname);
							document.getElementById("bankbranchtextli").style.display = "block";
						}
					}
					showSavepaymentDiv();//打开窗口
				}
			}
		});
	}	 

//	修改 或 删除方法
	$("#paymenttable").click(function(e) {
		var pid = $(e.target).attr('paymentid');
		if($(e.target).hasClass("del")){
			showMphoneVerification("del",pid);
		}else if($(e.target).hasClass("edit")){
			if(paytype=="tenpay") {
				layer.alert("蚂蚁将不再支持“财付通”收款方式，请您设置为“支付宝”或“银行卡”",8);
			}else{
				showMphoneVerification("edit",pid);
			}
		}else if($(e.target).hasClass("setdefault")){
			var paytype = $(e.target).attr('paytype');
			if(paytype=="tenpay") {
				layer.alert("蚂蚁将不再支持“财付通”收款方式，请您设置为“支付宝”或“银行卡”",8);
			}else{
				showMphoneVerification("setdefault",pid);
			}
			
		}
	});
	
	//倒计时方法
	var paymentWait=60;
	var paymentTimeout;
	function paymentTime(){
		if (paymentWait == 0) {
			$("#btnSendCode").removeClass("sending");
			$("#btnSendCode").addClass("defaultsend");
			$("#btnSendCode").val("重新获取");				
			paymentWait =60;
		} else {
			$("#btnSendCode").removeClass("defaultsend");
			$("#btnSendCode").addClass("sending");
			$("#btnSendCode").val(paymentWait+"s");
			paymentWait--;
			paymentTimeout = setTimeout(function() {
					paymentTime();
				},
				1000
			);
		}
	}
	//	手机验证弹窗
	var MphoneVerificationlayer;
	function showMphoneVerification(type,pid){
		//恢复初始状态
		$("#imgCode").attr("src",getAuthSrc());
		$("#checkPic").val("");
		$("#checkPic").siblings().removeClass("icon_add_red").removeClass("icon_add_green");
		$(".for_disable").hide();
		$("#checkCode").val("");
		$("#btnSendCode").removeClass("on");
		$("#btnSendCode").removeClass("sending");
		$("#btnSendCode").addClass("defaultsend");
		clearInterval(paymentTimeout);
		paymentWait = 60;
		$("#btnSendCode").val("获取验证码");				
		$(".vertifyAlert").show().html("");

		MphoneVerificationlayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			offset:['200px' , ''],
			border : [0,0,'',false],
			area : ['auto',''],
			move : ['.alert-title',true],
			page : {dom : '#MphoneVerification'}
		});
		$('#MphoneVerificationlayerclose,#MphoneVerification .complete_cancel').on('click',function(){
			layer.close(MphoneVerificationlayer);
		});
		$('#MphoneVerification .complete_success').unbind().on('click',function(){
			var ctx = $('#ctx').val();	
			var authcode = $("#checkCode").val();
			if($("#checkCode").val().length == 6){  
				$.post(ctx+"/user/payment/validpaymentmobileauthcode.do",{'code':authcode},function(re) {
					if(re.error!=null){
						layer.alert(re.error.message,5,"温馨提示");	  				
						return false;
					}else{
						layer.close(MphoneVerificationlayer);
						if(type=="edit"){
							updatePayment(pid);
						}else if(type=="setdefault"){
							setDefaultPayment(pid);
						}else if(type=="del"){
							showDelpaymentDiv(pid);
						}
					}
				},'JSON');
			}else{
				$(".vertifyAlert").show().html("请填写6位短信验证码!");
			}
		});
	}
	
	//	删除确认弹窗
	var delpaymentlayer;
	function showDelpaymentDiv(pid){
		delpaymentlayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			offset:['250px' , ''],
			border : [0,0,'',false],
			area : ['auto',''],
			move : ['.alert-title',false],
			page : {dom : '#delpaymentdiv'}
		});
		$('#delpaymentdiv .complete_cancel').on('click',function(){
			layer.close(delpaymentlayer);
		});
		
		$("#delpaymentdiv .complete_success").unbind().on('click',function(e){
			delPayment(pid);
			layer.close(delpaymentlayer);
		});
	}

	
	function getAuthSrc(){
		var randomNum=""; 
		for(var i=0;i<4;i++){ 
			randomNum+=Math.floor(Math.random()*10); 
		} 
		var ctx = $('#ctx').val();
		return ctx+"/common/authimage?random="+randomNum+"&width=130&height=38";
	}
	
	$("#imgCode").on("click",function(){
		changeImgCode(this);
	});
	
	$(".imgVertifyAnswer i").on("click",function(){
		$("#checkPic").val("");
		$(this).hide();
	});
	
	function changeImgCode(obj){
		$(obj).attr("src",getAuthSrc);
	}
	
	//图形验证码正确才能发送手机验证码			
	$("#checkPic").on('input propertychange', function() {
		$(".vertifyAlert").show().html("");
		if($(this).val().length == 4 ){
			if($("#btnSendCode").hasClass("on")){
				return ;
			}
			var inputCode = document.getElementById("checkPic").value; //取得输入的验证码并转化为大写        
			var postdata = {"imagecode":inputCode};
			var ctx = $('#ctx').val();
			$.post(ctx+"/user/payment/validateImgCode",{"imagecode":inputCode},function(re) {
				if(re.error != null){
					$("#checkPic").next("i").addClass("icon_add_red").show();
					$(".vertifyAlert").show().html("图形验证码输入错误！");
					$("#imgCode").attr("src",getAuthSrc());
				}else{
					$("#checkPic").next("i").removeClass("icon_add_red").addClass("icon_add_green").show();
					$("#btnSendCode").addClass("on");
					$(".for_disable").show();
					$("#checkPic").val(inputCode);
					$("#checkPic").blur();
				}
			},'JSON');
		}else{
	   		$(this).next("i").hide();
		}
	})
	
	//发送手机验证码
	$("#btnSendCode").click(function(){
		if($("#btnSendCode").hasClass("sending")){
			return false;
		} 		      
		if($("#btnSendCode").hasClass("on")){ 
			$("#checkCode").attr("readonly",false);
			paymentTime();//加入倒计时
			var ctx = $('#ctx').val();
			$.get(ctx+"/user/payment/sendpaymentauthcode.do",function(re) {
				if(re.error!=null){
					layer.alert(re.error.message,5,"温馨提示");
					paymentWait=0;					
					return false;
				}else{
					$(".vertifyAlert").show().html("已给"+re.data.result+"发送手机验证码!"); 
				}
			},'JSON');
		}else{ 
		}
	});
//	-------------------------支付账号管理 end----------------------------------------------------------------------

//	-------------------------密码设置 start-----------------------------------------------------------------------	  
//	密码安全性校验
	function is_complex_password(str) { 
		var n = str.length; 
		if ( n < 6 ) { return false; } 
		var cc = 0, c_step = 0; 
		for (var i=0; i<n; ++i) {
			if ( str.charCodeAt(i) == str.charCodeAt(0) ) { ++ cc; } 
			if ( i > 0 && str.charCodeAt(i) == str.charCodeAt(i-1)+1) { ++ c_step; }
		}
		if ( cc == n || c_step == n-1) { return false; } 
		return true; 
	}

//	权限类型单选按钮
	var hastype4mobile = document.getElementById("type4mobile");
	if(hastype4mobile){
		$('#type4mobile').click(function(){
			var display= $("#validmobileli").css("display");
			if(null!=display&&display=="none"){
				$("#validmobileli").css("display","block");
				$("#validoldpassli").css("display","none");
			}
		});

		$('#type4pass').click(function(){
			var display= $("#validoldpassli").css("display");
			if(null!=display&&display=="none"){
				$("#validoldpassli").css("display","block");
				$("#validmobileli").css("display","none");
			}
		});
	}

//	检查新密码
	function checknewpass(newpass){
		var length = newpass.length;
		if(length<6||length>16){
			$('#newpassspan').attr("class","prompterror");
			$('#newpassspan').text("新密码须为6-16个字符");
			return false;
		}else if(!is_complex_password(newpass)){
			$('#newpassspan').attr("class","prompterror");
			$('#newpassspan').text(" 为保证安全，密码不能使用连续、重复的字母、数字");
			return false;
		}else{
			return true;
		}
	}

	$('#newpass').bind('focusout', function(){
		var newpass = $("#newpass").val();
		checknewpass(newpass);
	});

	$('#newpass').bind('focusin', function(){
		$('#newpassspan').attr("class","prompt");
		$('#newpassspan').text("6-16个字符");
	});	  

//	检查重复密码
	function checkrepass(){
		var newpass = $("#newpass").val();
		var repass=$('#repass').val();
		if(repass==null||repass==""){
			$('#repassspan').attr("class","prompterror");
			$('#repassspan').text("重复输入一次密码");
			return false;
		}else if(newpass!=repass){
			$('#repassspan').attr("class","prompterror");
			$('#repassspan').text("两次密码不一致");
			return false;
		}else{
			return true;
		}
	}

	$('#repass').bind('focusout', function(){
		checkrepass();
	});

	$('#repass').bind('focusin', function(){
		$('#repassspan').attr("class","prompt");
		$('#repassspan').text("重复输入一次密码");
	});

//	设置密码 获取验证码 倒计时方法
	var setpmwait=60;
	function time4setpm(){
		if (setpmwait == 0) {
			$('#getSetPassValidCode').attr('disabled',false);  
			$('#getSetPassValidCode').removeClass('alertactive-btn');  
			$('#getSetPassValidCode').val("重新获取"); 
			setpmwait =60;
		} else {
			$('#getSetPassValidCode').attr('disabled', true);
			$('#getSetPassValidCode').addClass('alertactive-btn');
			$('#getSetPassValidCode').val(setpmwait+"s");				
			setpmwait--;
			setTimeout(
					function() {
						time4setpm();
					},
					1000
			);
		}
	}	  	  

//	如果有获取验证码元素才加载事件
	var hasSetpass = document.getElementById("getSetPassValidCode");
	if (hasSetpass) {
		hasSetpass.onclick=function(){	  
			time4setpm();//加入倒计时
			var ctx = $('#ctx').val();		
			$.get(ctx+"/user/sendmobileauthcode.do",function(re) {
				if(re.error!=null){
					layer.alert(re.error.message,5,"温馨提示");
					setpmwait=0;					
					return false;
				}
			},'JSON');
		}
	}

//	保存密码
	$('#savepassbtn').click(function(){
		var newpass = $("#newpass").val();
		var repass=$('#repass').val();
		var cnewpass = checknewpass(newpass);
		var crepass = checkrepass();
		if(cnewpass&&cnewpass){
			$.ajax({
				url : "../us.action?op=upUserPwd&userName="+$("#userName").val()+"&userPwd="+repass,
				type : 'POST',
				async:true,
				dataType:'text',
				timeout: 5000,
				error: function(data){
					layer.alert("保存失败，请稍候再试！",8);
				},
				success : function(data){
					if("false"==data){
						layer.alert(data.error.message,8);
					}else{
						$("#newpass").val("");
						$('#repass').val("");
						layer.alert("密码保存成功！",9);
					}
				}
			});
		}else{
			return false;
		}
	});
//	-------------------------密码设置 end-------------------------------------------------------------------------

//	-------------------------优惠劵 START-------------------------------------------------------------------------
//	优惠劵 详情 弹窗
	function showProdetailDiv(){
		var prodetaillayer = $.layer({
			closeBtn : [0 , false],
			type : 1,
			title : false,
			offset:['150px' , ''],
			border : [0,0,'',false],
			area : ['auto','auto'],
			// move : ['.d-h3',true],
			page : {dom : '#prodetaildiv'}
		});
		$('#prodetaildivclose').on('click',function(){
			layer.close(prodetaillayer);
		});

		$('#prodetaildivbtn').on('click',function(){
			layer.close(prodetaillayer);
		});
	}

//	生成一行优惠劵数据
	function makeprorow(promotion){
		var staStr = '<span class="none">已使用</span>';
		if(promotion.status==1){
			staStr = '未使用';
		}else if(promotion.status==3){
			staStr = '已失效';
		}else if(promotion.status==4){
			staStr = '未到有效期';
		}
		var serial = promotion.serialNumber;
		var parvalue = promotion.parValue;
		var show ='';
		if(promotion.type==1&&promotion.status==2){
			show ='<a href="javascript:void(0)" class="handle showdetail" promotionid="'+promotion.id+'" serial="'+serial+'" parvalue="'+parvalue+'" >查看详情</a>';
		}else if(typeof(promotion.daypricerule) != "undefined"&&promotion.type==2&&promotion.daypricerule==1){
			show ='<a href="javascript:void(0)">仅在PC端使用,日价需高于'+promotion.usecondition/100+'元<br>本券只抵扣一天的线上支付金额</a>';
		}else if(promotion.type==2 && promotion.typeAlias=="续订券"){
			show ='该券在预订成功后<br>入住日当天12:00开始生效';
		}
		
		var validDate = promotion.validDate;
		if(promotion.type==2 && promotion.status==4 && promotion.activityid==0)
		{
			validDate = "";
		}
		
		var row = '<tr>'+
		'<td>'+serial+'</td>'+
		'<td>'+promotion.typeAlias+'</td>'+
		'<td>'+parvalue+'</td>'+
		'<td>'+staStr+'</td>'+
		'<td>'+validDate+'</td>'+
		'<td>'+show+'</td>'+
		'</tr>';
		return row;
	}

//	刷新收款账号table
	function refPromotionTable(type,status){
		$("#promotiontable tr:not(:first)").remove();  	  
		var ctx = $('#ctx').val();
		var uid = $('#uid').val();
		$.post(ctx+"/user/"+uid+"/promotionlist.json",{type:type,status:status},function(re) {
			if(re.error!=null){
				layer.alert(re.error.message,5,"温馨提示");
				return false;
			}else{
				if(re.total>0){
					var rownum = 0;
					for (var promotioninfo in re.data){
						var promotion = re.data[promotioninfo];
						var row = makeprorow(promotion);
						$(row).insertAfter($("#promotiontable tr:eq("+rownum+")"));
						rownum += 1;
					}
				}
			}
		},'JSON');
	}

//	点击优惠劵tab 
	$('#promotionli').click(function(){
		refPromotionTable(0,0); 
	});

//	类型选择
	$('.selectradio').click(function(){
		var type = $("input[name=SelectCoupon]:checked").val();
		$("#status").val(0);
		refPromotionTable(type,0);
	});

//	状态选择
	$('#status').change(function(){
		var type = $("input[name=SelectCoupon]:checked").val();
		var status = $('#status').val();
		refPromotionTable(type,status);
	});

//	生成一行优惠劵使用情况数据
	function makeprodetailrow(prodetail){
		var row = '<tr>'+
		'<td>'+prodetail.usedDay+'</td>'+
		'<td>'+prodetail.bookOrderId+'</td>'+
		'<td>'+prodetail.usedAmount+'元</td>'+
		// '<td>'+prodetail.remainingAmount+'</td>'+
		'</tr>';
		return row;
	}

//	查看详情
	$("#promotiontable").click(function(e) {
		if($(e.target).hasClass("showdetail")){
			var promotionid = $(e.target).attr("promotionid");
			var serial = $(e.target).attr("serial");
			var parvalue = $(e.target).attr("parvalue"); 
			$("#promdetailtable tr:not(:first)").remove();  	  
			var ctx = $('#ctx').val();
			var uid = $('#uid').val();
			$.get(ctx+"/user/"+uid+"/"+promotionid+"/promotiondetail.json",function(re) {
				if(re.error!=null){
					layer.alert(re.error.message,5,"温馨提示");
					return false;
				}else{
					if(re.total>0){
						var rownum = 0;
						for (var prodetailinfo in re.data){
							var prodetail = re.data[prodetailinfo];
							var row = makeprodetailrow(prodetail);
							$(row).insertAfter($("#promdetailtable tr:eq("+rownum+")"));
							rownum += 1;
						}
						$('#serialnosp').text("序列号："+serial);
						$('#parsp').text("面值："+parvalue);
						showProdetailDiv();
					}else{
						layer.alert("暂无使用记录！",8,"温馨提示");
					}
				}
			},'JSON');

		}
	});

//	-------------------------优惠劵 END-------------------------------------------------------------------------
	$('#bankbranchselect').change(function() {
		if (this.options[this.selectedIndex].text == "没有我的支行") {
			document.getElementById("bankbranchtextli").style.display = "block";
		}else{
			document.getElementById("bankbranchtextli").style.display = "none";
			$('#bankbranchtext').val(null);
		}
	});

	$(".xclose_btn").click(function(){
		var ctx = $('#ctx').val();
		$.ajax({
			url : ctx+"/user/updateNoticeState.do",
			type : 'POST',
			data : {type:"2"},
			async:true,
			error: function(data){
				layer.alert("请稍后再试！",8,"温馨提示");
			},
			success : function(data){
				if(data == "error"){
					layer.alert("系统繁忙，请稍后再试！",8,"温馨提示");
				}else{
					$(".new_box").hide();
				}
			}
		});
	});
	
	//--------------------------------------芝麻信用--------------------------------------------
	var checkTime,checkNum=0;
	
	function checkSq(){
		checkNum=checkNum+1;
		if(checkNum >= 20){
			clearInterval(checkTime);
		}
		var ctx = $('#ctx').val();
		$.ajax({
			type: 'post',
			url: ctx+'/zmxy/checkSq',
			async:false,
			success: function(d) {
				if(d == 1){
					window.location.reload();
				}
			}
		});
	}
	
	$(".zhima_des .shouquan").click(function(){
		checkSq();
		$(".name_input").val("");
		$(".shenfen_input").val("");
		$(".safedetails,.shenfen_info").show();
	})
	$(".shenfen_info .close_current").click(function(){
		$(".name_input").val("");
		$(".shenfen_input").val("");
		$(".safedetails,.shenfen_info").hide();
	})
	$(".shouquan_sucess .close_current").click(function(){
		var ss=parseInt($("#xinyong_score").html());
		$("#zhima_score_result").html(ss);
		$(".safedetails,.shenfen_info").hide();
	})
	
	
	$("#zhima_score_result").hover(function(){
		$(".zhima_des").show();
	},function(){
		$("body,html").click(function(){
			$(".zhima_des").hide();	
		})				
	})
	
	$("#zm_no_help").click(function(){
      $("#zm_no_why").show();
        $("#zm_btn_close").click(function(){
            $("#zm_no_why").hide();
        })
    })
	
	$(".name_input").bind('focusout', function(){
		checkName($(this).val());
	});
	
	function checkName(name){
		if(name =="" || name ==null){
			$(".name_input").next(".alert_word").html("姓名不能为空").show();
			return false;
		}
		$(".name_input").next(".alert_word").hide();
		return true;
	}
	
	$(".shenfen_input").bind('focusout', function(){
		checkIdcard($(this).val());
	});
	
	function checkIdcard(idcard){
		if(idcard =="" || idcard ==null){
			$(".shenfen_input").next(".alert_word").html("身份证号不能为空").show();
			return false;
		}
		var checkFlag = new clsIDCard(idcard);   	   
		if(!checkFlag.IsValid()){
			$(".shenfen_input").next(".alert_word").html("身份证号有误，请重新填写").show();
			return false;
		}
		$(".shenfen_input").next(".alert_word").hide();
		return true;
	}
	
	
	$("#id_test").click(function(){
		var certName=$(".name_input").val();
		var certNo=$(".shenfen_input").val();
		if(checkName(certName) & checkIdcard(certNo)){
			var usertype = $("#usertype").val();
			var d={"certNo": certNo,"certName": certName,"type":(usertype == "landlord"?2:8)};
			var ctx = $('#ctx').val();
			$.ajax({
				type: 'post',
				url: ctx+'/zmxy/getAuthUrl',
				data: d,
				async:false,
				success: function(d) {
					if (d.code==200) {
//						$("#id_test").attr("href",d.data);
						var newTab=window.open('about:blank');
						newTab.location.href=d.data;
						$(".safedetails,.shenfen_info").hide();
						checkNum=0;
						checkTime = setInterval(checkSq,3000);
					} else {
						$(".name_input").next(".alert_word").hide();
						$(".shenfen_input").next(".alert_word").html(d.data).show();
					}
				},
				error:function(){
					$(".shenfen_input").next(".alert_word").html("访问失败了，请重试").show();
				}
			});
		}
	});
	
	//设置默认收款方式
	$(".setdefault_way").click(function(e) 
	{
		var settlementWay = $(e.target).attr('paywayid');
		if(settlementWay == "order")
		{
			$(".c22bb62").html("订单结算");
		}else if(settlementWay == "day")
		{
			$(".c22bb62").html("日期结算");
		}
		showSettlementWayDiv(settlementWay);
	});
});

//生成一行数据
function makerow(payment){
	var paytype = payment.paytype;
	var paytypecn = payment.bankname+"（银行卡）";
	if(paytype=="alipay"){
		paytypecn = "支付宝";
	}else if(paytype=="tenpay"){
		paytypecn = "财付通";
	}
	
//	var defaulttd ='<td><a  paymentid="'+payment.id+'" class="handle setdefault" href="javascript:void(0)">设为默认</a></td>';
//	if(payment.defaultpayflag=="yes"){
//		defaulttd='<td>默认账户</td>';
//	}
//	var row = '<tr id="ptr'+payment.id+'">'+
//	'<td>'+paytypecn+'</td>'+
//	'<td>'+payment.bankaccountid+'</td>'+
//	'<td>'+payment.bankaccountname+'</td>'+
//	defaulttd+
//	'<td><a  paymentid="'+payment.id+'" class="handle edit" href="javascript:void(0)">[修改]</a><a paymentid="'+payment.id+'" class="handle del" href="javascript:void(0)">[删除]</a></td>'+
//	'</tr>';
	
	var payTypeElement = '<p>收款方式：' + paytypecn + '</p>';
	var operationElement = '<a class="edit" paytype="'+paytype+'" paymentid="' + payment.id + '" href="javascript:void(0)">编辑</a>' 
	 + '<a class="del" paymentid="' + payment.id + '" href="javascript:void(0)">删除</a>' 
	 + '<a class="setdefault" paytype="'+paytype+'" paymentid="' + payment.id + '" href="javascript:void(0)">设为默认</a>';
	
	//默认账户
	if(payment.defaultpayflag=="yes")
	{
		payTypeElement = '<p>收款方式：' + paytypecn + '<i class="defaultSetImg" style="display:inline-block" >默认</i></p>';
		operationElement = '<a class="edit" paytype="'+paytype+'" paymentid="' + payment.id + '" href="javascript:void(0)">编辑</a>';
	}
	
	if(paytype=="tenpay") {
		operationElement = '<a class="del" paymentid="' + payment.id + '" href="javascript:void(0)">删除</a>';
	}
	
	var row = '<div class="CollectSet_box">'
	+ payTypeElement
	+ '<p>' + payment.bankaccountid + '</p>'
	+ '<p>' + payment.bankaccountname + '</p>'
	+ '<p class="CollectCount">'
	+ operationElement
	+ '</p></div>';
	
	return row;
}

//刷新收款账号table
function refPaymentTable(){
	$("#paymenttable").empty();  	  
	var ctx = $('#ctx').val();
	var uid = $('#uid').val();
	$.get(ctx+"/user/"+uid+"/paymentlist.json",function(re) {
		if(re.error!=null){
			layer.alert(re.error.message,5,"温馨提示");
			return false;
		}else{
			if(re.data.total>0){
				for (var paymentinfo in re.data.paymentarray){
					var payment = re.data.paymentarray[paymentinfo];
					var row = makerow(payment);
					$(row).appendTo($("#paymenttable"));
					var s_receive1 = getCookie("s_receive");
					if(s_receive1=="false"){
						$(".edit").hide();
						$(".del").hide();
						$(".setdefault").hide();
					}					
				}
			}
		}
	},'JSON');
}

//加载结算方式
function loadSettlementWay(){
	var ctx = $('#ctx').val();
	var uid = $('#uid').val();
	$.get(ctx+"/user/"+uid+"/getSettlementWay",function(re) {
		if(re.state){
			if(re.settlementWay == 1){
				$(".defaultSetImg.order").css("display","inline-block");
				$(".setdefault_way.order").hide();
				$(".defaultSetImg.day").css("display","");
				$(".setdefault_way.day").show();
			}else if(re.settlementWay == 2){
				$(".defaultSetImg.order").css("display","");
				$(".setdefault_way.order").show();
				$(".defaultSetImg.day").css("display","inline-block");
				$(".setdefault_way.day").hide();
			}
			var s_receive1 = getCookie("s_receive");
			if(s_receive1=="false"){
				$(".setdefault_way.order").hide();
				$(".setdefault_way.day").hide();				
			};
		}
	},'JSON');	
}

//修改默认结算方式
function setSettlementWay(settlementWay){
	var ctx = $('#ctx').val();
	var uid = $('#uid').val();
	var postdata = {settlementWay:settlementWay};
	$.ajax({
		url : ctx+"/user/"+uid+"/setSettlementWay",
		type : 'POST',
		async:true,
		data : postdata,
		dataType:'json',
		error: function(data){
			layer.alert("修改默认结算方式失败！",8);
		},
		success : function(data){
			if(data.state){
				loadSettlementWay();
			}else{
				layer.alert("修改默认结算方式失败！",8);
			}
		}
	});
}

function showSettlementWayDiv(settlementWay){
	showSetdefaultWaylayer = $.layer({
		closeBtn : [0 , false],
		type : 1,
		title : false,
		offset:['250px' , ''],
		border : [0,0,'',false],
		area : ['auto',''],
		move : ['.alert-title',false],
		page : {dom : '#showSetdefaultWaydiv'}
	});
	
	$('#showSetdefaultWaydiv .complete_cancel').on('click',function(){
		layer.close(showSetdefaultWaylayer);
	});
	
	$("#showSetdefaultWaydiv .complete_success").unbind().on('click',function(e){
		setSettlementWay(settlementWay);
		layer.close(showSetdefaultWaylayer);
	});
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
function replaceAndSetPos(obj,pattern,text){ 
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