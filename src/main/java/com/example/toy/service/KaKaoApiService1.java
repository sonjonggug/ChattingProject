package com.example.toy.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

// 네이버 기계번역 (Papago SMT) API 예제
@Service
public class KaKaoApiService1 {

    public String Start(String lang) {
//        String Authorization = "KakaoAK de2e0377afd808efda37ffe9dd801c15";//애플리케이션 클라이언트 아이디값";
        

        String apiURL = "https://api.kakaobrain.com/v1/inference/kogpt/generation";
        String text;
        
        try {
            text = URLEncoder.encode(lang, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        }
//        -H "Authorization: KakaoAK ${REST_API_KEY}" 
//        -H "Content-Type: application/json" 
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Content-Type", "application/json");
        requestHeaders.put("Authorization", "KakaoAK de2e0377afd808efda37ffe9dd801c15");
        
        

        String responseBody = English(apiURL, requestHeaders, text);

//        System.out.println(responseBody);
		return responseBody;
    }
   
    private static String English(String apiUrl, Map<String, String> requestHeaders, String text){
    	System.out.println("검색------------------------"+text);
        HttpURLConnection con = connect(apiUrl);
        String postParams = "max_tokens=120&n=1&prompt=" + text; // max_tokens= 글자수 , n= row 수 , prompt = 전달할 제시어
        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
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
            con.disconnect();
        }
    }
  
    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

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
