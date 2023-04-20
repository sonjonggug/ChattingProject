package com.example.toy.config;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.toy.jpa.service.UserService;

import lombok.RequiredArgsConstructor;

@EnableWebSecurity        //spring security 를 적용한다는 Annotation 자동으로 CSRF 보호 기능이 활성화가
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final UserService userService;


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http    .csrf().disable()
                .authorizeRequests()
                .antMatchers("/login", "/signup", "/checkid", "/access_denied", "/attachFile", "/resources/**").permitAll() // 로그인,회원가입,다운로드 권한은 누구나, resources파일도 모든권한
                // USER, ADMIN 접근 허용
             /*   .antMatchers("/user_access").hasRole("USER") // 해당 URL로 요청 시 설정을 해준다. hasRole : andMatchers에 속해있는 URL로 요청이 들어오면 권한을 확인한다.
                .antMatchers("/user_access").hasRole("ADMIN") // 해당 URL로 요청 시 설정을 해준다.  hasRole : andMatchers에 속해있는 URL로 요청이 들어오면 권한을 확인한다.*/
                .anyRequest().authenticated() // 모든 리소스를 의미하며 접근허용 리소스 및 인증후 특정 레벨의 권한을 가진 사용자만 접근가능한 리소스를 설정하고 그외 나머지 리소스들은 무조건 인증을 완료해야 접근이 가능하다는 의미
                .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login_proc")
                .defaultSuccessUrl("/user_access")
                .failureUrl("/access_denied"); // 인증에 실패했을 때 보여주는 화면 url, 로그인 form으로 파라미터값 error=true로 보낸다.


//        .csrf().disable();		// 사이트 간 요청 위조 설정이다.
    }


    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
    }
}
