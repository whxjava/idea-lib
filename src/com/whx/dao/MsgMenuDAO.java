package com.whx.dao;

import com.whx.bean.MsgMenu;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Component
public class MsgMenuDAO {
    private HibernateTemplate hibernateTemplate;

    public List<MsgMenu> findPageByMenuId(int menuId ,int pageNow ,int pageSize){
        final String hql = "from com.whx.bean.MsgMenu mm where menuId = '"+menuId +"' order by mm.publishTime desc";
        final int firstResult = (pageNow - 1) * pageSize ;
        final int innerPageSize = pageSize ;
        return findPage(firstResult,innerPageSize,hql);

    }

    public Integer pageCountByMenuId(int menuId ,int pageSize){
        int pageCount , rowCount = 0 ;
    	final String hql = "from com.whx.bean.MsgMenu mm where menuId = '"+menuId +"' order by mm.publishTime desc";
        rowCount = pageCount(hql);
        pageCount = rowCount % pageSize == 0 ? (rowCount / pageSize):(rowCount /pageSize)+1 ;
        return  pageCount;
    }

    public List<MsgMenu> findReadCountByMenuId(int menuId ,int pageNow ,int pageSize){
        final String hql = "from com.whx.bean.MsgMenu mm where menuId ='"+menuId+"' order by mm.readCount desc";
        final int firstResult = (pageNow - 1) * pageSize ;
        final int innerPageSize = pageSize ;
        return this.findPage(firstResult,innerPageSize,hql);
    }

    public MsgMenu findById(int id){
        return hibernateTemplate.get(MsgMenu.class,id);
    }

    @SuppressWarnings("unchecked")
	public List<MsgMenu> findByMenuID(Integer menuId){
        List<MsgMenu> list = new ArrayList<MsgMenu>();
        Session session = hibernateTemplate.getSessionFactory().openSession();
        session.beginTransaction();
        list = session.createQuery("select msgMenu.id, msgMenu.message.msgTitle from MsgMenu msgMenu where menuId = :menuId")
        				.setParameter("menuId",menuId)
        				.list();
        session.getTransaction().commit();
        session.close();
        return list;
    }

    public Integer pageCount(final String hql){
        return hibernateTemplate.execute(new HibernateCallback<Integer>() {
          
            public Integer doInHibernate(Session session) throws HibernateException, SQLException {
                return session.createQuery(hql).list().size();
            }
        });
    }

    @SuppressWarnings("unchecked")
	public  List<MsgMenu> findPage( final int firstResult ,final int innerPageSize ,final String hql ){
        return hibernateTemplate.executeFind(new HibernateCallback<Object>() {
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                return  session.createQuery(hql).setFirstResult(firstResult).setMaxResults(innerPageSize).list();
            }
        });
        /*
        List<MsgMenu> list = new ArrayList<MsgMenu>();
        Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
        list = session.createQuery("from com.whx.bean.MsgMenu mm where mm.systemMenu.Id ="+menuId)
                .setFirstResult((pageNow - 1) * pageSize)
                .setMaxResults(pageSize)
                .list();
        return list ;
        */
    }

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    @Resource
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

}
