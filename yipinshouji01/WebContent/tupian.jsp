<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
   <head>
   <script type="text/javascript">
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
           <li role="presentation"  class="active"><a href="#product" role="tab" data-toggle="tab">商品管理</a></li>
            <li role="presentation"><a href="order.jsp" >订单管理</a></li>
            <li role="presentation"><a href="pay.jsp" >支付信息</a></li>

        </ul>
        
        
        <!-- Tab panes -->
        <div class="tab-content con">
        
          
   
   
    <!-- Tab panes -->
     <form action="upload" method = "post" enctype="multipart/form-data">
                   
                   	<label>上传图片</label>
                   	<input name="imgname" type="file" multiple="multiple">
                    <div class="modal-footer">
                	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">关闭</button>
                	<input type="submit" class="btn btn-primary"  value="确定" >
                
            		</div>
                    
                    <span id="output"></span>
                </form>
             

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

    fun("list.duct","list02",null);
    function addfun(){
        var proname = $("input[name='proname']").val();
        var price = $("input[name='price']").val();
        var ramin = $("input[name='ramin']").val();
        var type = $("input[name='type']").val();
        var color = $("input[name='color']").val();
        var ram = $("input[name='ram']").val();
       
        alert(proname);
        if(proname!=null){
            var value = {
            		proname:proname,
            		price:price,
            		ramin :ramin ,
            		typeid:type,
            		color:color,
            		ram:ram

            }

            afun("add.duct","output",value);
        }

    } 
    function updatefun(id){
    	var value = {
    			id:id
    			
    	}
    	fun("find.duct","updatelist",value);
    }
    function funupdate(){
    	 var proid=$("input[name='proid']").val();
    	 
    	 var proname=$("input[name='proname1']").val();
    	 
         var price = $("input[name='price1']").val();
     
         var ramin = $("input[name='ramin1']").val();
        
         var type = $("input[name='type1']").val();
         
         var color = $("input[name='color1']").val();
         
         var ram = $("input[name='ram1']").val();
        
        
         if(proname!=null){
             var value = {
            		 proid:proid,
            		 proname:proname,
             		price:price,
             		ramin :ramin ,
             		type:type,
             		color:color,
             		ram:ram
             		

             }
             bfun("updata.duct","output1",value);
        }
         
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
      fun("selectblur.duct","list02",value)
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