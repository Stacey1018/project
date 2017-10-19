	<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>管理员</title>

    <!-- Bootstrap -->
    <link href="lib/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- hack -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

   <!-- 导入 自己的css -->
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <!-- 导入 index.css -->

    <link rel="stylesheet" type="text/css" href="css/index.css">
    

    <script type="text/javascript"  src="lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="js/ajaxfun.js"></script>
    <script src="lib/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/guanli.css" >
    

</head>
<body>

<!-- 导航栏 -->
<div class='nav'>
    <nav class="navbar wjs_default" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <img src="img/logobig.png">
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <h3 class="nav navbar-nav">
                                                                      尊敬的管理员 欢迎你的到来
                </h3>
                <ul class="nav navbar-nav navbar-right hidden-sm hidden-xs">
                    <li><a href="login.jsp">退出登录</a></li>
                </ul>
            </div>


        </div>
        <!-- /.container-fluid -->
    </nav>
</div>

<div class="conten">


    <!--内容-->
    <div class="tuijian">
        <!-- 侧边栏 -->
        <ul class="nav wjs-tabs slide" role="tablist">

            <li role="presentation" class="active"><a href="#profile" role="tab" data-toggle="tab">用户管理</a></li>
            <li role="presentation"><a href="protype.jsp" >商品分类</a></li>
            <li role="presentation"><a href="product.jsp" >商品管理</a></li>
           <li role="presentation"><a href="order.jsp" >订单管理</a></li>
             <li role="presentation"><a href="pay.jsp" >支付信息</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content con">


       
            <!-- 用户管理 -->
            <div role="tabpanel" class="tab-pane active" id="profile">
                <div>
                    <!-- 用户管理 -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                        <a href="#home1" aria-controls="home" role="tabdata-toggle="tab">查找用户</a></li>

                      
                    </ul> <!-- Tab panes -->
                    <div class="tab-content">
                        <!--查找用户-->
                        <div role="tabpanel" class="tab-pane active" id="home1">
                            <div class="user admin-biaogelist">

                                <div>
                                    <form class="sou">
                                        <select class="find" name="selObject">
                                            
                                            <option value="username">用户名</option>
                                           
                                            <option value="address">地址</option>
                                        </select>

                                        <input name="search" class="sousuo" type="text">
                                        <input class="btns" type="button" value="搜索" onclick="selecfun()">
                                    </form>
                                </div>
                                <table class="table table-condensed">
                                    <thead>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>密码</th>
                                    <th>性别</th>
                                    <th>电话</th>
                                    <th>住址</th>
                                    <th>是否禁用</th>
                                    <th>密保问题</th>
                                    <th>答案</th>
                                    </thead>
                                    <tbody id="list">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--修改用户-->
                        <div role="tabpanel" class="tab-pane" id="settings1">44</div>
                    </div>
                </div>
            </div>
   
              
            </div>
            </div>
        </div>
  


<!--用户表弹出框-->
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改用户权限</h4>
            </div>
            <form action="aupdateUser.user" method="post">
             <div class="modal-body">
                <label>是否禁用:</label>
                <label class="am-radio-inline">
					<input type="radio" name="baned" value="true" data-am-ucheck> 是
				</label>
				<label class="am-radio-inline">
					<input type="radio" name="baned" value="false" data-am-ucheck> 否
				</label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="">关闭</button>
                <input type="submit"  class="btn btn-primary" value="修改">
            </div>
            
            
            
            </form>
           
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">

function fun(urlpath,id,datas){
	
	$.ajax({
		url:urlpath,
		data:datas,
		type:"post",
		dataType:"html",
		success:function(data){
			$("#"+id).html(data);
		},
		error:function(){
			alert("提取有误");
		}
		
	})
}

</script>


<!-- 底部 -->
<div class="footer">

<footer class="tm-footer1">
            <div style="margin-top: -10px;margin-left: 1px">
                <div class="row">
                    
                    <p>制作人：<br>组长：安博<br>
                                                                        组员：屈靖祎、张扬、张金晓、崔学光、张水静  </p>
   
                 </div>
             </div>
</footer>
</div>
</body>
<script type="text/javascript">
$(function(){
    $.ajax({
        url:"list.user",
        async:true,
        type:"post",
        dataType:"html",
        success:function(data){
            $("#list").html(data);

        },
        error:function(){
            alert("提取有误");
        }

    })

})
    fun("list.user","list",null);
    function selecfun(){
        var selObject = $("select[name='selObject']").val();
        var search = $("input[name='search']").val();
       alert(selObject+"  "+search);
        /* json */
        var value = {
                selObject:selObject,
                search:search
            }
      fun("selectblur.user","list",value)
    }

</script>
</html>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Include all compiled plugins (below), or include individual files as needed -->
