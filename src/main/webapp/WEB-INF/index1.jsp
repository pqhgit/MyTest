<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>easyCar</title>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='https://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>   
<!--slider-->
<script src="js/jquery.min.js"></script>
<script src="js/script.js" type="text/javascript"></script>
<script src="js/superfish.js"></script>
</head>
<body>
<dir>
	<jsp:include page="title.jsp"></jsp:include>
</dir>
<div class="header-bg">
	<div class="wrap"> 
		<div class="h-bg">
			<div class="total">
				<div class="header">
					<div class="box_header_user_menu">
						<ul class="user_menu"><li class="act first"><a href="">
						<div class="button-t"><span>Shipping &amp; Returns</span></div></a></li><li class=""><a href="http://www.baidu.com" target="_blank">
						<div class="button-t"><span>高级搜索</span></div></a></li>
						
						<li class="last"><a href=""><div class="button-t"><span>欢迎:${username}</span></div></a></li>
						<li class="last"><a href="addToCart.html"><div class="button-t"><span>我的car</span></div></a></li>
						<li class="last"><a href="loginout"><div class="button-t"><span>退出</span></div></a></li>
						</ul>
					</div>
					<div class="header-right">
						<ul class="follow_icon">
							<li><a href="#"><img src="images/icon4.png" alt=""/></a></li>
							<li><a href="#"><img src="images/icon1.png" alt=""/></a></li>
							<li><a href="#"><img src="images/icon2.png" alt=""/></a></li>
							<li><a href="#"><img src="images/icon3.png" alt=""/></a></li>
						</ul>
					</div><div class="clear"></div> 
					<div class="header-bot">
						<div class="logo">
							<a href="index.html"><img src="images/logo3.png" alt=""/></a>
						</div>
						<div class="search">
						    <input type="text" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
						    <button class="gray-button"><span>Search</span></button>
				       </div>
					<div class="clear"></div> 
				</div>		
		</div>	
		<div class="menu"> 	
			<div class="top-nav"> 
					<ul>
						<li class="active"><a href="index.jsp">主页</a></li>
						<li><a href="about.html">关于我们</a></li>
						<li><a href="specials.html">特价商品</a></li>
						<li><a href="new.html">新款商品</a></li>
						<li><a href="contact.html">联系我们</a></li>
					</ul>
					<div class="clear"></div> 
				</div>
		</div>
		<div class="banner-top">
			<div class="header-bottom">
				 <div class="header_bottom_right_images">
				     	<div id="slideshow">
							<ul class="slides">
						    	<li><a href="https://www.audi.cn" target="_blank"><canvas ></canvas><img src="images/banner4.jpg" alt="Marsa Alam underawter close up" ></a></li>
						        <li><a href="https://www.audi.cn" target="_blank"><canvas></canvas><img src="images/banner2.jpg" alt="Turrimetta Beach - Dawn" ></a></li>
						        <li><a href="https://www.audi.cn" target="_blank"><canvas></canvas><img src="images/banner3.jpg" alt="Power Station" ></a></li>
						        <li><a href="https://www.audi.cn" target="_blank"><canvas></canvas><img src="images/banner1.jpg" alt="Colors of Nature" ></a></li>
						    </ul>
						    <span class="arrow previous"></span>
						    <span class="arrow next"></span>
				  	</div>
		  			<div class="content-wrapper">		  
						<div class="content-top">
							  	<div class="box_wrapper"><h1>New Products For 2018</h1>
								
	<c:forEach items="${productLists}" var="prod">
		<div class="grid_1_of_3 images_1_of_3">
			<div class="grid_1">
				<a href="${prod.url}" target="_blank"><img src="${prod.imgurl}" title="continue reading" alt=""></a>
				<div class="grid_desc">
					<p class="title">${prod.productName }</p>
					<p class="title1">${prod.tittle }</p>
						 <div class="price" style="height: 19px;">
						 	 <span class="reducedfrom">${prod.price}</span>
	        				<span class="actual">$12.00</span>
						</div>
						<div class="cart-button">
						
							<div class="cart">
								<a href="addToCart?productId=${prod.productId}&username=${username}"><img src="images/cart.png" alt=""/></a>
							</div>
							<button class="button"><span>Details</span></button>
						<div class="clear"></div>
					</div>
				</div>
	
	</div><div class="clear"></div>
	</div>
	</c:forEach>
			
								</div>
						</div>
						
				</div>
		</div>
		<div class="header-para">
				<div class="categories">
						<div class="list-categories">
							<div class="first-list">
								<div class="div_2"><a href="">Cars</a></div>
								<div class="div_img">
									<img src="images/car1.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
							<div class="first-list">
								<div class="div_2"><a href="">Rental</a></div>
								<div class="div_img">
									<img src="images/car2.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
							<div class="first-list">
								<div class="div_2"><a href="">Banking</a></div>
								<div class="div_img">
									<img src="images/car3.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
							<div class="first-list">
								<div class="div_2"><a href="">Trucks</a></div>
								<div class="div_img">
									<img src="images/car4.jpg" alt="Cars" title="Cars" width="60" height="39">
								</div><div class="clear"></div>
							</div>
				</div>
				<div class="box"> 
							<div class="box-heading"><h1><a href="#">Cart:&nbsp;</a></h1></div>
							 <div class="box-content">
							Now in your cart&nbsp;<strong> ${num} items</strong>
							</div>	
				</div>
				<div class="box-title">
					<h1><span class="title-icon"></span><a href="">Branches</a></h1>
				</div>
				<div class="section group example">
					<div class="col_1_of_2 span_1_of_2">
					  <img src="images/pic21.jpg" alt=""/>
					   <img src="images/pic24.jpg" alt=""/>
					   <img src="images/pic25.jpg" alt=""/>
					   <img src="images/pic27.jpg" alt=""/>
	 				</div>
					<div class="col_1_of_2 span_1_of_2">
						 <img src="images/pic22.jpg" alt=""/>
					  	<img src="images/pic23.jpg" alt=""/>
					  	<img src="images/pic26.jpg" alt=""/>
					  	<img src="images/pic28.jpg" alt=""/>
					  </div><div class="clear"></div>
		   		 </div>
				<div class="clear"></div>
				</div>
	</div>
		<div class="clear"></div>
		<div class="footer-bottom">
			<div class="copy">
				<p>Copyright &copy; 2018.Company name All rights reserved.More Templates <a href="http://www.tmooc.cn" target="_blank" title=达内科技">达内科技</a> - Create by <a href="http://www.cssmoban.com/" title="ç½é¡µæ¨¡æ¿" target="_blank">潘祺涵</a></p>
			</div>
		</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

    	
    	
            