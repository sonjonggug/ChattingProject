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
        Login_User user = loginRepository.findByUserid(userid).get();
        user.setLoginDate(today.format(new Date()));
        /* loginRepository.findByUserid(userid).ifPresent(item -> {
             item.setLoginDate(today.format(new Date()));
             loginRepository.save(item);
         });*/
    }

    @Transactional
    public String updateUser(LoginUserDto loginUserDto) throws Exception {
        Long userNum = loginUserDto.getUserNum();
        String userId = loginUserDto.getUserid();

        // 기존 아이디와 같은지 ( 아이디 변경 유무 )
        boolean IdSame = loginRepository.findByUserNum(userNum).get().getUserid().equals(userId);

        System.out.println(IdSame);

        if (IdSame == false) { // 아이디 변경을 시도
            boolean IdEexist = loginRepository.findByUserid(userId).isPresent(); // 아이디 중복 체크
            if (IdEexist == true) {
                log.info("이미 존재하는 아이디입니다.");
                return "이미 존재하는 아이디입니다.";
            } else { // 아이디 변경을 시도하고 아이디 중복이 아닐때
                Login_User user = loginRepository.findByUserNum(userNum).get();
                user.setUserid(loginUserDto.getUserid());
                user.setUserName(loginUserDto.getUserName());
                user.setUserSex(loginUserDto.getUserSex());
                user.setUserAuth(loginUserDto.getUserAuth());

                /*loginRepository.findByUserNum(userNum).ifPresent(item -> {
                    item.setUserid(loginUserDto.getUserid());
                    item.setUserName(loginUserDto.getUserName());
                    item.setUserSex(loginUserDto.getUserSex());
                    item.setUserAuth(loginUserDto.getUserAuth());
                    loginRepository.save(item);
                });*/
                log.info("아이디 변경을 시도하고 아이디 중복이 아닐때");

                return "업데이트가 완료되었습니다.";
            }
        } else { // 아이디 변경이 아닐때
            Login_User user = loginRepository.findByUserNum(userNum).get();
            user.setUserName(loginUserDto.getUserName());
            user.setUserSex(loginUserDto.getUserSex());
            user.setUserAuth(loginUserDto.getUserAuth());

           /* loginRepository.findByUserNum(userNum).ifPresent(item -> {
                item.setUserName(loginUserDto.getUserName());
                item.setUserSex(loginUserDto.getUserSex());
                item.setUserAuth(loginUserDto.getUserAuth());
                loginRepository.save(item);
            });*/
            log.info("아이디 변경이 아닐때");
        }
        return "업데이트가 완료되었습니다.";
    }

        /**
     * 회원가입 , 비밀번호를 인코딩하여 DB에 저장
     * @param User
     * @return
     * @throws Exception
     */
    public String insertUser(LoginUserDto userDto){

            Login_User user = new Login_User();

            if( userDto.getUserid()!=null && userDto.getUserName()!=null &&
                    userDto.getUserSex()!=null &&userDto.getUserPw()!=null) {

                SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                System.out.println("--------패스워드 값" + userDto.getUserPw());

                userDto.setUserAuth("USER");
                userDto.setLoginDate(sDate2.format(new Date()));
                userDto.setJoinDate(sDate2.format(new Date()));

                boolean findById = loginRepository.findByUserid(userDto.getUserid()).isPresent(); // id 중복 체크

                if(findById == false){ // 아이디 중복이 아닐 경우
                    user.joinUser(userDto);
                    loginRepository.save(user);
                    return "회원가입에 성공하였습니다." ;
                    } else  {
                    log.info("회원가입 실패");
                    return "중복된 아이디 입니다. 다시 시도하여 주십시오." ;
                    }
             } else {
                log.info("파라미터 null");
                return "회원가입에 실패하였습니다. 다시 시도해 주십시요.";
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
   