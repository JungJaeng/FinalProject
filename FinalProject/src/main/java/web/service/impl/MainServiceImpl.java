package web.service.impl;


import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import web.dto.Sightseeing;
import web.service.face.MainService;

@Service
public class MainServiceImpl implements MainService{
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	 
	private static String Request_URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?";
	private static String KEY = "serviceKey=oVpLLrYOZ3HgAbsrCL7WWVWeyhyK8sMPeScf3RiLkxYxnUSCCgj9rb8kRVW2MXInXYI3sSaZovOLHgmfur2rRg%3D%3D";
	
	public void result(Sightseeing sightseeing) {
		
		String strURL = null; //보낼 주소 URL
		
		strURL = Request_URL; //URL
		strURL += KEY; //서비스키
		strURL += "&numOfRows=12"; //보여줄 개수
		strURL += "&pageNo=1"; // 페이지넘버
		strURL += "MobileOS=ETC"; // 필수요소 모바일OS
		strURL += "&MobileApp=AppTest"; // 필수요소 모바일App
		strURL += "&type=json"; // json 타입
		strURL += "&arrange=A"; // 제목순서로 나열
		strURL += "&listYN=Y"; //리스트 목록 구분 (Y=목록, N=개수)
		strURL += "&"+"cat1="+sightseeing.getCat1(); // 대분류
		strURL += "&"+"cat2="+sightseeing.getCat2(); // 중분류
		strURL += "&"+"cat3="+sightseeing.getCat3(); // 소분류
		strURL += "&"+"areacode"+sightseeing.getAreacode(); // 지역코드
		strURL += "&"+"sigungucode"+sightseeing.getSigungucode(); // 시군구코드
		strURL += "&"+"keyword"+sightseeing.getKeyword(); // 키워드
		
		
	}
}	
