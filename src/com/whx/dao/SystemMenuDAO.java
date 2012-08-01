package com.whx.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.whx.bean.SystemMenu;
import com.whx.bean.Tree;

@Component
public class SystemMenuDAO {
	
	private HibernateTemplate hibernateTemplate;
	
	public List<Tree> createSystemMenuTree(){
		List<Tree> list = new ArrayList<Tree>();
		List<SystemMenu> listSysMenu = this.findAll(); 
		if(listSysMenu != null && listSysMenu.size()>1){
			for(int i = 0 ; i < listSysMenu.size();i++){
				SystemMenu sys = listSysMenu.get(i);
				Tree tree = new Tree();
				tree.setId(sys.getId());
				tree.setPid(sys.getPId());
				tree.setName(sys.getName());
				list.add(tree);
			}
		}
		return list;
	}
	
	public boolean DeleteById(int Id){
		try {
			hibernateTemplate.delete(hibernateTemplate.get(SystemMenu.class, Id));
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<SystemMenu> findTop(){
        return hibernateTemplate.execute(new HibernateCallback<List>() {
            public List<SystemMenu> doInHibernate(Session session) throws HibernateException, SQLException {
                return  session.createQuery("from SystemMenu").setFirstResult(0).setMaxResults(12).list();
            }
        });
	}
	
	@SuppressWarnings("unchecked")
	public List<SystemMenu> findAll(){
		return hibernateTemplate.find("from SystemMenu systemMenu");
	}
	
	public SystemMenu findById(int id){
		return this.hibernateTemplate.get(SystemMenu.class, id);
	}
	
	public boolean save(SystemMenu systemMenu){
		try {
			hibernateTemplate.save(systemMenu);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
