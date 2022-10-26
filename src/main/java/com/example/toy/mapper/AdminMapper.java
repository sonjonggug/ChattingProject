package com.example.toy.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.toy.jpa.entity.Login_User;

@Mapper
public interface AdminMapper {
		
	public boolean updateUser(Login_User login_User);
	
	public boolean deleteUser(Login_User login_User);
	
}
