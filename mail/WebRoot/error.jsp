<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>404</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="<%=basePath%>css/main.css" rel="stylesheet">
	<link href="<%=basePath%>css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  </head>
  
  <body>
    <div class="page-error">
      <h1><i class="fa fa-exclamation-circle"></i> Error 404</h1>
      <p>您已经登陆，不能重复登陆.</p>
    </div>
  </body>
</html>
