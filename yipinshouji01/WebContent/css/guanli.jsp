<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>微金所合体出来的首页</title>

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
    <style type="text/css">
    	 .tab-content #home2{
            position: relative;
        }
 
        .tab-content #home2 input{

            border:none;
            position: absolute;
            width:50px;
            height: 30px;
            background-color: #BE0106;
            right:100px;
            top:20px;
        }
        .tab-content #home2 table{
            width:500px;

        }
    </style>

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
                    <span>xxx</span>管理员 欢迎你的到来
                </h3>
                <ul class="nav navbar-nav navbar-right hidden-sm hidden-xs">
                    <li><a href="#">个人中心</a></li>
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
            <li role="presentation"><a href="#messages" role="tab" data-toggle="tab">商品管理</a></li>
            <li role="presentation"><a href="#settings" role="tab" data-toggle="tab">订单管理</a></li>
            <li role="presentation"><a href="#last" role="tab" data-toggle="tab">xxx</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content con">



            <!-- 用户管理 -->
            <div role="tabpanel" class="tab-pane active" id="profile">
                <div>
                    <!-- 用户管理 -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home1" aria-controls="home" role="tab"
                                                                  data-toggle="tab">查找用户</a></li>

                        <li role="presentation"><a href="#settings1" aria-controls="settings" role="tab"
                                                   data-toggle="tab">修改用户</a></li>
                    </ul> <!-- Tab panes -->
                    <div class="tab-content">
                        <!--查找用户-->
                        <div role="tabpanel" class="tab-pane active" id="home1">
                            <div class="user admin-biaogelist">

                                <div>
                                    <form class="sou">
                                        <select class="find" name="selObject">
                                            <option value="userid">ID</option>
                                            <option value="username">用户名</option>
                                            <option value="phone">电话号码</option>
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
            <!-- 商品管理-->
            <div role="tabpanel" class="tab-pane" id="messages">
                <div> <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home2" aria-controls="home" role="tab"
                                                                  data-toggle="tab">查找商品</a></li>
                        <!--<li role="presentation"><a href="#profile2" aria-controls="profile" role="tab" data-toggle="tab">添加商品</a>
                        </li>
                        <li role="presentation"><a href="#messages2" aria-controls="messages" role="tab"
                                                   data-toggle="tab">删除商品</a></li>
                        <li role="presentation"><a href="#settings2" aria-controls="settings" role="tab"
                                                   data-toggle="tab">修改商品信息</a></li>-->
                    </ul> 
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home2">
                            <input type="button" data-toggle='modal' data-target='#myModal2' value="添加">
                            <div class="protypetable">
                                <table class="table table-hover">
                                    <thead>
                                         <tr>
                                            <td>编号</td>
                                            <td>种类</td>
                                            <td>叶子节点</td>
                                            <td>父节点</td>
                                            <td>操作</td>
                                        </tr>
                                    </thead>
                                    <tbody id="list01">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                       <!-- <div role="tabpanel" class="tab-pane" id="profile2">22</div>
                        <div role="tabpanel" class="tab-pane" id="messages2">33</div>
                        <div role="tabpanel" class="tab-pane" id="settings2">44</div>-->
                    </div>
                </div>
            </div>
            <!--订单管理-->
            <div role="tabpanel" class="tab-pane" id="settings">
                <div> <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home3" aria-controls="home" role="tab"
                                                                  data-toggle="tab">Home</a></li>
                        <li role="presentation"><a href="#profile3" aria-controls="profile" role="tab" data-toggle="tab">Profile</a>
                        </li>
                        <li role="presentation"><a href="#messages3" aria-controls="messages" role="tab"
                                                   data-toggle="tab">Messages</a></li>
                        <li role="presentation"><a href="#settings3" aria-controls="settings" role="tab"
                                                   data-toggle="tab">Settings</a></li>
                    </ul> <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home3">11</div>
                        <div role="tabpanel" class="tab-pane" id="profile3">22</div>
                        <div role="tabpanel" class="tab-pane" id="messages3">33</div>
                        <div role="tabpanel" class="tab-pane" id="settings3">44</div>
                    </div>
                </div>
            </div>
            <!--xxx管理-->
            <div role="tabpanel" class="tab-pane" id="last"><div> <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home1" aria-controls="home" role="tab"
                                                              data-toggle="tab">Home</a></li>
                    <li role="presentation"><a href="#profile1" aria-controls="profile" role="tab" data-toggle="tab">Profile</a>
                    </li>
                    <li role="presentation"><a href="#messages1" aria-controls="messages" role="tab"
                                               data-toggle="tab">Messages</a></li>
                    <li role="presentation"><a href="#settings1" aria-controls="settings" role="tab"
                                               data-toggle="tab">Settings</a></li>
                </ul> <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home4">11</div>
                    <div role="tabpanel" class="tab-pane" id="profile4">22</div>
                    <div role="tabpanel" class="tab-pane" id="messages4">33</div>
                    <div role="tabpanel" class="tab-pane" id="settings4">44</div>
                </div>
            </div>
            </div>
        </div>
    </div>

</div>
<!--用户表弹出框-->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改用户权限</h4>
            </div>
            <div class="modal-body">
                <label>是否禁用:</label>
                <input type="text" placeholder="请输入0或1">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--商品种类变弹出框-->
<div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="location.reload()" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改商品种类</h4>
            </div>
            <div class="modal-body">
                <form>
                    <label>种类:</label>  <input name="protype" type="text" ><br>
                    <label>叶子节点:</label>  <input name="leafnode" type="text"><br>
                    <label>父亲节点:</label>  <input name="fathernode" type="text"><br>
                    <span id="output"></span>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addfun()">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 分类修改 -->
<div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="location.reload()" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改商品种类</h4>
            </div>
            <div class="modal-body">
                <form id="updatelist">
                   
                    
                </form>
                <span id="output1"></span>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">关闭</button>
                <button type="button" class="btn btn-primary" onclick="funupdate()">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- 底部 -->
<div class="footer">
    <h3>我跟他们都合作过(⊙o⊙)哦</h3>
    <ul>
        <li><a href="#" class="wjs_font wjs_partner01"></a></li>
        <li><a href="#" class="wjs_font wjs_partner02"></a></li>
        <li><a href="#" class="wjs_font wjs_partner03"></a></li>
        <li><a href="#" class="wjs_font wjs_partner04"></a></li>
        <li><a href="#" class="wjs_font wjs_partner05"></a></li>
        <li><a href="#" class="wjs_font wjs_partner06"></a></li>
        <li><a href="#" class="wjs_font wjs_partner07"></a></li>
        <li><a href="#" class="wjs_font wjs_partner08"></a></li>
        <li><a href="#" class="wjs_font wjs_partner09"></a></li>
    </ul>
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
    function selecfun(){
        var selObject = $("select[name='selObject']").val();
        var search = $("input[name='search']").val();
        alert(selObject);
        /* json */
        var value = {
            selObject:selObject,
            search:search
        }


        fun("selectblur.user","list",value);
        
       /*  商品添加 */
        
        
        
    }
    fun("list.type","list01",null);
    
    function addfun(){
 	   var protype = $("input[name='protype']").val();
 	   var leafnode = $("input[name='leafnode']").val();
 	   var fathernode = $("input[name='fathernode']").val();
 	   if(protype!=null){
 		   var value = {
 				   protype:protype,
 				   leafnode:leafnode,
 				   fathernode:fathernode
 				   
 				   }
 		   
 		   afun("add.type","output",value);
 	   }
 	  
    }
    
    
    
function updatefun(id){
	var value = {
			id:id
			
	}
	fun("find.type","updatelist",value);
}
function funupdate(){
	 var protype = $("input[name='protype1']").val();
	   var leafnode = $("input[name='leafnode1']").val();
	   var fathernode = $("input[name='fathernode1']").val();
	   var id=$("input[name='typeid1']").val();
	   
	   if(protype!=null){
		   var value = {
				   protype:protype,
				   leafnode:leafnode,
				   fathernode:fathernode,
				   id:id
				   }
		   
		   bfun("update.type","output1",value);
	   }
}
function afun(urlpath,id,datas){
	
	$.ajax({
		url:urlpath,
		data:datas,
		type:"post",
		dataType:"json",
		async:true,
		success:function(data){
			console.log(data.flag);
			if(data.flag=true){
				
				$("#"+id).html("添加成功");
			}else{
				$("#"+id).html("添加失败");
			}
		},
		error:function(){
			alert("提取有误");
		}
		
	})

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
				
				$("#"+id).html("修改成功");
			}else{
				$("#"+id).html("修改失败");
			}
		},
		error:function(){
			alert("提取有误");
		}
		
	})

}


</script>
</html>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Include all compiled plugins (below), or include individual files as needed -->
