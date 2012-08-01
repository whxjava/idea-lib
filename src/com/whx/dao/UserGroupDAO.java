package com.whx.dao;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.whx.bean.UserGroup;

@Component(value="userGroupDao")
public class UserGroupDAO {

	private HibernateTemplate hibernateTemplate;

	public void save(UserGroup userGroup) {
		hibernateTemplate.save(userGroup);
	}

	public void deleteById(int Id) {
		hibernateTemplate.delete(hibernateTemplate.get(UserGroup.class, Id));
	}

	public UserGroup findById(int Id) {
		return hibernateTemplate.get(UserGroup.class, Id);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource(name="hibernateTemplate")
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
