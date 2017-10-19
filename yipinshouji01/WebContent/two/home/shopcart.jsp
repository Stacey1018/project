<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>购物车页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" /> 
	<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/jquery.js"></script>
	<style>
	#J_MiniCartNum{
		color:red;
	}
	.trc{
		background-color: #9b0d5f;
		color:white;
		
	}
	table tr{
			border-bottom:1px solid #000000;
			margin-top:10px;
			text-align:center;
			padding-top:10px;

		}
		table tr a{
			color:#9b0d5f;
		}
	
	
	</style>
</head>

<body>
<%
		String username=(String)session.getAttribute("username");	
	int id = (int)session.getAttribute("userid");
	%>
<!--顶部导航条 -->
<div class="am-container header">
	<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
						<span><%=username%></span><b>欢迎您</b>
						<a href="login.jsp">退出登录</a>
				</div>			
			</div>		
	</ul>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd"><a href="home1.jsp" target="_top" class="h">商城首页</a></div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng"><a href="../person/index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
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

<!--购物车 -->
<div class="concent">
	<div id="cartTable">
		<div class="cart-table-th">
			
			<form>
				<table width="1000px">
					<thead>
					<tr class="trc">
						<td>商品</td>
						<td>商品名</td>
						<td>颜色</td>
						<td>数量</td>
						<td>单价</td>
						
						<td>金额</td>
						<td>操作</td>
					</tr>
					</thead>
					<tbody id="cartinfo">
					
					</tbody>
				</table>
			</form>

		</div>
		<div class="clear"></div>
<script>


profun("list1.cart","cartinfo",null);

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

function profun(urlpath,id,data){
	$.ajax({
		url:urlpath,
		data:data,
		type:"post",
		dataType:"html",
		async:true,
		success:function(datat){
			
			$("#"+id).html(datat);
			
			
		},
		error:function(){

			alert("提取有误");
		}

	})

}

</script>
		

				<div class="clear"></div>
				
		<div class="clear"></div>

		
	<div class="clear"></div>
	
	
	
	

	
		
		

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
		</p>
		</div>
	</div>

</div>

<!--操作页面-->

<div class="theme-popover-mask"></div>

<div class="theme-popover">
	<div class="theme-span"></div>
	<div class="theme-poptit h-title">
		<a href="javascript:;" title="关闭" class="close">×</a>
	</div>
	<div class="theme-popbod dform">
		<form class="theme-signin" name="loginform" action="" method="post">

			<div class="theme-signin-left">

				<li class="theme-options">
					<div class="cart-title">颜色：</div>
					<ul>
						<li class="sku-line selected">12#川南玛瑙<i></i></li>
						<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
					</ul>
				</li>
				<li class="theme-options">
					<div class="cart-title">包装：</div>
					<ul>
						<li class="sku-line selected">包装：裸装<i></i></li>
						<li class="sku-line">两支手袋装（送彩带）<i></i></li>
					</ul>
				</li>
				<div class="theme-options">
					<div class="cart-title number">数量</div>
					<dd>
						<input class="min am-btn am-btn-default" name="" type="button" value="-" />
						<input class="text_box" name="" type="text" value="1" style="width:30px;" />
						<input class="add am-btn am-btn-default" name="" type="button" value="+" />
						<span  class="tb-hidden">库存<span class="stock">1000</span>件</span>
					</dd>

				</div>
				<div class="clear"></div>
				<div class="btn-op">
					<div class="btn am-btn am-btn-warning">确认</div>
					<div class="btn close am-btn am-btn-warning">取消</div>
				</div>

			</div>
			<div class="theme-signin-right">
				<div class="img-info">
					<img src="../images/kouhong.jpg_80x80.jpg" />
				</div>
				<div class="text-info">
					<span class="J_Price price-now">¥39.00</span>
					<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
				</div>
			</div>

		</form>
	</div>
</div>

<!--引导 -->
<div class="navCir">
	<li><a href="../css1/home.html"><i class="am-icon-home "></i>首页</a></li>
	<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
	<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
	<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
</div>
</body>

</html>