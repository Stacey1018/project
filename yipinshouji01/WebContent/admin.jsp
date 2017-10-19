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
                
                <img src="img/a.png">
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <h3 class="nav navbar-nav">
                    <span>尊敬的一品系统</span>管理员 欢迎你的到来
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

            <li role="presentation" class="active"><a href="#profile" role="tab" data-toggle="tab">管理员管理</a></li>
           
           
        </ul>

        <!-- Tab panes -->
        <div class="tab-content con">


       
            <!-- 用户管理 -->
            <div role="tabpanel" class="tab-pane active" id="profile">
                <div>
                    <!-- 用户管理 -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home1" aria-controls="home" role="tab"
                                                                  data-toggle="tab"></a></li>

                      
                    </ul> <!-- Tab panes -->
                    <div class="tab-content">
                        <!--查找用户-->
                        <div role="tabpanel" class="tab-pane active" id="home1">
                            <div class="user admin-biaogelist">

                                <div>
                                    <form class="sou">
                                        <select class="find" name="selObject">
                                            
                                            <option value="adname">帐号</option>
                                            
                                         
                                        </select>

                                        <input name="search" class="sousuo" type="text">
                                        <input class="btns" type="button" value="搜索" onclick="selecfun()">
                                    </form>
                                </div>
                                 <div role="tabpanel" class="active" id="home3">
                            <input type="button" data-toggle='modal' data-target='#myModal2' value="添加">
                                <table class="table table-condensed">
                                    <thead>
                                    <th>ID</th>
                                    <th>管理员帐号</th>
                                    <th>密码</th>
                                    <th>权限</th>
                                    
                                    </thead>
                                    <tbody id="list11">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    
                    </div>
                </div>
            </div>
           
            <!-- 商品管理-->
           
           
            <!--订单管理-->
            
            <!--xxx管理-->
            
              
            </div>
            </div>
        </div>
    </div>

</div>
<div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="location.reload()" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">添加管理员</h4>
            </div>
            <div class="modal-body">
                <form >
                    
                    <label>管理员帐号:</label>  <input name="adname" type="text" ></label> <br>
                    <label>密码:</label>  <input name="adpwd" type="text" ></label> <br>
                    <label>权限:</label>  <label>普通</label> <br>
                     
                     <br>
                                   
                    
                    <span id="output"></span>
                </form>
<script> 


</script>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addfun()">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="location.reload()" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">修改商品</h4>
            </div>
            <div class="modal-body">
            
                <form id="updatelist">
      
                   <span id="output1"></span>
                </form>
               
<script> 


</script>
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

  fun("list.admin","list11",null);

  function addfun(){
          var adname= $("input[name='adname']").val();
          var adpwd= $("input[name='adpwd']").val();
          // var premission=$("input[name='jiedian']").is(':checked');
        
          if(adname!=null){
              var value = {
            		  adname:adname,
            		  adpwd:adpwd,
            		 // premission:premission
            		 
              }

              afun("add.admin","output",value);
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
  function selecfun(){
      var selObject = $("select[name='selObject']").val();
      var search = $("input[name='search']").val();
     alert(selObject+"  "+search);
      /* json */
      var value = {
              selObject:selObject,
              search:search
          }
    fun("selectblur.admin","list11",value)
  }
  function updatefun(id){
  	var value = {
  			id:id
  			
  	}
  	fun("find.admin","updatelist",value);
  }
  function funupdate(){
  	 var adid=$("input[name='adid']").val();
  	 var adname=$("input[name='adname1']").val();
  	 var adpwd=$("input[name='adpwd1']").val();
  	
       if(adname!=null){
           var value = {
        		   adid:adid,
        		   adname:adname,
        		   adpwd:adpwd

           }
           bfun("updata.admin","output1",value);
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


