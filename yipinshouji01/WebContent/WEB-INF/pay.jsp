<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
   <head>
   <meta charset=utf-8">
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
            <li role="presentation"><a href="protype.jsp" >商品分类</a></li>
           <li role="presentation"><a href="product.jsp" >商品管理</a></li>
            <li role="presentation"><a href="orders.jsp" >订单管理</a></li>
            <li role="presentation "class="active"><a href="#pay" role="tab" data-toggle="tab">支付信息</a></li>
        </ul>
        
        
        <!-- Tab panes -->
        <div class="tab-content con">
        
           <!-- 商品管理-->
            <div role="tabpanel" class="" id="pay">
                <div> <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#home5" aria-controls="home" role="tab"
                                                                  data-toggle="tab">查找支付</a></li>
   </ul>
  
    
                            <div class="protypetable">
                                <table class="table table-hover">
                                <div>
                                    <form class="sou">
                                        <select class="find" name="selObject">
                                            
                                            <option value="payway">付款方式</option>
                                            <option value="orderid">订单号</option>
                                           
                                         
                                        </select>

                                        <input name="search" class="sousuo" type="text">
                                        <input class="btns" type="button" value="搜索" onclick="selecfun()">
                                    </form>
                                </div>
                                    <thead>
                                    <tr>
                                     <td>编号</td>
                                        <td>支付方式</td>
                                        <td>订单号</td>
                                    
                                        
                                    </tr>
                                    </thead>
                                    <tbody id="list04">

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

    fun("list.pay","list04",null);
    function selecfun(){
        var selObject = $("select[name='selObject']").val();
        var search = $("input[name='search']").val();
       alert(selObject+"  "+search);
        /* json */
        var value = {
                selObject:selObject,
                search:search
            }
      fun("selectblur.pay","list04",value)
    }
</script>

</html>