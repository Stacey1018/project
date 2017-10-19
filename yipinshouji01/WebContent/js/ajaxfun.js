function fun(urlpath,id){
	
	$.ajax({
		url:urlpath,
		async:true,
		type:"post",
		dataType:"html",
		success:function(data){
			$("#"+id).html(data);
			console.log(data);
		},
		error:function(){
			alert("提取有误");
		}
		
	})
	
}

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