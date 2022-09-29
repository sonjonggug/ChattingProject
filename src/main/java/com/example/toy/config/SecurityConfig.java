package com.example.toy.config;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.toy.jpa.UserService;

import lombok.RequiredArgsConstructor;

@EnableWebSecurity        //spring security 를 적용한다는 Annotation
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final UserService userService;
    
    /**
     * 규칙 설정
     * @param http
     * @throws Exception
     */
   
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http   
            .authorizeRequests()
                .antMatchers( "/Login", "/signup","/checkid","/access_denied","/attachFile" ,"/resources/**").permitAll() // 로그인,회원가입,다운로드 권한은 누구나, resources파일도 모든권한
                // USER, ADMIN 접근 허용
                .antMatchers("/userAccess").hasRole("USER") // 해당 URL로 요청 시 설정을 해준다. hasRole : andMatchers에 속해있는 URL로 요청이 들어오면 권한을 확인한다.
                .antMatchers("/userAccess").hasRole("ADMIN") // 해당 URL로 요청 시 설정을 해준다.  hasRole : andMatchers에 속해있는 URL로 요청이 들어오면 권한을 확인한다.
                .and()
            .formLogin()
                .loginPage("/Login")
                .loginProcessingUrl("/login_proc")
                .defaultSuccessUrl("/user_access")
                .failureUrl("/access_denied") // 인증에 실패했을 때 보여주는 화면 url, 로그인 form으로 파라미터값 error=true로 보낸다.
                .and();
 
//        .csrf().disable();		// 사이트 간 요청 위조 설정이다.
    }

     
    /**
     * 로그인 인증 처리 메소드
     * @param auth
     * @throws Exception
     */
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
    }
}