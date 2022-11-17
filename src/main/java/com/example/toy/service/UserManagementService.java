package com.example.toy.service;

import com.example.toy.mapper.UserManagementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
@Service
public class UserManagementService {

 @Autowired
 UserManagementMapper UserManagementMapper;
 
  public HashMap<String, String> UserSum () throws Exception {
	  HashMap<String, String> HashMap = new HashMap<String, String>();
	  HashMap = UserManagementMapper.UserSum();
	  
	return HashMap;
	  
  }
  
  public HashMap<String, String> Userincrease () throws Exception {
	  HashMap<String, String> HashMap = new HashMap<String, String>();
	  HashMap = UserManagementMapper.Userincrease();
	  
	return HashMap;
	  
  }
}