package web.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import web.dto.Member;

public class KakaoApi {
   
   public JsonNode getAccessToken(String autorize_code) {
      
      final String RequestUrl = "https://kauth.kakao.com/oauth/token";
      
      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
      
      //포스트 파라미터의 grant_type이라는 명칭에 authorization_code를 추가한다 아래도 동일
      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
      
      postParams.add(new BasicNameValuePair("client_id", "2c8bb256bd1dfd39210162d0e5b2b96e"));
      
      postParams.add(new BasicNameValuePair("redirect_uri", "http://192.168.30.53:8088/member/kakaoLogin"));
      
      postParams.add(new BasicNameValuePair("code", autorize_code));
      
      System.out.println("autorize_code"+autorize_code);
      
      final HttpClient client = HttpClientBuilder.create().build();
      
      final HttpPost post = new HttpPost(RequestUrl);
      
      JsonNode returnNode = null;
      
      try {
         
         post.setEntity(new UrlEncodedFormEntity(postParams));
         
         final HttpResponse response = client.execute(post);
         
         ObjectMapper mapper = new ObjectMapper();
         
         returnNode = mapper.readTree(response.getEntity().getContent());
         
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      
      } catch (ClientProtocolException e) {
         e.printStackTrace();
         
      } catch (IOException e) {
         e.printStackTrace();
         
      }
      
      return returnNode;
      
   }
}