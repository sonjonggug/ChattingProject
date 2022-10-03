package com.example.toy.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.toy.mapper.UserManagementMapper;
@Service
public class UserManagementService {

 @Autowired
 UserManagementMapper UserSumDao;
 
  public HashMap<String, String> UserSum () throws Exception {
	  HashMap<String, String> HashMap = new HashMap<String, String>();
	  HashMap = UserSumDao.UserSum();
	  System.out.println(HashMap);
	return HashMap;
	  
  }
}
