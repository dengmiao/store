<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="<%=basePath%>css/main.css" rel="stylesheet">
	<link href="<%=basePath%>css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  </head>
  
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>Email</h1>
      </div>
      <div class="login-box">
        <form id="login_form_id" class="login-form">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          <div class="form-group">
            <label class="control-label">USERNAME</label>
            <input class="form-control" type="text" name="userName" placeholder="Email" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" type="password" name="password" placeholder="Password">
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <label class="semibold-text">
                  <input type="checkbox"><span class="label-text">Stay Signed in</span>
                </label>
              </div>
              <p class="semibold-text mb-0"><a data-toggle="flip">Forgot Password ?</a></p>
            </div>
          </div>
          <div class="form-group btn-container">
            <button type="button" class="btn btn-primary btn-block" onclick="login()"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
          </div>
        </form>
        <form class="forget-form" action="<%=basePath%>user/changePwd" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" type="text" name="userName" placeholder="Email">
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
          </div>
          <div class="form-group mt-20">
            <p class="semibold-text mb-0"><a data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
          </div>
        </form>
      </div>
    </section>
  </body>
  <script type="text/javascript" src="<%=basePath%>js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>js/plugins/pace.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>js/main.js"></script>
  <script type="text/javascript" src="<%=basePath%>js/plugins/bootstrap-notify.min.js"></script>
  <script type="text/javascript">
	  document.onkeydown=keyListener;
	  function keyListener(e){
	      e = e ? e : event;
	      if(e.keyCode == 13){
	      	login();
	      }
	  }
	  var strFullPath=window.document.location.href;
	  var strPath=window.document.location.pathname;
	  var pos=strFullPath.indexOf(strPath);
	  var prePath=strFullPath.substring(0,pos);
	  var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	  var basePath = prePath+postPath;
	  function login() {
		  $.ajax({
			  url:basePath+"/user/login",
			  type:"POST",
			  data:$("#login_form_id").serialize(),
			  cache:false,
			  success:function(res){
				  if(res == 'true'){
					  location.href=basePath+"/user";
				  }else if(res == 'false'){
					  $.notify({
				      		title: "登录提示 : ",
				      		message: "用户名密码错误!",
				      		icon: 'fa fa-times' 
				      	},{
				      		type: "info"
				      	});
				  }else if(res == "error"){
					  $.notify({
				      		title: "登录提示 : ",
				      		message: "您已经登陆，不能重复登陆.",
				      		icon: 'fa fa-times' 
				      	},{
				      		type: "info"
				      	});
				  }
			  }
		  });
	  }
  </script>
</html>
