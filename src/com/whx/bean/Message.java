package com.whx.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Message {
    private int Id;
    private String  msgTitle;
    private String  msgSubTitle;
    private String  msgSource;
    private String  msgContent;
    private String  msgTag;
    private UserInfo userInfo;
    private Set<MsgMenu> msgMenus = new HashSet<MsgMenu>();
    
    @Id
    @GeneratedValue
    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle;
    }

    public String getMsgSubTitle() {
        return msgSubTitle;
    }

    public void setMsgSubTitle(String msgSubTitle) {
        this.msgSubTitle = msgSubTitle;
    }

    public String getMsgSource() {
        return msgSource;
    }

    public void setMsgSource(String msgSource) {
        this.msgSource = msgSource;
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public String getMsgTag() {
        return msgTag;
    }

    public void setMsgTag(String msgTag) {
        this.msgTag = msgTag;
    }
	@ManyToOne
	@JoinColumn(name="userId", referencedColumnName="userId")
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@OneToMany(mappedBy="message",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public Set<MsgMenu> getMsgMenus() {
		return msgMenus;
	}

	public void setMsgMenus(Set<MsgMenu> msgMenus) {
		this.msgMenus = msgMenus;
	}


}
