/*
package com.example.toy.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect // AOP 어노테이션
public class TimeTraceAop {


    @Around("execution(* hello.hellospring..*(..))")
    public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis(); // 시작시간 측정
        System.out.println("START: " + joinPoint.toString());
        try{
            // 다음꺼 진행
            return joinPoint.proceed();
        } finally {
            long finish = System.currentTimeMillis(); // 끝난시간 측정
            long timeMs = finish - start; // 끝난시간 - 시작시간 = 걸린시간
            System.out.println("END: " + joinPoint.toString()+ " " + timeMs + "ms");
        }
    }
}

*/
