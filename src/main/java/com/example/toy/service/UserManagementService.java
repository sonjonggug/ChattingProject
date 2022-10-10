package com.example.toy.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.toy.mapper.UserManagementMapper;
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
  public   ArrayList<HashMap> showUser () throws Exception {
//	  HashMap<String, String> HashMap = new HashMap<String, String>();
	  ArrayList<HashMap> HashMap = new ArrayList<HashMap>();
	  System.out.println("-------------------------------------");	  
	  HashMap = UserManagementMapper.showUser();
	  
	return HashMap;
  
}
  
 }
