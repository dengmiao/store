package com.wst.interceptor;

import javax.servlet.http.HttpSession;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.wst.model.User;

public class MyInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		String uri = inv.getActionKey();
		Controller c = inv.getController();
		HttpSession session = c.getSession();
		if(uri.indexOf("/user/login") != -1 || uri.equals("/")){
			inv.invoke();
		}else if(session != null){
			User u = (User) session.getAttribute("user");
			if(u != null){
				inv.invoke();
			}else{
				c.renderText("login");
			}
		}else{
			c.renderText("login");
		}
	}
	
}
