package com.example.toy.service;

import com.example.toy.mapper.AdminMapper;
import com.example.toy.vo.LoginUserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
@Service
public class AdminService {

 @Autowired
 AdminMapper AdminMapper;
 
 
  

  public ArrayList<HashMap> chattLog (String userid) throws Exception {

	return  AdminMapper.chattLog(userid);
  
 }
  
  public boolean deleteUser(LoginUserDto loginUserDto) throws Exception {
		
		 
		return AdminMapper.deleteUser(loginUserDto);
					  
		  }
}