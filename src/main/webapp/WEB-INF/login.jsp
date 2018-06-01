<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN" >

    <head>

        <meta charset="utf-8">
        <title>easyCar Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        
        
        <!-- 登录界面的CSS -->
   		
		
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
   		<script src="js/common/jquery-1.11.3.min.js"></script>
	    <!-- 最新的 Bootstrap 核心 JavaScript -->
	    <script src="js/common/bootstrap.min.js"></script>
    	<!-- 自定义的js -->
		<script type="text/javascript" src="js/basepath.js"></script>
    	<script type="text/javascript" src="js/cookie.js"></script>
   		<script type="text/javascript" src="js/login.js"></script>
        <style type="text/css">

            body {
                background: #f8f8f8;
                font-family: 'PT Sans', Helvetica, Arial, sans-serif;
                text-align: center;
                color: #fff;
            }

            .page-container {
                margin: 120px auto 0 auto;
            }

            h1 {
                font-size: 30px;
                font-weight: 700;
                text-shadow: 0 1px 4px rgba(0,0,0,.2);
            }

            form {

                width: 800px;
                margin: 15px auto 0 auto;
                text-align: left;
            }

            input {
                width: 270px;
                height: 42px;
                margin-top: 25px;
                margin-left:260px;
                padding: 0 15px;
                background: #2d2d2d; /* browsers that don't support rgba*/
                background: rgba(45,45,45,.15);
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
                border-radius: 6px;
                border: 1px solid #3d3d3d; /* browsers that don't support rgba*/
                border: 1px solid rgba(255,255,255,.15);
                /*-moz-box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;*/
                /*-webkit-box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;*/
                /*box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;*/
                font-family: 'PT Sans', Helvetica, Arial, sans-serif;
                font-size: 14px;
                color: #fff;
                /* text-shadow: 0 1px 2px rgba(0,0,0,.1);
                 -o-transition: all .2s;
                 -moz-transition: all .2s;
                 -webkit-transition: all .2s;
                 -ms-transition: all .2s;*/
            }

            input:-moz-placeholder { color: #fff; }
            input:-ms-input-placeholder { color: #fff; }
            input::-webkit-input-placeholder { color: #fff; }

            button {
                cursor: pointer;
                width: 300px;
                height: 44px;
                margin-top: 25px;
                margin-left: 260px;
                padding: 0;
                background: #ef4300;
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
                border-radius: 6px;
                border: 1px solid #ff730e;
                -moz-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                -webkit-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                font-family: 'PT Sans', Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: 700;
                color: #fff;
                text-shadow: 0 1px 2px rgba(0,0,0,.1);
                -o-transition: all .2s;
                -moz-transition: all .2s;
                -webkit-transition: all .2s;
                -ms-transition: all .2s;
            }

            button:hover {
                -moz-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                -webkit-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
            }

            button:active {
                -moz-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                -webkit-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.15) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                box-shadow:
                        0 5px 8px 0 rgba(0,0,0,.1) inset,
                        0 1px 4px 0 rgba(0,0,0,.1);

                border: 0px solid #ef4300;
            }
            
			.checkbox { 
			display: inline-block;

		　　width: 18px;height: 18px;
		
		　　border: 1px solid #ccc;
		
		　　cursor: pointer;
		
		　　-moz-border-radius: 3px;
		
		　　-webkit-border-radius: 3px;
		
		　　border-radius: 3px;
		
		　　vertical-align: middle;
		   
			
			}
			
			.back{
            cursor: pointer;
                width: 150px;
                height: 44px;
                margin-top: 25px;
                margin-left: 160px;
                padding: 0;
                background: #ef4300;
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
                border-radius: 6px;
                border: 1px solid #ff730e;
                -moz-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                -webkit-box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                box-shadow:
                        0 15px 30px 0 rgba(255,255,255,.25) inset,
                        0 2px 7px 0 rgba(0,0,0,.2);
                font-family: 'PT Sans', Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: 700;
                color: #fff;
                text-shadow: 0 1px 2px rgba(0,0,0,.1);
                -o-transition: all .2s;
                -moz-transition: all .2s;
                -webkit-transition: all .2s;
                -ms-transition: all .2s;
            }
			
			
			


			

        </style>

        <!-- 设置错误提示信息的样式-->
        <style >
            /*设置验证框宽度*/
            .valistr{
                width: 120px;
            }

            #verifyCode{
                margin-left: 20px;
                vertical-align: middle;
            }



            .error{
                color:red;
            }
        </style>


        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body style="background: url(images/login.jpg)" >

        <div class="container">
        	<br/><br/><br/><br/><br/>
            <h1 class="form-signin-heading">登录</h1><br/>

            <form class="form-signin" id="signupForm">
                <input type="text" id="inputName" class="form-control" placeholder="用户名"
                        /><span></span>
                <input type="password" id="inputPassword" class="form-control" placeholder="密码"/><span></span>

		<div >
          <label>
            <input class="checkbox"  id="rememberId" type="checkbox" value="记住账号"/> 记住账号
          </label>
        </div>
       			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>

            </form>
        

        </div>
        <a href="index.html">
        <span>
            <button class="back">回到首页</button>
        </span>
		</a>
		

    </body>

</html>


