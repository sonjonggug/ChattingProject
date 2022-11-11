package com.example.toy.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.toy.jpa.entity.Talk_Bot_Log;
import com.example.toy.jpa.entity.User_Talk_Log;
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
  public ArrayList<HashMap> showUser () throws Exception {
//	  HashMap<String, String> HashMap = new HashMap<String, String>();
	  ArrayList<HashMap> HashMap = new ArrayList<HashMap>();
	  	  
	  HashMap = UserManagementMapper.showUser();
	  
	return HashMap;
  
}
  public HashMap<String, String> selectUser (String userNum) throws Exception {
	  HashMap<String, String> HashMap = new HashMap<String, String>();
	  
	  HashMap = UserManagementMapper.selectUser(userNum);
	  
	return HashMap;
  
 }
  
  public int UserTalkLog (User_Talk_Log userTalk) throws Exception {
        return UserManagementMapper.UserTalkLog(userTalk);
				  
	  }
  
  public void talkBotSave (Talk_Bot_Log botTalk) throws Exception {
      UserManagementMapper.talkBotSave(botTalk);
				  
	  }
}