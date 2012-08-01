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
public class UserInfo {
	private int userId;
	private String userName;
    private String userPwd;
    private Set<Message> messages = new HashSet<Message>();
    
	@Id
	@GeneratedValue
	public int getUserId() {
		return userId;
	}
	public void setUserId(int    userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
    public String getUserPwd() {
        return userPwd;
    }
    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }
    
    @OneToMany(mappedBy="userInfo",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	public Set<Message> getMessages() {
		return messages;
	}
	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}
}
