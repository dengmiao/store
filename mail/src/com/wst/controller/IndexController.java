package com.wst.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

public class IndexController extends Controller {

	public void index(){
		redirect("/login.jsp");
	}
	
	@ActionKey("/def")
	public void test(){
		renderText("test");
	}
	
}
