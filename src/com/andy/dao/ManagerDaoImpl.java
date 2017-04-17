package com.andy.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.andy.entity.Manager;
import com.andy.entity.Student;
import com.andy.util.HibernateSessionUtil;

public class ManagerDaoImpl implements ManagerDao{
	private Session session = HibernateSessionUtil.getCurrentSession();
	@Override
	public Manager getManagerById(String id) {
//		Query query = session.createQuery("from Manager where id = '"+id+"'");
//		List<Manager> students = query.list();
//		System.out.println(students.size());
//		return students.get(0);
		Manager manager = (Manager) session.load(Manager.class, id);
		return manager;
	}
	@Override
	public boolean modifyPassword(String id, String newPassword) {
		Manager manager = (Manager)session.load(Manager.class, id);
		Transaction transaction = session.beginTransaction();
		manager.setPassword(newPassword);
		transaction.commit();
		return true;
	}
//	public static void main(String[] args) {
//		new ManagerDaoImpl().getManagerById("2012");
//	}
}
