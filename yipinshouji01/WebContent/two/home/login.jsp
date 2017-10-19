<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
	<meta charset="UTF-8">
	<title>登录</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
	<link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
	<style>

		.login-links .jizhu{
			margin:2px 4px;

			width:15px;
			height:15px;
		}
		.login-links span{
			
		}
	</style>
</head>

<body>

<div class="login-boxtitle">
	<a href="../css1/home.html"><img alt="logo" src="../images/logobig.png" /></a>
	<a href="../../login.jsp" style="float:right;margin-top:10px">管理员登录</a>
</div>

<div class="login-banner">
	<div class="login-main">
		<div class="login-banner-bg"><span></span><img src="../images/big.png" /></div>
		<div class="login-box">

			<h3 class="title">登录商城</h3>

			<div class="clear"></div>

			<div class="login-form">
				<form action="login.user">
					<div class="user-name">
						<label for="user"><i class="am-icon-user"></i></label>
						<input type="text" name="username" id="user" placeholder="用户名">
					</div>
					<div class="user-pass">
						<label for="password"><i class="am-icon-lock"></i></label>
						<input type="password" name="userpwd" id="password" placeholder="请输入密码">
					</div>
					<div class="clear"></div>
					<div class="login-links">
						<input class="jizhu" type="checkbox"> <span>记住密码</span>
						<a href="#" class="am-fr">忘记密码</a>
						<a href="register.jsp" class="zcnext am-fr am-btn-default">注册</a>
						<br />
					</div>
					<div class="am-cf">
						<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm" onclick="return fun()">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<div class="footer ">
	<div class="footer-hd ">
		<p>
			<a href="# ">东软科技</a>
			<b>|</b>
			<a href="# ">商城首页</a>
			<b>|</b>
			<a href="# ">支付宝</a>
			<b>|</b>
			<a href="# ">物流</a>
		</p>
	</div>
	<div class="footer-bd ">
		<p>
			<a href="# ">关于一品</a>
			<a href="# ">东软</a>
			<a href="# ">联系我们</a>
			<a href="# ">网站地图</a>
			<em>© 2017.9.10 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">一品手机</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank"></a></em>
			<em>制作人 : 安博 屈靖 张扬 张金晓 张水静 崔学光</em>
		</p>
	</div>
</div>
</body>
<script>
	function fun(){
		var username=document.getElementsByName("username")[0];
		if(username==null || username.value.length==0){
			alert("用户名不能为空");
			console.log(username);
			return false;
		}
		var userpwd=document.getElementsByName("userpwd")[0];
		if(userpwd==null || userpwd.value.length==0){
			alert("密码名不能为空");
			return false;
		}
		return true;
	}
</script>
</html>