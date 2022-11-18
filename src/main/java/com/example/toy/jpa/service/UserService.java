package com.example.toy.jpa.service;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.jpa.repository.LoginRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


@Slf4j // 로깅에 대한 추상 레이어를 제공하는 인터페이스의 모음.
@RequiredArgsConstructor
@Service
public class UserService implements UserDetailsService{


    private final LoginRepository loginRepository;

    private final PasswordEncoder passwordEncoder;


    @Override
    public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
    
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증       
        Login_User LoginUser =loginRepository.findByUserid(userid).get();

        if (LoginUser == null){
            throw new UsernameNotFoundException("User not authorized.");
        }
        return User.builder()        		
        		.username(LoginUser.getUserid())
        		.password(LoginUser.getUserPw())
        		.roles(LoginUser.getUserAuth())
        		.build();
    }

    }
