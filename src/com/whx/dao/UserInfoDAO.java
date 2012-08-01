package com.whx.dao;

import javax.annotation.Resource;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Component;
import com.whx.bean.UserInfo;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class UserInfoDAO {
	
	private HibernateTemplate hibernateTemplate;

	public void save(UserInfo userInfo) {
		hibernateTemplate.save(userInfo);

	}

	public boolean deleteById(int Id) {
		try {
			hibernateTemplate.delete(hibernateTemplate.get(UserInfo.class, Id));
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false ;
	}

	public UserInfo findById(int Id) {
		return hibernateTemplate.get(UserInfo.class, Id);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<UserInfo> findPage(int pageNow ,int pageSize){
		final int firstResult = ( pageNow - 1) * pageSize ;
		final int maxResult = pageSize ;
		return hibernateTemplate.executeFind(new HibernateCallback<List>() {
			public List doInHibernate(Session session)throws HibernateException, SQLException{
				return session.createQuery("from UserInfo u").setFirstResult(firstResult).setMaxResults(maxResult).list();
			}
		});
	}
	
	public int pageCount(int pageSize){
		int pageCount = 0 ;
		int rowCount = this.findAll().size();
		pageCount = rowCount / pageSize == 0 ? rowCount /pageSize : rowCount /pageSize + 1 ;
		return pageCount;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<UserInfo> findAll(){
		return hibernateTemplate.executeFind(new HibernateCallback<List>() {
			public List doInHibernate(Session session)throws HibernateException , SQLException {
				return session.createQuery("from UserInfo u").list();
			}
		});
	}
  
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean isExist(UserInfo userInfo){
       List<UserInfo> list = new ArrayList<UserInfo>();
       /*
        * 第一种方法用hibernateCallback得到session
        */
       final String sql ="SELECT * FROM userinfo WHERE userName = '"+userInfo.getUserName()+"' AND userPwd = '"+userInfo.getUserPwd()+"'";
       list = hibernateTemplate.executeFind(new HibernateCallback(){
            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                List list2 = session.createSQLQuery(sql).list();
                return list2;
            }});
        if(list == null || list.size() < 1){
            return  false;//不存在
        }else {
            return  true; //存在
        } 
        /**
         * 第二种方示用this.getHibernateTemplate().getSessionFactory().openSession()得到session
         */
        /*
        Session session = this.getHibernateTemplate().getSessionFactory().openSession();
        session.beginTransaction();
        list = session.createSQLQuery("SELECT * FROM userinfo WHERE userName = '"+userInfo.getUserName()+"' AND userPwd = '"+userInfo.getUserPwd()+"'").list();
        System.out.println(list.size());
        session.getTransaction().commit();
        session.close();
        if(list == null || list.size() < 1){
            return  false;//不存在
        }else {
            return  true; //存在
        }
        */
    }
 
	public UserInfo findByNameAndPwd(UserInfo userInfo){
       Session session = this.getHibernateTemplate().getSessionFactory().openSession();
       session.beginTransaction();
       /**
        * 第一种方法
        * 使用原生SQL语句，需要使用：SQLQuery接口；使用原生SQL语句时，不会往Session（一级）缓存中放入数据，即SQLQuery接口中的list()方法不会往Session（一级）缓存中放入数据；SQLQuery接口的list()方法返回的List集合中存储的是数组对象
        */
       //int id = (Integer) session.createSQLQuery("SELECT userId FROM userinfo WHERE userName = '"+userInfo.getUserName()+"' AND userPwd = '"+userInfo.getUserPwd()+"'").uniqueResult();
       //UserInfo u = (UserInfo)session.get(UserInfo.class, id);
       /**
        * 第二种方法，使用HQL
        */
       UserInfo u = (UserInfo) session.createQuery("from UserInfo u where u.userName = :username And u.userPwd =:password")
       		  .setParameter("username", userInfo.getUserName())
       		  .setParameter("password", userInfo.getUserPwd())
       		  .list().get(0);
       session.getTransaction().commit();
       session.close();
       return u;
    }

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource(name="hibernateTemplate")
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
