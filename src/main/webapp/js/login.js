//window.onload=function(){}
$(function(){
	//alert("login.js");
	$("form input[type=text]").val(getCookie("username"));
	console.log("login.js");
	$("form").submit(function(){
		return login_form();//return false,不让页面的form表单提交
	});
});
//登录方法
function login_form(){
	//alert("test");
	console.log("login_form");
	//获取登录的用户名和密码
	var lName=$("form input[type=text]").val();
	var lpwd=$("form input[type=password]").val();
	var remember=$("#rememberId").get(0).checked;
	//console.log(lName+"   "+lpwd+"   "+remember);
	//alert(lName+"   "+lpwd+"   "+remember);
	//发送异步ajax请求去服务器
	$.ajax({
		url:"login",
		type:"get",
		data:{"username":lName,"password":lpwd},
		dataType:"json",
		success:function(result){
			//得到服务器返回的json数据result
			//根据json数据做dom编程
			if(result.status==1){
				if(remember){
					//要求记录账号,记录在cookie中
					//添加cookie  loginName=wt_zss@126.com 存活5个小时
					addCookie("username",lName,5)
				}
				window.location.href="index1.html";
			}else if(result.status==0){
				alert(result.message)
			}
			
		},
		error:function(){
			alert("请求失败!");
		}
	});
	return false;
}

