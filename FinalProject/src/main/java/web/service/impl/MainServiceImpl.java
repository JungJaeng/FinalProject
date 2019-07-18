package web.service.impl;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import web.service.face.MainService;

@Service
public class MainServiceImpl implements MainService{
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	 
	private static String Request_URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?";
	private static String KEY = "serviceKey=oVpLLrYOZ3HgAbsrCL7WWVWeyhyK8sMPeScf3RiLkxYxnUSCCgj9rb8kRVW2MXInXYI3sSaZovOLHgmfur2rRg%3D%3D";
	
	public void result() {
	
	String strURL = null; //보낼 주소 URL
	strURL = Request_URL;
	strURL += KEY;
	strURL += "&numOfRows=12";
	strURL += "&pageNo=1";
	strURL += "&type=json";
	
	
	
	}
}	
