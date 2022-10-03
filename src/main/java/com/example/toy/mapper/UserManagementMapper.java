package com.example.toy.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserManagementMapper {

	HashMap<String,String> UserSum();
}
