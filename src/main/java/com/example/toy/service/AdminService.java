package com.example.toy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.mapper.AdminMapper;
@Service
public class AdminService {

 @Autowired
 AdminMapper AdminMapper;
 
 
  
  public void updateUser(Login_User login_User) throws Exception {
	  AdminMapper.updateUser(login_User);
				  
	  }
}