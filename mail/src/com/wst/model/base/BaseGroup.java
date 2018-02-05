package com.wst.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseGroup<M extends BaseGroup<M>> extends Model<M> implements IBean {

	public M setId(java.lang.String id) {
		set("id", id);
		return (M)this;
	}

	public java.lang.String getId() {
		return get("id");
	}

	public M setGroupName(java.lang.String groupName) {
		set("group_name", groupName);
		return (M)this;
	}

	public java.lang.String getGroupName() {
		return get("group_name");
	}

	public M setUserId(java.lang.String userId) {
		set("user_id", userId);
		return (M)this;
	}

	public java.lang.String getUserId() {
		return get("user_id");
	}

	public M setPId(java.lang.String pId) {
		set("p_id", pId);
		return (M)this;
	}

	public java.lang.String getPId() {
		return get("p_id");
	}

}
