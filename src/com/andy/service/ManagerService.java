package com.andy.service;

import com.andy.entity.Manager;

public interface ManagerService {
	public Manager getManagerById(String id);
	public boolean login(Manager manager);
	public boolean modifyPassword(String id,String oldPassword,String newPassword);
}
