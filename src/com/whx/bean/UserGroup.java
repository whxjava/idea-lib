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
public class UserGroup {
	private int groupId;
	private String groupName;
	private Set<UserInfo> userInfos = new HashSet<UserInfo>();
	@Id
	@GeneratedValue
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	@OneToMany(mappedBy="userGroup", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public Set<UserInfo> getUserInfos() {
		return userInfos;
	}
	public void setUserInfos(Set<UserInfo> userInfos) {
		this.userInfos = userInfos;
	}
	
}
