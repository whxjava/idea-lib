package com.whx.bean;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class MsgMenu {
	private int Id;
	private Integer readCount;
	private String publishTime;
	private Message message;
	private SystemMenu systemMenu;

	@Id
	@GeneratedValue
	public int  getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Integer getReadCount() {
		return readCount;
	}
	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="msgId", referencedColumnName="Id")
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name="menuId", referencedColumnName="Id")
	public SystemMenu getSystemMenu() {
		return systemMenu;
	}
	public void setSystemMenu(SystemMenu systemMenu) {
		this.systemMenu = systemMenu;
	}
}
