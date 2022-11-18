package com.example.toy.jpa.service;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.vo.LoginUserDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j // 로깅에 대한 추상 레이어를 제공하는 인터페이스의 모음.
@RequiredArgsConstructor // final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Service
public class JpaAdminService {

    private final LoginRepository loginRepository;

    private final PasswordEncoder passwordEncoder;



    public List<Login_User> ShowUser(){

     return loginRepository.findAll();

    }
    public Login_User selectUser(Long userNum){
        return loginRepository.findByUserNum(userNum).get();

    }

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
    @Transactional // 트랜잭션 안에서 entity를 조회해야 영속성 상태로 조회 그 상태에서 값을 변경하면 변경 감지가 일어난다.
    public void updateDate(String userid) throws Exception{
        SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        today.format(new Date());
        Login_User user = loginRepository.findByUserid(userid).get(); // 아이디 조회 후
        user.setLoginDate(today.format(new Date())); // 영속성 상태에서 값 변경시 변경감지 따로 save X

    }

    @Transactional // 트랜잭션 안에서 entity를 조회해야 영속성 상태로 조회 그 상태에서 값을 변경하면 변경 감지가 일어난다.
    public String updateUser(LoginUserDto loginUserDto) throws Exception {
        Long userNum = loginUserDto.getUserNum();
        String userId = loginUserDto.getUserid();

        // 기존 아이디와 같은지 ( 아이디 변경 유무 )
        boolean IdSame = loginRepository.findByUserNum(userNum).get().getUserid().equals(userId);

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

                log.info("아이디 변경을 시도하고 아이디 중복이 아닐때");

                return "업데이트가 완료되었습니다.";
            }
        } else { // 아이디 변경이 아닐때
            Login_User user = loginRepository.findByUserNum(userNum).get();
            user.setUserName(loginUserDto.getUserName());
            user.setUserSex(loginUserDto.getUserSex());
            user.setUserAuth(loginUserDto.getUserAuth());

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

        if( userDto.getUserid()!=null && userDto.getUserName()!=null &&
                userDto.getUserSex()!=null &&userDto.getUserPw()!=null) {


            SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");
            userDto.setUserAuth("USER");
            userDto.setLoginDate(today.format(new Date()));
            userDto.setJoinDate(today.format(new Date()));

            boolean findById = loginRepository.findByUserid(userDto.getUserid()).isPresent(); // id 중복 체크
            Login_User user = new Login_User();
            if(findById == false){ // 아이디 중복이 아닐 경우
                user.joinUser(userDto);
                loginRepository.save(user);
                log.info("회원가입 성공");
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
     * 회원 삭제 find 후 delete
     * @param userNum
     * @return
     */
    public boolean deleteUser(Long userNum){
        if (loginRepository.findById(userNum).isPresent()) {
            loginRepository.deleteById(userNum);
            log.info("삭제 성공");
            return true;
        } else {
            log.info("삭제 실패");
            return false;
        }
    }

}