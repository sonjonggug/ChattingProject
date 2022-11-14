package com.example.toy.jpa.service;

import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.jpa.entity.Login_User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@RequiredArgsConstructor // final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Service
public class JpaAdminService {
    private final LoginRepository loginRepository;

    public List<Login_User> ShowUser(){

     return loginRepository.findAll();

    }
    public Login_User selectUser(Long userNum){
        return loginRepository.findByUserNum(userNum).get();

    }


    public Login_User userTalkLog(Long userNum){

        return loginRepository.findByUserNum(userNum).get();

    }

    }