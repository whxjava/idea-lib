package com.whx.dao;

import com.whx.bean.Message;
import com.whx.bean.MsgMenu;
import com.whx.bean.SystemMenu;
import com.whx.bean.UserInfo;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class MessageDAO {
	
    private HibernateTemplate hibernateTemplate;

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }
    @Resource
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    public void save(Message message,int menuId,int userId)throws Exception{
    	MsgMenu msgMenu = new MsgMenu();
        Session session = hibernateTemplate.getSessionFactory().openSession();
        session.beginTransaction();
        message.setUserInfo((UserInfo) session.get(UserInfo.class, userId));
        session.save(message);
        msgMenu.setMessage(message);
        msgMenu.setSystemMenu((SystemMenu) session.get(SystemMenu.class, menuId));
        msgMenu.setPublishTime(new Date().toString());
        session.save(msgMenu);
        session.getTransaction().commit();
        session.close();
    }
    
    public void del(int id){
        hibernateTemplate.delete(hibernateTemplate.get(Message.class,id));
    }
    
    public Message findById(int id){
        return hibernateTemplate.get(Message.class,id);
    }
    
    public void update(Message message){
    
    }
    
    @SuppressWarnings("unchecked")
	public List<Message> findAll(){
    	return this.hibernateTemplate.find("from Message message");
    }
    
    @SuppressWarnings("unchecked")
	public List<Message> findByPage(int pageSize ,int pageNow){
        List<Message> list = new ArrayList<Message>();
        Session session = hibernateTemplate.getSessionFactory().openSession();
        session.beginTransaction();
        list =session.createQuery("from Message message order by Id desc")
                .setFirstResult((pageNow -1)*pageSize)
                .setMaxResults(pageSize)
                .list();
        session.getTransaction().commit();
        session.close();
        return list;
    }
    
    public Integer pageCountOfAll(int pageSize){
    	Integer pageCount = 0 ;
    	Integer rowCount = this.findAll().size();
    	pageCount = rowCount % pageSize == 0 ? (rowCount / pageSize):(rowCount / pageSize)+1 ;
    	return pageCount ;
    }

}
