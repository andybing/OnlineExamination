package com.andy.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

final public class HibernateSessionUtil {

	private static SessionFactory sessionFactory=null;
	//线程局部模式
	private static ThreadLocal<Session> threadLocal=new ThreadLocal<Session>();
	private HibernateSessionUtil(){}
	static{
		sessionFactory=new Configuration().configure().buildSessionFactory();
	}
	public static Session openSession()
	{
		return sessionFactory.openSession(); 
	}
	//获取和线程关联的session
	public static Session getCurrentSession()
	{
		Session session=threadLocal.get();
		//判断是不是的得到了
		if(session==null){
			session=sessionFactory.openSession();
			//把session对象设置到threadLocal
			threadLocal.set(session);
		}
		return session;
	}
}
