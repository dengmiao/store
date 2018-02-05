package com.wst.config;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
import com.wst.controller.EmailController;
import com.wst.controller.GroupController;
import com.wst.controller.IndexController;
import com.wst.controller.UserController;
import com.wst.interceptor.MyInterceptor;
import com.wst.model._MappingKit;

public class Config extends JFinalConfig {

	/**配置jfinal常量值*/
	@Override
	public void configConstant(Constants me) {
		PropKit.use("config/config.properties");
		me.setDevMode(PropKit.getBoolean("devMode", false));
		me.setViewType(ViewType.JSP);//默认视图类型为 JSP
	}

	/**配置访问路由*/
	@Override
	public void configRoute(Routes me) {
		me.add("/", IndexController.class, "/index");
		me.add("/user",UserController.class);
		me.add("/email",EmailController.class);
		me.add("/group",GroupController.class);
	}

	@Override
	public void configEngine(Engine me) {
		me.addSharedObject("ctx", JFinal.me().getContextPath());//上下文路径
		
	}

	public static DruidPlugin createDruidPlugin() {
		return new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
	}
	
	@Override
	public void configPlugin(Plugins me) {
//		loadPropertyFile("config/config.txt");
		// 配置C3p0数据库连接池插件
		DruidPlugin druidPlugin = createDruidPlugin();
		me.add(druidPlugin);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		arp.setShowSql(true);
		// 所有映射在 MappingKit 中自动化搞定
		_MappingKit.mapping(arp);
		me.add(arp);
	}

	/**拦截所有 action 请求*/
	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new MyInterceptor());
	}

	/**拦截所有web请求*/
	@Override
	public void configHandler(Handlers me) {
		
	}

}
