package com.whx.action;

import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.whx.bean.SystemMenu;
import com.whx.bean.Tree;
import com.whx.dao.SystemMenuDAO;

public class SystemMenuAction extends ActionSupport{
	private List<Tree> treeList;
	private SystemMenuDAO systemMenuDAO;
	private SystemMenu systemMenu;
	private List<SystemMenu> list;
	private String message;
	
	/*
	 * main methods
	 */
	public String createTree(){
		treeList = systemMenuDAO.createSystemMenuTree();
		return SUCCESS;
	}
	
	public String findById(){
		systemMenu = systemMenuDAO.findById(systemMenu.getId());
		return SUCCESS;
	}
	
	public String add(){
		if(systemMenuDAO.save(systemMenu)){
			message = "success";
		}
		return SUCCESS;
	}
	
	public String findAll(){
		list = systemMenuDAO.findAll();
		return SUCCESS;
	}
	
	public String findTop(){
		list = systemMenuDAO.findTop();
		return SUCCESS;
	}
	
	public String del(){
		if(systemMenuDAO.DeleteById(systemMenu.getId())){
			message = "success";
		}else{
			message = "error";
		}
		return SUCCESS;
	}
	
	
	
	/*
	 * setter and getter methods
	 */
	
	public List<Tree> getTreeList() {
		return treeList;
	}

	public void setTreeList(List<Tree> treeList) {
		this.treeList = treeList;
	}
	
	@JSON(serialize=false)
	public SystemMenuDAO getSystemMenuDAO() {
		return systemMenuDAO;
	}

	public void setSystemMenuDAO(SystemMenuDAO systemMenuDAO) {
		this.systemMenuDAO = systemMenuDAO;
	}
	public SystemMenu getSystemMenu() {
		return systemMenu;
	}
	public void setSystemMenu(SystemMenu systemMenu) {
		this.systemMenu = systemMenu;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<SystemMenu> getList() {
		return list;
	}

	public void setList(List<SystemMenu> list) {
		this.list = list;
	}

	
}
