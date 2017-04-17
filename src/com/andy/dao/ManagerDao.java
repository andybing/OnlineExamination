package com.andy.dao;

import com.andy.entity.Manager;

public interface ManagerDao {
	public Manager getManagerById(String id);
	public boolean modifyPassword(String id,String newPassword);
}
