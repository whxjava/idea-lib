package com.whx.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.whx.bean.UserInfo;

import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionSupport;
import com.whx.dao.UserInfoDAO;

@Component
public class UserInfoAction extends ActionSupport implements SessionAware {
	private UserInfoDAO userInfoDAO;
	private UserInfo userInfo;
	private String message;
	private Map<String, Object> session;
	private int pageNow;
	private int pageSize;
	private int pageCount;
	private List<UserInfo> list;
	
	public String findById(){
		userInfo = userInfoDAO.findById(userInfo.getUserId());
		return SUCCESS;
	}

	public String findPage() {
		pageSize = 15;
		pageCount = userInfoDAO.pageCount(pageSize);
		if(pageNow <= 1){
			pageNow = 1 ;
		}
		if(pageCount <= 1){
			pageCount = 1 ;
		}
		list = userInfoDAO.findPage(pageNow,pageSize);
		
		return SUCCESS;
	}

	public String del() {
		if(userInfoDAO.deleteById(userInfo.getUserId())){
			message = "success";
		}else{
			message = "error";
		}
		return SUCCESS;
	}

	public String add() {
		userInfoDAO.save(userInfo);
		return SUCCESS;
	}

	public String login() {
		if (userInfoDAO.isExist(userInfo)) {
			session.put("userInfo", userInfoDAO.findByNameAndPwd(userInfo));
			message = "success";
		} else {
			message = "error";
		}
		return SUCCESS;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@JSON(serialize = false)
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@JSON(serialize = false)
	public UserInfoDAO getUserInfoDAO() {
		return userInfoDAO;
	}

	@Resource
	public void setUserInfoDAO(UserInfoDAO userInfoDAO) {
		this.userInfoDAO = userInfoDAO;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<UserInfo> getList() {
		return list;
	}

	public void setList(List<UserInfo> list) {
		this.list = list;
	}

}
