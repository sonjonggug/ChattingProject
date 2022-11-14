package com.example.toy.jpa.service;

import com.example.toy.jpa.UserService;
import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.vo.LoginUserDto;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@RunWith(SpringRunner.class)
@SpringBootTest
class JpaAdminServiceTest {
    @Autowired
    private LoginRepository loginRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserService userService;

    @Autowired
    private JpaAdminService jpaAdminService;

    /*@Test
    public void saveTest(){


        String password=passwordEncoder.encode("thswhdrnr12");
        Login_User user = new Login_User();
        user.setUserNum(1L);
        user.setUserid("thswhdrnr155");
        user.setUserName("종국");
        user.setUserPw(password);
        user.setJoinDate("2022-11-10 05:33");
        user.setLoginDate("2022-11-10 05:33");
        user.setUserAuth("USER");
        user.setUserSex("M");

        Login_User user1 = new Login_User();
        user1.setUserid("thswhdrnr15");
        user1.setUserName("종국");
        user1.setUserPw(password);
        user1.setJoinDate("2022-11-10 05:33");
        user1.setLoginDate("2022-11-10 05:33");
        user1.setUserAuth("USER");
        user1.setUserSex("M");
        loginRepository.save(user);
        loginRepository.save(user1);

        System.out.println(loginRepository);

    }*/

    /*@Test
    public void insertTest(){
        HashMap map = new HashMap();
        SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String password=passwordEncoder.encode("thswhdrnr12");

        map.put("userId","thswhdrnr255");
        map.put("userPw",password);
        map.put("userName","종국");
        map.put("userSex","M");
        map.put("userAuth","USER");
        map.put("joinDate",sDate2.format(new Date()));
        map.put("loginDate",sDate2.format(new Date()));
        userService.insertUser(map);

    }*/

    @Test
    public void checkidTest() throws Exception {
        userService.checkid("thswhdrnr25");
    }
    @Test
    public void selectUserTest(){
        jpaAdminService.selectUser(55L);
    }
    @Test
    public void updateUserTest() throws Exception {
        LoginUserDto loginUserDto = new LoginUserDto();
        loginUserDto.setUserNum(1L);
        loginUserDto.setUserName("두번째");
        loginUserDto.setUserid("thswhdrnr5");
        loginUserDto.setUserAuth("USER");
        loginUserDto.setUserSex("W");

        userService.updateUser(loginUserDto);

    }

}