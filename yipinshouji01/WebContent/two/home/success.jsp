<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>结算页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />

	<link href="../css/jsstyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/sustyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/address.js"></script>
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" >

	</script>
	<style>
		.paycont{
			height: 310px;
		}
		.take-delivery{
			width:200px;
			position: absolute;
			right:182px;
			top:100px;
			display: none;

		}

	</style>

</head>


<body>
<%
	String username=(String)session.getAttribute("username");
	int id = (int)session.getAttribute("userid");
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

		});
	}
</script>
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
			<div class="menu-hd"><a id="mc-menu-hd" href="shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
		</div>
		<div class="topMessage favorite">
			<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
		</div>
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
<div class="concent">
	<script>
	window.onload = function(){
		var id = <%=id%>;
		console.log(id);
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
					$(".buy-user").html(datat.name2);
					$(".buy-phone").html(datat.phone2);
				},
				error:function(){

					alert("提取有误");
				}
			})
		}
		function parseUrl(){
            var url=location.href;
            var i=url.indexOf('?');
            if(i==-1)return;
            var querystr=url.substr(i+1);
            var arr1=querystr.split('&');
            var arr2=new Object();
            for  (i in arr1){
                var ta=arr1[i].split('=');
                arr2[ta[0]]=ta[1];
            }
            return arr2;
        }
			var v = parseUrl();//解析所有参数
			var orderid = v['orderid'];
		/* alert(proid);//就是你要的结果 */
			
			var state = 1;
		
			var zhifu = document.getElementById("zhifu");
			var chenggong = document.getElementById("chenggong");
			zhifu.onclick = function(){
				
				var value = {
						orderid:orderid,
						state:state
				}
				console.log(value);
				setState("setState.order",null,value);
				
				chenggong.style.display="block";
				function setState(urlpath,id,value){
					
					$.ajax(
						{
						url:urlpath,
						data:value,
						type:"post",
						dataType:"html",
						async:true,
						success:function(datat){
							
						},
						error:function(){

							alert("提取有误");
						}
					});
				}
				
			}
	}
		
	</script>
	<!--地址 -->
	<div class="paycont">
		<!--支付方式-->
		<div class="logistics">
			<h3>选择支付方式</h3>
			<ul class="pay-list">
				<li class="pay card"><img src="../images/wangyin.jpg" />银联<span></span></li>
				<li class="pay qq"><img src="../images/weizhifu.jpg" />微信<span></span></li>
				<li class="pay taobao" id="zhifu"><a  href="javascript:void(0);"><img src="../images/zhifubao.jpg" />支付宝<span></span></a></li>

			</ul>

		</div>
		<div class="take-delivery" id="chenggong">
			<div class="status">
				<h2>您已成功付款</h2>
			</div>

		</div>
		<div class="clear"></div>
		<script>
			
		</script>
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
		</p>
	</div>
</div>


<div class="clear"></div>
</body>

</html>