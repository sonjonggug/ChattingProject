package com.example.toy.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.toy.jpa.entity.Talk_Bot_Log;
import com.example.toy.jpa.entity.User_Talk_Log;

@Mapper
public interface UserManagementMapper {

	HashMap<String,String> UserSum();
	
	HashMap<String,String> Userincrease();
	
	ArrayList<HashMap> showUser();
	
	HashMap<String,String> selectUser(String user_no);
	
	String UserTalkLog (String talk , String mid , String channel);

	public int UserTalkLog(User_Talk_Log userTalk);
	
	public void talkBotSave(Talk_Bot_Log botTalk);
	
}
