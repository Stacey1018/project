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

		<script type="text/javascript" src="../js/address.js"></script>
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript" >
			window.onload = function(){
				var selfaddress = document.getElementById("selfaddress");
				var themepopover = document.getElementsByClassName("theme-popover")[0];
				var bg = document.getElementsByClassName("theme-popover-mask")[0];
				
				selfaddress.onclick = function(){
					themepopover.style.display = "block";
					themepopover.style.overflow = "hidden";
					bg.style.display = "block";
					bg.style.height = "800f"+"px";
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
	 			var proid = v['proid'];
				/* alert(proid);//就是你要的结果 */
				
	 		
	 			
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
	 			
	 		
	 		
				findone(proid);
			 	function findone(id){
				    	var value = {
				    			proid:proid
				    	}
				    	fun("findone.cart","oneinfo",value);
				    	function fun(urlpath,id,datas){
								$.ajax({
									url:urlpath,
									data:datas,
									type:"post",
									dataType:"json",
									success:function(data){
										$("#"+id).html(data.strsb);
										$("#J_ActualFee").html(data.totalprice);
										
									},
									error:function(){
										alert("提取有误");
									}
									
								});
				    	}
			 	}
			 	
			 	var buyinfo = document.getElementById("buyinfo");
				buyinfo.onclick = function(){
					var buyname = $("#user-name").val();
					var buyphone = $("#user-phone").val();
					var options1=$("#data-am-selected1 option:selected").val();
					var options2=$("#data-am-selected2 option:selected").val();
					var options3=$("#data-am-selected3 option:selected").val();
					var xiangxiaddress=$("#user-intro").val();
					$(".buy-user").text(buyname);
					$(".buy-phone").text(buyphone);
					$(".province").text(options1);
					$(".city").text(options2);
					$(".dist").text(options3);
					$(".street").text(xiangxiaddress);

				}
				
			
				
				
				var btnorder = document.getElementById("J_Go");
				
				btnorder.onclick = function(){
					addorder();
				}
				
			
				
				function addorder(){
					
					var buyname = $(".buy-user").html();
					var buyphone = $(".buy-phone").html();
					var province = $(".province").html();
					var city = $(".city").html();
					var dist = $(".dist").html();
					var street = $(".street").html();
					var address = province+city+dist+street;
					var num = $("#num").val();
					var proname = $("#proname").val();
					var price = $("#price").val();
					var totalprice = $("#totalprice").val();
					
					var transport = $(".op_express_delivery_hot .selected")[0].getAttribute("data-value");
	 				var value = {
	 						proid:proid,
	 						userid:id,
	 						address:address,
	 						buyname:buyname,
	 						buyphone:buyphone,
	 						num:num,
	 						price:price,
	 						totalprice:totalprice,
	 						transport:transport,
	 						proname:proname
	 				}
	 				fun("add.order",null,value);
	 				function fun(urlpath,id,datas){
	 					
						$.ajax({
							url:urlpath,
							data:datas,
							type:"post",
							dataType:"json",
							success:function(data){
								
								if(data.flag==true){
									alert("订单已经生成,快去个人中心看看吧");
								}
							},
							error:function(){
								alert("提取有误");
								console.log(jqXHR);  
				                console.log(textStatus);  
				                console.log(errorThrown);
							}
							
						});
		    		}
			    	
	 			}
				
				
				
			};
		</script>
		
		
		
		<style>
			.trc{
				background-color: #F5F5F5;
				color:#3C3C3C;
			}
			table tr{
				border-bottom:1px solid #000000;
				margin-top:10px;
				text-align:center;
				padding-top:10px;

			}
			table tr a{
				color:#9b0d5f;
			}


		</style>

	</head>


	<body>
		<%
		String username=(String)session.getAttribute("username");	
	int id = (int)session.getAttribute("userid");
		
	
	%>
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
			
			
			var id = <%=id%>;
			
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
			
			</script>
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>

							<!--<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>-->

						<div class="clear"></div>
						<ul>
							<div class="per-border"></div>
							<li class="user-addresslist defaultAddr">

								<div class="address-left">
									<div class="user DefaultAddr">

										<span class="buy-address-detail">   
                   							<span class="buy-user"> </span>
										<span class="buy-phone"></span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
								   			<span class="province">湖北</span>省
											<span class="city">武汉</span>市
											<span class="dist">洪山</span>区
											<span class="street">雄楚大道666号(中南财经政法大学)</span>
										</span>
									</div>
									<ins class="deftip">默认地址</ins>
								</div>
								<div class="address-right">
									<a href="../person/address.html">
										<span class="am-icon-angle-right am-icon-lg"></span></a>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									<a href="#" class="hidden">设为默认</a>
									<span class="new-addr-bar hidden">|</span>
									<a href="javascript:void(0);" id="selfaddress">编辑</a>
									<!--<a href="javascript:void(0);" onclick="delClick(this);">删除</a>-->
								</div>
							</li>
							<div class="per-border"></div>


						</ul>

						<div class="clear"></div>
					</div>
					<!--物流 -->
					<div class="logistics">
						<h3>选择物流方式</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="圆通" class="OP_LOG_BTN selected "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
							<li data-value="申通" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
							<li data-value="韵达" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
							<li data-value="中通" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
							<li data-value="顺丰" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--支付方式-->
					<!-- <div class="logistics">
						<h3>选择支付方式</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="../images/wangyin.jpg" />银联<span></span></li>
							<li class="pay qq"><img src="../images/weizhifu.jpg" />微信<span></span></li>
							<li class="pay taobao"><img src="../images/zhifubao.jpg" />支付宝<span></span></li>
						</ul>
					</div> -->
					<div class="clear"></div>

					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div>

									<form>
										<table width="1000px">
											<thead>
											<tr class="trc">
												<td>商品</td>
												<td>商品名</td>
												<td>颜色</td>
												<td>数量</td>
												<td>单价</td>
												<td>金额</td>
											</tr>
											</thead>
											<tbody id="oneinfo">

											</tbody>
										</table>
									</form>

								</div>
							</div>
							<div class="clear"></div>

							
							<div class="clear"></div>
							</div>


							</div>
							<div class="clear"></div>
						
							<div class="clear"></div>
							</div>
							<!--含运费小计 -->


							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">244.00</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail">
								   <span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												</span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                         <span class="buy-user">艾迪 </span>
												<span class="buy-phone">15871145629</span>
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" href="javascript:void(0);" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
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
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="email">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div class="am-form-content address">
								<select id="data-am-selected1">
									<option value="浙江">浙江省</option>
									<option value="湖北">湖北省</option>
								</select>
								<select id="data-am-selected2">
									<option value="温州">温州市</option>
									<option value="武汉">武汉市</option>
								</select>
								<select id="data-am-selected3">
									<option value="瑞安">瑞安区</option>
									<option value="洪山">洪山区</option>
								</select>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<div class="am-btn am-btn-danger" id="buyinfo">保存</div>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
	</body>
	
	<script>
	
	</script>

</html>