package com.whx.action;

import com.opensymphony.xwork2.ActionSupport;
import com.whx.bean.MsgMenu;
import com.whx.bean.SystemMenu;
import com.whx.dao.MsgMenuDAO;
import com.whx.dao.SystemMenuDAO;

import javax.annotation.Resource;

import org.apache.struts2.json.annotations.JSON;

import java.util.List;

public class MsgMenuAction extends ActionSupport {
    private MsgMenuDAO msgMenuDAO;
    private SystemMenuDAO systemMenuDAO;
    private List<MsgMenu> list;
    private Integer menuId;
    private MsgMenu msgMenu;
    private SystemMenu systemMenu;
    private int pageNow;
    private int pageCount;
    private int Id;

    public String findPage(){
        int pageSize = 6 ;
        pageCount = msgMenuDAO.pageCountByMenuId(Id,pageSize);
        if(pageCount < 1){
            pageCount = 1 ;
        }
        if(pageNow < 1){
            pageNow = 1 ;
        }
        list = msgMenuDAO.findPageByMenuId(Id,pageNow,pageSize);
        systemMenu = systemMenuDAO.findById(Id);
        return SUCCESS;
    }

    public String findTop(){
        list = msgMenuDAO.findReadCountByMenuId(menuId,0,10);
        return SUCCESS;
    }

    public String findLast(){
        list = msgMenuDAO.findPageByMenuId(menuId,0,10);
        return SUCCESS;
    }

    public String findById(){
        msgMenu = msgMenuDAO.findById(Id);
        return SUCCESS;
    }
    public String findByMenuId(){
        list = msgMenuDAO.findByMenuID(menuId);
        return SUCCESS;
    }

    public MsgMenu getMsgMenu() {
        return msgMenu;
    }

    public void setMsgMenu(MsgMenu msgMenu) {
        this.msgMenu = msgMenu;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public List<MsgMenu> getList() {
        return list;
    }

    public void setList(List<MsgMenu> list) {
        this.list = list;
    }
    
    @JSON(serialize=false)
    public MsgMenuDAO getMsgMenuDAO() {
        return msgMenuDAO;
    }
    @Resource
    public void setMsgMenuDAO(MsgMenuDAO msgMenuDAO) {
        this.msgMenuDAO = msgMenuDAO;
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

	@JSON(serialize = false)
	public SystemMenuDAO getSystemMenuDAO() {
		return systemMenuDAO;
	}
	@Resource
	public void setSystemMenuDAO(SystemMenuDAO systemMenuDAO) {
		this.systemMenuDAO = systemMenuDAO;
	}

	public SystemMenu getSystemMenu() {
		return systemMenu;
	}

	public void setSystemMenu(SystemMenu systemMenu) {
		this.systemMenu = systemMenu;
	}


}
