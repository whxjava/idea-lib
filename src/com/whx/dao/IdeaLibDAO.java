package com.whx.dao;

import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

@Component
public class IdeaLibDAO {

	private HibernateTemplate hibernateTemplate;

	public void save(Object o) {
		hibernateTemplate.save(o);
	}

	public void del(Integer Id, Object o) {
		hibernateTemplate.delete(hibernateTemplate.load(o.getClass(), Id));
	}

	public Integer pageCount(Integer pageSize, String hql) {
		int pageCount = 0;
		int rowCount = this.findByHql(hql).size();
		pageCount = rowCount / pageSize == 0 ? rowCount / pageSize : rowCount
				/ pageSize + 1;
		return pageCount;
	}

	@SuppressWarnings("rawtypes")
	public List findByHql(String hql) {
		final String fhql = hql;
		return hibernateTemplate.executeFind(new HibernateCallback<List>() {
			public List doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(fhql).list();
			}
		});
	}

	@SuppressWarnings("rawtypes")
	public List findPageByHql(Integer pageNow, Integer pageSize, String hql) {
		if (pageNow <= 1) {
			pageNow = 1;
		}
		final Integer firstResult = (pageNow - 1) * pageSize;
		final Integer maxResult = pageSize;
		final String fhql = hql;
		return hibernateTemplate.executeFind(new HibernateCallback<List>() {
			public List doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(fhql).setFirstResult(firstResult)
						.setMaxResults(maxResult).list();
			}
		});
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
