package com.example.toy.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

// 네이버 기계번역 (Papago SMT) API 예제
@Service
public class KaKaoApiService {

    @SuppressWarnings("unchecked")
	public String Start(String talk) {
    	        
          Map<String, String> requestHeaders = new HashMap<>();  // 헤더 값 
          requestHeaders.put("Authorization", "KakaoAK de2e0377afd808efda37ffe9dd801c15");
          requestHeaders.put("Content-Type", "application/json");
          
          String apiUrl = "https://api.kakaobrain.com/v1/inference/kogpt/generation";
          
          JSONObject jsonData = new JSONObject(); // JSON 형식으로 전달
          jsonData.put("prompt", talk); // 전달할 제시어
          jsonData.put("max_tokens", 120); // 생성할 결과의 최대 글자 수 
          jsonData.put("n", 1); // 생성할 결과 수
          jsonData.put("temperature", 0.1); // 0 초과 1 이하의 실수 값 사용 가능 , temperature 수치가 높을수록 더 창의적인 결과가 생성됨
          jsonData.put("top_p", 0.1); //0 이상 1 이하의 실수 값 사용 가능 ,  top_p 수치가 높을수록 더 창의적인 결과가 생성됨
         
          
          
          
                         
          String responseBody = post(apiUrl, requestHeaders, jsonData);
                   
          return responseBody;  
      }

      private static String post(String apiUrl, Map<String, String> requestHeaders, JSONObject jsonData) {
          HttpURLConnection con = connect(apiUrl);

          try {
              con.setRequestMethod("POST"); // POST 형식으로
              for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                  con.setRequestProperty(header.getKey(), header.getValue()); // Request 속성 값 설정하기 원래는 con.setRequestProperty("Content-type", "application/json"); 으로 설정하는데 for문으로 간단하게 처리
              }
                    
              con.setDoOutput(true); // 받아온 Json 데이터를 출력 가능한 상태(True)
              try (OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream(), "UTF-8")) {            	 
            	  wr.write(jsonData.toString());  // JSON형식을 String으로 다시 변환
                  wr.flush();
              }

              int responseCode = con.getResponseCode();
              if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                  return readBody(con.getInputStream());
              } else {  // 에러 응답
                  return readBody(con.getErrorStream());
              }
          } catch (IOException e) {
              throw new RuntimeException("API 요청과 응답 실패", e);
          } finally {
              con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
          }
      }

      private static HttpURLConnection connect(String apiUrl) {
          try {
              URL url = new URL(apiUrl);
              return (HttpURLConnection) url.openConnection();
          } catch (MalformedURLException e) {
              throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
          } catch (IOException e) {
              throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
          }
      }

      private static String readBody(InputStream body) {
          InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

          try (BufferedReader lineReader = new BufferedReader(streamReader)) {
              StringBuilder responseBody = new StringBuilder();

              String line;
              while ((line = lineReader.readLine()) != null) {
                  responseBody.append(line);
              }

              return responseBody.toString();
          } catch (IOException e) {
              throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
          }
      }
  }