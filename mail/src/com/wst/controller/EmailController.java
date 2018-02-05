package com.wst.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.wst.model.Email;
import com.wst.model.User;
import com.wst.service.EmailService;

public class EmailController extends Controller {

	public void toSend(){
		render("/WEB-INF/pages/email/email_send.jsp");
	}
	
	public void toReceive(){
		render("/WEB-INF/pages/email/email_receive.jsp");
	}
	
	public void getReceive(){
		User u = (User) getSession().getAttribute("user");
		int pageNo = Integer.parseInt(getPara("page"));
		Page<Email> page = EmailService.service.paginate(pageNo, 10,u.getId(),0);
//		renderJson(FastJson.getJson().toJson(page));
		renderJson(page);
	}
}
