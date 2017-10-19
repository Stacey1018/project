<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

	<title>个人资料</title>

	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

	<link href="../css/personal.css" rel="stylesheet" type="text/css">
	<link href="../css/infstyle.css" rel="stylesheet" type="text/css">
	<script src="../AmazeUI-2.4.2/assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
	<style>
		.message-l span{
			color:#9b0d5f;
		}
		#user-phone{
			height:30px;
			width:630px;
		}
		.info-btn #xiugai{
			background-color:#DD514C;
		}
	</style>
</head>

<body>
<%
	int id = (int)session.getAttribute("userid");
	
	/* String username=(String)session.getAttribute("username");
	String usersex = (String)session.getAttribute("sex");
	String phonenum = (String)session.getAttribute("phone");
	String address = (String)session.getAttribute("address");
	if(address==null){
		address="    此用户还没填写地址";
	} */
%>
<script>
		
		num("num.cart","J_MiniCartNum",null);
		function num(urlpath,id,data){
			$.ajax({
				url:urlpath,
				data:data,
				type:"post",
				dataType:"json",
				async:true,
				success:function(datat){
					$("#"+id).html(datat.num);
				},
				error:function(){
					alert("提取有误");
				}

			})
		}
		</script>
<!--头 -->
<header>
	<article>
		<div class="mt-logo">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<span id="username2"></span><b>欢迎您</b>
						</div>
					</div>
				</ul>

				<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="../home/home1.jsp" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
				</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
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
		</div>
		</div>
	</article>
</header>
<div class="nav-table">
	<div class="long-title"><span class="all-goods">全部分类</span></div>
	<div class="nav-cont">
		<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="#f2">vivo促销</a></li>
                                <li class="qc"><a href="#">一元购</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">限时抢购</a></li>
							</ul>
		<div class="nav-extra">
			<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
			<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
		</div>
	</div>
</div>
<b class="line"></b>
<div class="center">
	<div class="col-main">
		<div class="main-wrap">

			<div class="user-info">
				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
				</div>
				<hr/>

				<!--头像 -->
				<div class="user-infoPic">

					<div class="filePic">
						<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
						<img class="am-circle am-img-thumbnail" src="../images/getAvatar.do.jpg" alt="" />
					</div>

					<p class="am-form-help">头像</p>

					<div class="info-m">
						<div><b id="username1"><i></i></b></div>
						<div><b id="userphone1"><i></i></b></div>
						<div><b id="useraddress1"><i></i></b></div>
						
					</div>
				</div>


				<!--个人信息 -->
				<div class="info-main">
					<form action="updateUser.user" class="am-form am-form-horizontal">


						<div class="am-form-group">
							<label class="am-form-label">性别</label>
							<div class="am-form-content sex">
								<label class="am-radio-inline">
									<input type="radio" name="sex" value="nv" data-am-ucheck> 男
								</label>
								<label class="am-radio-inline">
									<input type="radio" name="sex" value="na" data-am-ucheck> 女
								</label>
								<label class="am-radio-inline">
									<input type="radio" name="sex" value="bm" data-am-ucheck> 保密
								</label>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">电话</label>
							<div class="am-form-content">
								<input name="phone" id="user-phone" placeholder="telephonenumber" type="tel">

							</div>
						</div>

						<div class="am-form-group address" style="display: block;">
							<label for="user-address" class="am-form-label">收货地址:</label>
							<div class="am-form-content">
								<input name="address" id="user-phone" placeholder="address" type="address">

							</div>
						</div>
						
						<div class="info-btn">
							<div class="">
							<input type="hidden" name="userid" value="<%=id %>">
							<input id="xiugai" type="submit" value="保存修改">
						</div>
						</div>
							
					</form>
					
			<script>
			
					var id = <%=id%>;
					
					var value ={
							id1:id
					}
					
					ufun("userin.user",null,value);
					
				
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
				        	$("#useraddress1").html("地址："+datat.address2);
				        	console.log(datat.name2)
				        },
				        error:function(){

				            alert("提取有误");
				        }
				
				    })
				
				}


</script>
						
				</div>

			</div>

		</div>
		<!--底部-->
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
	</div>

	<aside class="menu">
		<ul>
			<li class="person">
				<a href="index.jsp">个人中心</a>
			</li>
			<li class="person">
				<a href="#">个人资料</a>
				<ul>
					<li class="active"> <a href="information.jsp">个人信息</a></li>
					<li> <a href="safety.jsp">安全设置</a></li>
					<li> <a href="address.html">收货地址</a></li>
				</ul>
			</li>
			<li class="person">
				<a href="#">我的交易</a>
				<ul>
					<li><a href="order.jsp">订单管理</a></li>
					<li> <a href="change.html">退款售后</a></li>
				</ul>
			</li>
			<li class="person">
				<a href="#">我的资产</a>
				<ul>
					<li> <a href="coupon.html">优惠券 </a></li>
					<li> <a href="bonus.html">红包</a></li>
					<li> <a href="bill.html">账单明细</a></li>
				</ul>
			</li>

			<li class="person">
				<a href="#">我的小窝</a>
				<ul>
					<li> <a href="collection.html">收藏</a></li>
					<li> <a href="foot.html">足迹</a></li>
					<li> <a href="comment.html">评价</a></li>
					<li> <a href="news.html">消息</a></li>
				</ul>
			</li>

		</ul>

	</aside>
</div>

</body>

</html>