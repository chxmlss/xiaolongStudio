function jump(e){
	location.href =$(e).attr('data-src');
}
function newAlert(e){
	alert(e)
	return;
}
$(".link").on('click',function(){
	    	
	    	var url1 = $(this).attr('data-src');
	    	$.ajax({
		          type: "post",
		          dataType: "json",
				  data:{
				  	'data':url1
				  },
		          url: "/index/index/doLink",//'{:url("/index/index/doLink")}',
		          success: function (res) {
		            if (res.status == 1){
		             	location.href = "/index/index/goLink"//'{:url("/index/index/goLink")}'
		             } 
		             if (!res.status) {
		             	location.href = "/index/index/wan"//'{:url("/index/index/wan")}'
		             } 
		             if (res.status == 2){
		             	location.reload();
		             	alert("参数错误");
		             }
		             
		          },
		          error: function(data) {
		            alert("网络错误");
		           }
	 
	        });
	    	
	    });