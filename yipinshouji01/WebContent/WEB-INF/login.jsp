<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	 <!-- Bootstrap -->
    <link href="lib/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- hack -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="css/login.css" >
	</head>
	<body class="b">
<div class="lg">
    <form action="<%=basePath%>selectUser.admin">
        <div class="lg_top"></div>
        <div class="lg_main">
            <div class="lg_m_1">
                <input name="adname" value="" class="ur" />
                <input name="adpwd" type="password" value="" class="pw" />
                
                <div class="checkbox">
                    <label> <input type="checkbox"> 记住密码 </label>
                </div>
            </div>
        </div>
        <div class="lg_foot">
            <div class="bn" >

                <input type="submit" class="bn_l" value="登录">
                
             <input id="btn1" type="button" class="bn_r" value="申请"> 
                

            </div>
        </div>

    </form>
</div>

<div class="rg">
    <h1>一品网站：</h1>
    <p></p>
    
</div>
<div class="regist" id="reg">
    <form >
        <div class="form-group">
           <h2> <label for="exampleInputEmail1">联系方式:15503377032</label></h2>
              <img src="img/aa.jpg">
        </div>
       
    </form>


</div>
</body>
</html>
<script>
    var btn1=document.getElementById("btn1");
    var reg = document.getElementById("reg");
    btn1.onclick = function () {
        reg.style.display = "block";
    }


</script>