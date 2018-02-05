package com.wst.service;

import com.jfinal.plugin.activerecord.Page;
import com.wst.model.Email;
import com.wst.model.User;

public class EmailService {

	public static final EmailService service = new EmailService();
	
	public Page<Email> paginate(Integer start,Integer max,String receiveId, Integer state){
		try {
			Page<Email> page = Email.dao.paginate(start, max,receiveId,state);
			for(Email e : page.getList()){
//				e.setPoster(User.dao.getUserById(e.getPostId()));
				//email发送人
				e.put("poster", User.dao.getUserById(e.getPostId()));
			}
			return page;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
