package com.wst.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.wst.model.Email;
import com.wst.model.User;

public class UserController extends Controller {
	
	public void login(){
		User u = User.dao.login(getPara("userName"), getPara("password"));
		HttpSession session = getSession();
		if(u != null){
			session.setAttribute("user", u);
			ServletContext application = session.getServletContext();
			@SuppressWarnings("unchecked")
			Map<String, String> map = (Map<String, String>) application.getAttribute("onlineUsers");
			if(map == null){
				map = new HashMap<String, String>();
				application.setAttribute("onlineUsers", map);
			}
			for(String userId : map.keySet()){
				if(!userId.equals(u.getId()) && !map.containsValue(session.getId())){
					continue;
				}
				if(userId.equals(u.getId()) && map.containsValue(session.getId())){
//					getSession(false).invalidate();
					renderText("error");
					System.out.println("异地登陆");//					redirect("/error.jsp");
					return;
				}
			}
			map.put(u.getId(), session.getId());
			renderText("true");//			index();
		}else{
			renderText("false");//			redirect("/login.jsp");
		}
	}
	
	public void index(){
		User u = (User) getSession().getAttribute("user");
		Page<Email> page = Email.dao.paginate(1,5,u.getId(),0);
		setAttr("page", page);
		render("/WEB-INF/pages/index.jsp");
	}
	
	public void logout(){
		getSession().invalidate();
		redirect("/login.jsp");
	}
	
	public void changePwd(){
//		String userName = getPara("userName");
		String pwd = getPara("password") != null ? getPara("password") : "123456";
		System.out.println(pwd);
		setAttr("code", 111);
		redirect("/login.jsp");
	}
}
