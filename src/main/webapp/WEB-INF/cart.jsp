<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>我的car</title>

<link rel="stylesheet" href="css/fil/bootstrap.min.css" type="text/css" media="all">
<link rel="stylesheet" href="css/fil/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/fil/ionicons.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/fil/owl.carousel.css" type="text/css" media="all">
<link rel="stylesheet" href="css/fil/owl.theme.css" type="text/css" media="all">
<link rel='stylesheet' href='css/fil/prettyPhoto.css' type='text/css' media='all'>
<link rel="stylesheet" href="css/fil/style.css" type="text/css" media="all">
<link rel="stylesheet" href="css/fil/custom.css" type="text/css" media="all">
<link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.js"></script>
	<script  type="text/javascript" src="${ctx}/js/cart.js"></script>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<script>


		//保留两位小数
		//功能：将浮点数四舍五入，取小数点后2位
		function toDecimal(x) {
			var f = parseFloat(x);
			if (isNaN(f)) {
				return;
			}
			f = Math.round(x*100)/100;
			return f;
		}


		//制保留2位小数，如：2，会在2后面补上00.即2.00
		function toDecimal2(x) {
			var f = parseFloat(x);
			if (isNaN(f)) {
				return false;
			}
			var f = Math.round(x*100)/100;
			var s = f.toString();
			var rs = s.indexOf('.');
			if (rs < 0) {
				rs = s.length;
				s += '.';
			}
			while (s.length <= rs + 2) {
				s += '0';
			}
			return s;
		}

		function fomatFloat(src,pos){
			return Math.round(src*Math.pow(10, pos))/Math.pow(10, pos);
		}


		//声明聚焦时候的数量
		var oldBnum;
		//-
		function delBuyNum(obj) {
			var num = $(obj).next().val() - 1;
			var id = $(obj).next().attr("id");
			//异步修改session中值
			$.get("editCartProduct?productId="+id+"&bnum="+num);
			if(num > 0){
				$(obj).next().val(num);
				//给单条商品总价赋值
				var amount = $(obj).parent().parent().next().children('span:eq(1)').text();
				var amount1 = parseFloat(amount);
				$(obj).parent().parent().next().children('span:eq(1)').text(toDecimal2(amount1 * num/(num+1)));
				//给全部商品总价赋值
				var total = parseFloat($("#total").text());
				$("#total").text(toDecimal2(total - amount1/(num+1)));
				//将title中数据更改
				$("#"+id).val(num)
				$("#"+id+"_amount").text(toDecimal2(amount1 * num/(num+1)))
				$("#ttotal").text(toDecimal2(total - amount1/(num+1)))

			} else {
				location.href="removeCartProduct?productId=" + id;
			}
		}
		//+
		function addBuyNum(obj) {
			var num = parseInt($(obj).prev().val())+1;
			var id = $(obj).prev().attr("id");
			//异步修改session中值
			$.get("editCartProduct?productId="+id+"&bnum="+num);
			//给单条商品总价赋值
			$(obj).prev().val(parseInt(num));
			var amount = $(obj).parent().parent().next().children('span:eq(1)').text();
			var amount1 = parseFloat(amount);
			$(obj).parent().parent().next().children('span:eq(1)').text(toDecimal2(amount1 * num/(num-1)));

			//给全部商品总价赋值
			var total = parseFloat($("#total").text());
			$("#total").text(toDecimal2(total + amount1/(num-1)));

			//将title中数据更改
			$("#"+id).val(num)
			$("#"+id+"_amount").text(toDecimal2(amount1 * num/(num-1)))
			$("#ttotal").text(toDecimal2(total + amount1/(num-1)))
		}

		//聚焦时获取商品数量
		function getOldBnum(obj) {
			oldBnum = $(obj).val();
		}

		//失焦修改商品数量
		function changeBnum(obj) {
			//获取商品id
			var id = $(obj).attr("id");
			//获取修改购买数量：当前输入框的值
			var newBnum = $(obj).val();
			//获取修改前的数量
			if(newBnum==0){//执行删除
				location.href="removeCartProduct?productId=" + id;
			}else if(newBnum!=oldBnum){//不同
				//验证数据的合法性
				var reg = /^[1-9][0-9]*$/;
				if(!reg.test(newBnum)){
					alert("请您输入正整数！");
					$(obj).val(oldBnum);
				} else {
					$(obj).val(newBnum);
					//给单条商品总价赋值
					var amount = $(obj).parent().parent().next().children('span:eq(1)').text();
					var amount1 = parseFloat(amount);
					$(obj).parent().parent().next().children('span:eq(1)').text(amount1 * newBnum/oldBnum);
					//给全部商品总价赋值
					var total = parseFloat($("#total").text());
					$("#total").text(total + (newBnum - oldBnum) * amount1/oldBnum);
					$.get("editCartProduct?productId="+id+"&bnum="+newBnum);
					//将title中数据更改
					$("#"+id).val(num)
					$("#"+id+"_amount").text(amount1 * newBnum/oldBnum)
					$("#ttotal").text(total + (newBnum - oldBnum) * amount1/oldBnum)
				}
			}
		}
	</script>
</head>
<body>


<div class="noo-spinner">
	<div class="spinner">
		<div class="cube1"></div>
		<div class="cube2"></div>
	</div>
</div>

<div class="site">


	<div id="main">
		<div style="background: url(images/mycar_3.jpg); height:400px;weight:200px;">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="page-title text-center">easyCar</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumbs">
							<li><a href="cart">我的car</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-7 pb-7" >
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<table class="table shop-cart" >
							<tbody>
								<%-- 总费用--%>
								<c:set var="money" value="0"/>
									<%--遍历购物车--%>
									<c:forEach items="${cart}" var="entry">
									<tr class="cart_item" <c:if test="${empty entry.key}"> hidden="hidden" </c:if>>
										<td class="product-remove">
											<a href="removeCartProduct?productId=${entry.key.productId}" class="remove">×</a>
										</td>
										<td class="product-thumbnail">
											<a href="shop-detail">
												<img src="${entry.key.imgurl}" alt="">
											</a>
										</td>
										<td class="product-info">
											<a href="shop-detail.jsp">${entry.key.productName}</a>
											<span class="amount">￥${entry.key.price}</span>
										</td>
										<td>
											<span id="prods_buynum">
												<input type="hidden" id="hid_${entry.key.productId}" value="${entry.value}"/>
												<a style="" class="delNum" onclick="delBuyNum(this)"><button>-</button></a>
												<input id="${entry.key.productId}" style="width: 60px;" class="buyNumInp1" type="text" value="${entry.value}"
												onfocus="getOldBnum(this)" onblur="changeBnum(this)"/>
												<a class="addNum" onclick="addBuyNum(this)"><button>+</button></a>
											</span>
										</td>

										<td class="product-subtotal">
											<span>￥</span>
											<span class="amount" id="amount">
												<c:if test="${empty entry.key}">0</c:if>
												<c:if test="${entry.key.price * entry.value != 0}"><fmt:formatNumber value="${entry.key.price * entry.value}"
														pattern="0.00" type="number"  maxFractionDigits="2"/></c:if>
											</span>
										</td>
										<c:set var="money" value="${money+entry.key.price * entry.value}"/>
									</tr>
							</c:forEach>

								<tr>
									<td colspan="5" class="actions">
										<a class="continue-shopping" href="index1.html">继续购买</a>
										<a class="update-cart" href="addToCart">刷新列表</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-4">
						<div class="cart-totals">
							<table>
								<tbody>
									<tr class="order-total">
										<th>付款金额</th>
										<td>
											<span>￥</span>
											<strong id="total">
												<c:if test="${empty cart}">0</c:if>
												<c:if test="${money != 0}"><fmt:formatNumber value="${money}"
													pattern="#.##" type="number"  maxFractionDigits="2"/></c:if>
											</strong>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="proceed-to-checkout">
								<a href="${ctx}/toCheckout">前往结算中心</a>
							</div>
							<div class="msgtip" style="color: #FF4C41">
								<c:if test="${!empty errorInfo}">
									${errorInfo}
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<div class="clear"></div>
		<div class="footer-bottom">
			<div class="copy">
				<p>Copyright &copy; 2018.Company name All rights reserved.More Templates <a href="http://www.tmooc.cn" target="_blank" title=达内科技">达内科技</a> - Create by <a href="http://www.cssmoban.com/" title="ç½é¡µæ¨¡æ¿" target="_blank">潘祺涵</a></p>
			</div>
		</div>
</div>

<script type="text/javascript" src="js/fil/jquery.min.js"></script>
<script type="text/javascript" src="js/fil/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/fil/bootstrap.min.js"></script>
<script type="text/javascript" src="js/fil/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/fil/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/fil/jquery.countdown.min.js"></script>
<script type='text/javascript' src='js/fil/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/fil/jquery.prettyPhoto.init.min.js'></script>
<script type="text/javascript" src="js/fil/script.js"></script>
</body>
</html>