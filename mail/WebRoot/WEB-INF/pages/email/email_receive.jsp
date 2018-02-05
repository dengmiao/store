<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'email_receive.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
    <div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<table class="table table-hover table-bordered" id="sampleTable">
						<thead>
							<tr>
								<th>Name</th>
								<th>发件人</th>
								<th>主题</th>
								<th>发送时间</th>
							</tr>
						</thead>
						<tbody id="data">
							<tr>
								<td>Tiger Nixon</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
							</tr>
						</tbody>
					</table>
					<div style="font-size: 18px;text-align: center">
						<ul id="pageUL" class="pagination"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=basePath%>js/plugins/bootstrap-paginator.min.js"></script>
	<script type="text/javascript">
		var ops = {
			bootstrapMajorVersion : 3, //版本
			currentPage : 1, //当前页
			numberOfPages : 3, //页面最多显示多少页码
			//totalPages:12,   //总页数
			onPageClicked : function(e, event, type, page) { //当页码点中时,触发
				getData(page);
			}
		};
		$(function() {
			getData(1);

		});
		function getData(page) {
			$.ajax({
				url : "<%=basePath%>email/getReceive",
				type:"post",
				data:{"page":page},
				success:function(data){
					var str = "";
					for(var i = 0,len = data.list.length; i < len; i++){
						var obj = data.list[i];
						str += "<tr>";
						str += "<td><input type=\"checkbox\" class=\"i-checks\" name=\"input[]\"></td>";
						str += "<td>"+obj.poster.realName+"</td>";
						str += "<td>"+obj.title+"</td>";
						str += "<td>"+obj.send_time+"</td>";
						str += "</tr>";
					}
					$("#data").html(str);
					if(page == 1 && data.totalPage > 0){
		    			ops.totalPages = data.totalPage;
		    			$("#pageUL").bootstrapPaginator(ops);
		    		}
				}
			});
		}
	</script>
  </body>
</html>
