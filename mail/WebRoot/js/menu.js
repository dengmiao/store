$("a.menu").click(function(){
	var path = $(this).attr("target");
//	$("#content").load(path);
	var text = $(this).find("span").eq(0).text();
	var clazz = $(this).find("i").eq(0).attr("class");
	var html = "<div>" +
            "<h1><i class='"+clazz+"'></i>"+text+"</h1>"+
            "<p id='curr_id'>"+hoursToCN()+"好,现在是: "+getcurDate() +" "+ getcurTime()+"</p>"+
          "</div>"+
          "<div>"+
            "<ul class=\"breadcrumb\">"+
              "<li><i class=\"fa fa-home fa-lg\"></i></li>"+
              "<li><a href=\"#\">"+text+"</a></li>"+
            "</ul>"+
          "</div>";
	$("#page_title").html(html);
	$.ajax({
		url:path,
		dataType:"html",
		cache:false,
		success:function(data){
			if(data != "login"){
				$("#content").html(data);
			}else{
				location.href="./login.jsp";
			}
			
		},
		error:function(error){console.log(error);} 
	});
});
