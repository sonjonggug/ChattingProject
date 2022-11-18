package com.example.toy.service;

import com.example.toy.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AdminService {

 @Autowired
 AdminMapper AdminMapper;
 
 
  

  /*public ArrayList<HashMap> chattLog (String userid) throws Exception {

	return  AdminMapper.chattLog(userid);
  
 }
  
  public boolean deleteUser(LoginUserDto loginUserDto) throws Exception {
		
		 
		return AdminMapper.deleteUser(loginUserDto);
					  
		  }*/
}