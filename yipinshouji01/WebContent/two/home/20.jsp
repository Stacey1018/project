<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>商品页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link type="text/css" href="../css/optstyle.css" rel="stylesheet" />
	<link type="text/css" href="../css/style.css" rel="stylesheet" />

	<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="../basic/js/quick_links.js"></script>

	<script type="text/javascript" src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script type="text/javascript" src="../js/jquery.imagezoom.min.js"></script>
	<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="../js/list.js"></script>
	<link href="../css1/introductionmi5plus.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="../js/jquery.js"></script>
	<style>
		.message-l span{
			color:#9b0d5f;
		}
	</style>


</head>

<body>

<link href="../font-awesome-4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<%
			
	int id1 = (int)session.getAttribute("userid");
	%>
<%
String username=(String)session.getAttribute("username");
int id = (int)session.getAttribute("userid");
int proid = Integer.parseInt(request.getParameter("proid")) ;
%>
<script>

	var id = <%=id%>;

	var value ={
		id1:id
	}

	ufun("userin.user",null,value);

	var proid = <%=proid%>;

	var value ={
		proid:proid
	}

	pfun("productin.duct",null,value);
	function pfun(urlpath,id,data){
		$.ajax({
			url:urlpath,
			data:data,
			type:"post",
			dataType:"json",
			async:true,
			success:function(datat){

				$("#proname").html(datat.proname);
				$("#proprice").html(datat.price);
				var str="<img src='../../upload/"+datat.imgpath+"'>"

				$("#imgpath").append(str);
				/* $("#userphone1").html("联系方式："+datat.phone2);
				 $("#useraddress1").html("地址："+datat.address2);
				 console.log(datat.name2) */
			},
			error:function(){

				alert("提取有误");
			}

		})

	}

	function ufun(urlpath,id,data){
		$.ajax({
			url:urlpath,
			data:data,
			type:"post",
			dataType:"json",
			async:true,
			success:function(datat){

				$("#username2").html(datat.name2);
				$("#username1").html("用户名："+datat.name2);
				$("#userphone1").html("联系方式："+datat.phone2);
				$("#useraddress1").html(datat.address2);
				console.log(datat.name2)
			},
			error:function(){

				alert("提取有误");
			}

		})

	}





</script>
<!--顶部导航条 -->
<div class="am-container header">
<div class="topMessage">
								<div class="menu-hd">
									<span><%=username%></span><b>欢迎您</b>
									<a href="login.jsp">退出登录</a>
								</div>
								
							</div>

	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd"><a href="home1.jsp" target="_top" class="h">商城首页</a></div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng"><a href="../person/index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd"><a id="mc-menu-hd" href="shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
		</div>
		<div class="topMessage favorite">
			<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
	</ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
	<div class="logo"><img src="../images/logo.png" /></div>
	<div class="logoBig">
		<li><img src="../images/logobig.png" /></li>
	</div>
	<div class="search-bar pr">
		<a name="index_none_header_sysc" href="#"></a>
		<form>
			<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
			<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
		</form>
	</div>
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="listMain">

	<!--分类-->
	<div class="nav-table">
		<div class="long-title"><span class="all-goods">全部分类</span></div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
				<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<ol class="am-breadcrumb am-breadcrumb-slash">
		<li><a href="#">首页</a></li>
		<li><a href="#">分类</a></li>
		<li class="am-active">内容</li>
	</ol>
	<!-- <script type="text/javascript">
		$(function() {});
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation: "slide",
				start: function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script> -->
	<div class="scoll">
		<section class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li>
						<img src="../images/01.jpg" title="pic" />
					</li>
					<li>
						<img src="../images/02.jpg" />
					</li>
					<li>
						<img src="../images/03.jpg" />
					</li>
				</ul>
			</div>
		</section>
	</div>



	<div class="item-inform">
		<div class="clearfixLeft" id="clearcontent">

			<div class="box">


				<div class="tb-booth tb-pic tb-s310">
					<a id="imgpath" href="../images/01.jpg">

					</a>
				</div>

			</div>

			<div class="clear"></div>
		</div>

		<div class="clearfixRight">

			<!--规格属性-->
			<!--名称-->
			<div class="tb-detail-hd">
				<h1 id="proname">

				</h1>
			</div>

			<div class="tb-detail-list">
				<div class="tb-detail-product intro">
					<li class="price iteminfo_price">
						<dt>产品介绍</dt>
						<dd>  </dd>
					</li>

					<div class="clear"></div>
				</div>
				<!--价格-->
				<div class="tb-detail-price">
					<li class="price iteminfo_price">
						<dt>价格</dt>
						<dd><em>¥</em><b id="proprice" class="sys_item_price"></b>  </dd>
					</li>

					<div class="clear"></div>
				</div>

				<div class="amount-wrapper ">
					<div class="item-amount ">
						<div class="sl">
							<lable>购买数量：</lable>
							<input class="min am-btn" name="" type="button" value="-" />
							<input id="pronum" class="text_box" name="" type="text" value="3" style="width:30px;" />
							<input class="add am-btn" name="" type="button" value="+" />
						</div>
					</div>
				</div>
				<!--地址-->
				<div class="tb-detail-address">

					<div>
						<div id="useraddress1" class="fa fa-map-marker address-info">

						</div>
					</div>


				</div>
				<div class="clear"></div>


				<!--活动	-->
				<div class="shopPromotion gold">


				</div>
			</div>

			<div class="pay">
				<div class="pay-opt">
					<a href="home1.html"><span class="am-icon-home am-icon-fw">首页</span></a>
					<a><span class="am-icon-heart am-icon-fw">收藏</span></a>

				</div>
				<li>
					<div class="clearfix tb-btn tb-btn-buy theme-login">
						<a id="LikBuy" title="点此按钮到下一步确认购买信息" href="pay.html">立即购买</a>
					</div>
				</li>
				<li>
					<div class="clearfix tb-btn tb-btn-basket theme-login">
						<a id="LikBasket" title="加入购物车" href="#" onclick="add()"><i></i>加入购物车</a>
					</div>
				</li>
			</div>

		</div>

		<div class="clear"></div>

	</div>


	<div class="clear"></div>

<script>

		var userid = <%=id%>
		var proid = <%=proid%>
		
		
		function add(){
			var pronum = document.getElementById("pronum").value;
			console.log(pronum);
			var value = {
					userid:userid,
					proid:proid,
					pronum:pronum
			}
			fun("addcart.cart",null,value);
		}
		
		
		function fun(urlpath,id,datas){
			
			$.ajax({
				url:urlpath,
				data:datas,
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.flag==true){
						alert("添加购物车成功");
					}else{
						alert("添加购物车失败");
					}
				},
				error:function(){
					alert("提取有误");
				}
				
			})
		}

</script>

</div>
<!--菜单 -->
<div class=tip>
	<div id="sidebar">
		<div id="wrap">
			<div id="prof" class="item">
				<a href="#">
					<span class="setting"></span>
				</a>
				<div class="ibar_login_box status_login">
					<div class="avatar_box">
						<p class="avatar_imgbox"><img src="../images/no-img_mid_.jpg" /></p>
						<ul class="user_info">
							<li>用户名：sl1903</li>
							<li>级&nbsp;别：普通会员</li>
						</ul>
					</div>
					<div class="login_btnbox">
						<a href="#" class="login_order">我的订单</a>
						<a href="#" class="login_favorite">我的收藏</a>
					</div>
					<i class="icon_arrow_white"></i>
				</div>

			</div>
			<div id="shopCart" class="item">
				<a href="shopcart.jsp">
					<span class="message"></span>
				</a>
				<p>
					购物车
				</p>
				<p class="cart_num">0</p>
			</div>
			<div id="asset" class="item">
				<a href="#">
					<span class="view"></span>
				</a>
				<div class="mp_tooltip">
					我的资产
					<i class="icon_arrow_right_black"></i>
				</div>
			</div>

			<div id="foot" class="item">
				<a href="#">
					<span class="zuji"></span>
				</a>
				<div class="mp_tooltip">
					我的足迹
					<i class="icon_arrow_right_black"></i>
				</div>
			</div>

			<div id="brand" class="item">
				<a href="#">
					<span class="wdsc"><img src="../images/wdsc.png" /></span>
				</a>
				<div class="mp_tooltip">
					我的收藏
					<i class="icon_arrow_right_black"></i>
				</div>
			</div>

			<div id="broadcast" class="item">
				<a href="#">
					<span class="chongzhi"><img src="../images/chongzhi.png" /></span>
				</a>
				<div class="mp_tooltip">
					我要充值
					<i class="icon_arrow_right_black"></i>
				</div>
			</div>

			<div class="quick_toggle">
				<li class="qtitem">
					<a href="#"><span class="kfzx"></span></a>
					<div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
				</li>
				<!--二维码 -->
				<li class="qtitem">
					<a href="#none"><span class="mpbtn_qrcode"></span></a>
					<div class="mp_qrcode" style="display:none;"><img src="../images/weixin_code_145.png" /><i class="icon_arrow_white"></i></div>
				</li>
				<li class="qtitem">
					<a href="#top" class="return_top"><span class="top"></span></a>
				</li>
			</div>

			<!--回到顶部 -->
			<div id="quick_links_pop" class="quick_links_pop hide"></div>

		</div>

	</div>
	<div id="prof-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			我
		</div>
	</div>
	<div id="shopCart-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			购物车
		</div>
	</div>
	<div id="asset-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			资产
		</div>

		<div class="ia-head-list">
			<a href="#" target="_blank" class="pl">
				<div class="num">0</div>
				<div class="text">优惠券</div>
			</a>
			<a href="#" target="_blank" class="pl">
				<div class="num">0</div>
				<div class="text">红包</div>
			</a>
			<a href="#" target="_blank" class="pl money">
				<div class="num">￥0</div>
				<div class="text">余额</div>
			</a>
		</div>

	</div>
	<div id="foot-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			足迹
		</div>
	</div>
	<div id="brand-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			收藏
		</div>
	</div>
	<div id="broadcast-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>
			充值
		</div>
	</div>
</div>
<div class="footer">
	<div class="footer-hd">
		<p>
			<a href="#">恒望科技</a>
			<b>|</b>
			<a href="#">商城首页</a>
			<b>|</b>
			<a href="#">支付宝</a>
			<b>|</b>
			<a href="#">物流</a>
		</p>
	</div>
	<div class="footer-bd">
		<p>
			<a href="#">关于恒望</a>
			<a href="#">合作伙伴</a>
			<a href="#">联系我们</a>
			<a href="#">网站地图</a>
			<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
		</p>
	</div>
</div>

</body>
</html>