package com.whx.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.whx.bean.Message;
import com.whx.dao.MessageDAO;

public class MessageAction extends ActionSupport {
	private Message message;
	private MessageDAO messageDAO;
	private String callbackMsg;
	private List<Message> listMsg;
	private int menuId;
	private int userId;
	private int pageNow;
	private int pageCount ;
	private int Id ;
	
	public String findById(){
		message = messageDAO.findById(Id);
		return SUCCESS;
	}
	
	public String del(){
		try {
			messageDAO.del(Id);
			callbackMsg = "success";
		} catch (Exception e) {
			callbackMsg = "error";
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String findPage(){
		int pageSize = 15 ;
		if(pageNow <= 1){
			pageNow = 1 ;
		}
		pageCount = messageDAO.pageCountOfAll(pageSize);
		if(pageCount <= 1){
			pageCount = 1;
		}
		listMsg = messageDAO.findByPage(pageSize, pageNow);
		return SUCCESS;
	}
	public String add(){
		try {
			messageDAO.save(message, menuId,userId);
			callbackMsg = "success";
		} catch (Exception e) {
			e.printStackTrace();
			callbackMsg = "error";
		}
		return SUCCESS;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	@JSON(serialize = false)
	public MessageDAO getMessageDAO() {
		return messageDAO;
	}
	@Resource
	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	@JSON(serialize = false)
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getCallbackMsg() {
		return callbackMsg;
	}
	public void setCallbackMsg(String callbackMsg) {
		this.callbackMsg = callbackMsg;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public List<Message> getListMsg() {
		return listMsg;
	}
	public void setListMsg(List<Message> listMsg) {
		this.listMsg = listMsg;
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

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}
	
	
}
