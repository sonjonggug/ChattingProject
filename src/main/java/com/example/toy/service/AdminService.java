package com.example.toy.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.example.toy.vo.LoginUserDto;
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
  
  public ArrayList<HashMap> chattLog (String userid) throws Exception {

	return  AdminMapper.chattLog(userid);
  
 }
  
  public boolean deleteUser(LoginUserDto loginUserDto) throws Exception {
		
		 
		return AdminMapper.deleteUser(loginUserDto);
					  
		  }
}