package com.whx.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class SystemMenu {
    private int Id;
    private int PId;
    private String  name;
    private String url;
    private Integer myorder;
    private String remark;
   // private Set<MsgMenu> msgMenus = new HashSet<MsgMenu>();

    @Id
    @GeneratedValue
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getPId() {
		return PId;
	}
	public void setPId(int pId) {
		PId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getMyorder() {
		return myorder;
	}
	public void setMyorder(Integer myorder) {
		this.myorder = myorder;
	}
/*	@OneToMany(mappedBy="systemMenu",cascade= CascadeType.ALL ,fetch = FetchType.EAGER)
	public Set<MsgMenu> getMsgMenus() {
		return msgMenus;
	}
	public void setMsgMenus(Set<MsgMenu> msgMenus) {
		this.msgMenus = msgMenus;
	}*/

   
}
