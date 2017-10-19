<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
	<meta charset="UTF-8">
	<title>注册</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.min.css" />
	<link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
	<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<link rel="stylesheet" href="../css1/csslogre.css">
    <script src="../js/ajaxfun.js"></script>
</head>
<script>
function fun(){
	
	/* var username = $("input[name='username']").val(); */
	
	$.ajax({
		//数据json形式
		url:"ajaxpuser.user",
		data:{"username":$("input[name='username']").val()},
		dataType:"json",
		success:function(dataT){
			var value = dataT.flag;
			/* alert(value); */
			if(value==true){
				$("#usersf").html("此用户名可用");
			}else{
				$("#usersf").html("此用户名已被占用");
			}
		}
	
	})
}

</script>

<body>

<div class="login-boxtitle">
	<a href="home/demo.html"><img alt="" src="../images/logobig.png" /></a>
	<a href="login.jsp" class="a2">已有账号，去登陆</a>
</div>

<div class="res-banner">
	<div class="res-main">
		<div class="login-banner-bg"><span></span><img src="../images/big.png" /></div>
		<div class="login-box">

			<div class="am-tabs" id="doc-my-tabs">
				<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
					<li class="am-active"><a href="">注册账号</a></li>

				</ul>

				<div class="am-tabs-bd">
					<div class="am-tab-panel am-active">
						<span id="usersf"></span>
						<form action="adduser.user" method="post" >

							<div class="user-email">
								<label for="text"><i class="am-icon-user"></i></label>
								<input type="text" name="username" id="username" placeholder="请输入用户名" onblur="fun()">
							</div>
							<div class="user-pass">
								<label for="password"><i class="am-icon-lock"></i></label>
								<input type="password" name="userpwd" id="password" placeholder="设置密码">
							</div>
							<div class="user-pass">
								<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								<input type="password" name="userpwd1" id="password1" placeholder="确认密码">
							</div>


							<div class="am-cf">
								<input  type="submit"  name="" value="注册" onclick="return fun1()" class="am-btn am-btn-primary am-btn-sm am-fl">
							</div>

						</form>
						<span id="tishi"></span>


					</div>



					<script>
						$(function() {
							$('#doc-my-tabs').tabs();
						})
						
					
						function fun1(){
                            
                            var userpwd = document.getElementById("password");
                            var userpwd1 = document.getElementById("password1");
                            console.log(userpwd.value);
                            if(userpwd.value!=userpwd1.value){
                                alert("两次输入密码不同");
                                return false;
                            }
                            return true;
                            bfun("adduser.user","tishi",null);
                        }
						function bfun(urlpath,id,datas){

					        $.ajax({
					            url:urlpath,
					            data:datas,
					            type:"post",
					            dataType:"json",
					            async:true,
					            success:function(data){
					                console.log(data.flag);
					                if(data.flag=true){

					                    $("#"+id).html("注册成功");
					                }else{
					                    $("#"+id).html("注册失败");
					                }
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

</html>