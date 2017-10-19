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
                    <li><a href="#">退出登录</a></li>
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

            <li role="presentation"><a href="user.jsp" >用户管理</a></li>
            <li role="presentation"  class="active"><a href="#messages" role="tab" data-toggle="tab">商品分类</a></li>
           <li role="presentation"><a href="product.jsp" >商品管理</a></li>
            <li role="presentation"><a href="order.jsp" >订单管理</a></li>
            <li role="presentation"><a href="pay.jsp" >支付信息</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content con">
            <!-- 用户管理 -->

            <!-- 商品管理-->
            <div role="tabpanel" class="" id="messages">
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
                        <div role="tabpanel" class="active" id="home2">
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

        </div>
    </div>

</div>

<!--商品种类变弹出框-->
<div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="location.reload()" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">添加商品种类</h4>
            </div>
            <div class="modal-body">
                <form action="add.type" method="post" >
                    
                    <label>种类:</label>  <input name="protype" type="text" > <br>
                    <label>是否有叶子节点  </label> 
                    <input name="leafnode" type="radio" value="1"/>是
                    <input name="leafnode" type="radio" value="0">否
                    <br>
                    <label>是否有父亲节点</label>
                    <input name="fathernode" type="radio"  value="1"/>是
                    <input name="fathernode" type="radio" value="0">否
                    <br>
                     <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">关闭</button>
                <input type="submit" class="btn btn-primary" value="添加">
            </div>
                    
                </form>
                <span id="output"></span>
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
                <form action="update.type" method="post" >
                	<div id="updatelist">
                	
                	</div>
                
                
                
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">关闭</button>
                <input type="submit" class="btn btn-primary"  value="修改">
            </div>
                </form>
               <span id="output1"></span>

            </div>
           
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="myModal4" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="location.reload()" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">是否删除此种类？</h4>
            </div>
            <div class="modal-body">

                <span id="deleteoutput"></span>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">否</button>
                <button type="button" class="btn btn-primary" onclick="deletedd()">是</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


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

    fun("list.type","list01",null);

    function addfun(){
        var protype = $("input[name='protype']").val();
        var leafnode = $("input[name='leafnode']").val();
        var fathernode = $("input[name='fathernode']").val();
        alert(leafnode);
        console.log(fathernode);
        if(protype!=null){
            var value = {
                protype:protype,
                leafnode:leafnode,
                fathernode:fathernode

            }

            afun("add.type","output",value);
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

