package manage.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import manage.dao.KaoQinLogDao;
import manage.model.KaoQinLog;

public class KaoQinLogDaoImpl extends HibernateDaoSupport implements  KaoQinLogDao{
	
	@SuppressWarnings("unchecked")
	public List<KaoQinLog> getAll(String where) {
		return this.getHibernateTemplate().find("from KaoQinLog where 1=1 "+where+" order by id");
	}
	
	public void insertKaoQinLog(KaoQinLog kaoqinlog){
		this.getHibernateTemplate().save(kaoqinlog);
	}
	
	public void delKaoQinLog(KaoQinLog kaoqinlog) {
		this.getHibernateTemplate().delete(kaoqinlog);
	}
	
	public void updateKaoQinLog(KaoQinLog kaoqinlog) {
		this.getHibernateTemplate().update(kaoqinlog);
		
	}

	@SuppressWarnings("unchecked")
	public List<KaoQinLog> selectAllKaoQinLog(final int start,final int limit) {
		return (List<KaoQinLog>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<KaoQinLog> list = session.createQuery("from KaoQinLog  order by id desc")
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}

	public int selectAllKaoQinLogCount() {
		long count = (Long)this.getHibernateTemplate().find("select count(*) from KaoQinLog").get(0);
		return (int)count;
	}

	public KaoQinLog selectKaoQinLog(int id) {
		return this.getHibernateTemplate().get(KaoQinLog.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<KaoQinLog> selectAllKaoQinLogBy(final int start,final int limit,final String keyword) {
		return (List<KaoQinLog>)this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(final Session session)throws HibernateException, SQLException {				
				List<KaoQinLog> list = session.createQuery("from KaoQinLog where 1=1 "+keyword+" order by id desc")
				.setFirstResult(start)
				.setMaxResults(limit)
				.list();
				return list;
			}
		});
	}
	
}
