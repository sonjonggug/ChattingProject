package com.example.toy.jpa;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.vo.LoginUserDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;


@Slf4j // 로깅에 대한 추상 레이어를 제공하는 인터페이스의 모음.
@RequiredArgsConstructor
@Service
public class UserService implements UserDetailsService{


    private final LoginRepository loginRepository;

    private final PasswordEncoder passwordEncoder;

    
    
    
    
    
    /**
     * id를 매개변수로 받아서 아이디 조회 아이디 있으면 0 리턴 , 없거나 null 이면 1 리턴
     * @param userid
     * @return LoginController/checkId
     * @throws Exception
     */
    public int checkid(String userid) throws Exception{
    	
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증       
    	

    	try {
    		 Boolean id =loginRepository.findByUserid(userid).isPresent();

    		  if (id == false){
                  log.info("존재 하지않는 아이디");
    	        	 return 1; 
    	        }else {
                  log.info("존재하는 아이디");
    	        	return 0;
    	        }   
    	} catch (NullPointerException e) {
    		return 1; 
    	}
    	  	
    }	
    
    /**
     * 접속자 로그인 시간 업데이트 
     * @param userid
     * @throws Exception
     */
    @Transactional
    public void updateDate(String userid) throws Exception{  	
    	 SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");
    	 today.format(new Date());
    	 loginRepository.updateDate(today.format(new Date()),userid);
    }

    public boolean updateUser(LoginUserDto loginUserDto) throws Exception {
        Login_User login_User = new Login_User();
        String userid = loginUserDto.getUserid();

        boolean id = loginRepository.findByUserid(userid).isPresent();

        if(id == false) {
            System.out.println("아이디 없음");
            return false;
        } else {
            login_User.builder()
                    .userNum(loginUserDto.getUserNum())
                    .userName(loginUserDto.getUserName())
                    .userAuth(loginUserDto.getUserAuth())
                    .userSex(loginUserDto.getUserSex())
                    .build();


           loginRepository.save(login_User);
            System.out.println("변경 완료");
            return true;
        }
    }
    
    /**
     * 회원가입 , 비밀번호를 인코딩하여 DB에 저장
     * @param User
     * @return
     * @throws Exception
     */
    public boolean insertUser(HashMap map){

            Login_User user = new Login_User();
            if( map.get("userId")!=null && map.get("userPw")!=null && map.get("userSex")!=null &&
                map.get("userName")!=null && map.get("userAuth")!=null && map.get("joinDate")!=null && map.get("loginDate")!=null) {

                String userid = (String) map.get("userId");
                user.joinUser(map);

                boolean findById = loginRepository.findByUserid(userid).isPresent(); // Optional 의 value 가 null 이면 false
        //DB에 저장
                if(findById == false){
                    user.joinUser(map);
                    loginRepository.save(user);
                    log.info("회원가입 성공");
                    return true;
                    } else  {
                    log.info("회원가입 실패");
                    return false;
                    }
             } else {
                log.info("파라미터 null");
                return false;
                }
            }
    
    /**
     * 시큐리티 로그인 인증
     * 시큐리티에서 제공하는 메서드 loadUserByUsername 재정의하여 사용
     * 매개변수로 넘긴 userid값으로 조회한 아이디와 패스워드를 Input 값과 비교 
     */
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
   