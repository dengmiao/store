package com.wst.listener;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.wst.model.User;

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("-----------session create:"+arg0.getSession().getId()+"------------");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
        ServletContext application = session.getServletContext();
        // 取得登录的用户
        User user = (User) session.getAttribute("user");
        // 从在线列表中删除用户
        @SuppressWarnings("unchecked")
		Map<String,String> onlineUsers = (Map<String, String>) application.getAttribute("onlineUsers");
        if(onlineUsers != null && user != null){
        	if(onlineUsers.containsKey(user.getId())){
            	onlineUsers.remove(user.getId());
            }
            application.setAttribute("onlineUsers", onlineUsers);
            System.out.println(user.getUserName() + "超时退出。");
        }
	}

}
