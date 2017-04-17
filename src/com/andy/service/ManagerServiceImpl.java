package com.andy.service;

import com.andy.dao.ManagerDao;
import com.andy.dao.ManagerDaoImpl;
import com.andy.dao.StudentDao;
import com.andy.dao.StudentDaoImpl;
import com.andy.entity.Manager;
import com.andy.entity.Student;

public class ManagerServiceImpl implements ManagerService{
	private ManagerDao managerDao = new ManagerDaoImpl();
	@Override
	public boolean login(Manager manager) {
		Manager manager_db = managerDao.getManagerById(manager.getId());
		if(manager!=null){
			if(manager.equals(manager_db)){
				return true;
			}
		}
		return false;
	}
	@Override
	public boolean modifyPassword(String id,String oldPassword ,String newPassword) {
		Manager manager = managerDao.getManagerById(id);
		if(oldPassword.equals(manager.getPassword())){
			return managerDao.modifyPassword(id, newPassword);
		}else{
			return false;
		}
		
	}
	@Override
	public Manager getManagerById(String id) {
		return managerDao.getManagerById(id);
	}

}
