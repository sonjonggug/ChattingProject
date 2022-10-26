package com.example.toy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.mapper.AdminMapper;
@Service
public class AdminService {

 @Autowired
 AdminMapper AdminMapper;
 
 
  
  public boolean updateUser(Login_User login_User) throws Exception {
	
	 
	return AdminMapper.updateUser(login_User);
				  
	  }
  
  public boolean deleteUser(Login_User login_User) throws Exception {
		
		 
		return AdminMapper.deleteUser(login_User);
					  
		  }
}