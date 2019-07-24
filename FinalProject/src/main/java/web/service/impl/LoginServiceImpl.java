package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.LoginDao;
import web.dto.Filetest;
import web.dto.Login;
import web.service.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired LoginDao loginDao;
	
	@Override
	public void join(Login login) {
		loginDao.insertLogin(login);
	}

	@Override
	public boolean login(Login loginData) {
		
		//로그인 정보를 Count한 결과가 0보다 크면 로그인 성공
		if( loginDao.selectCntLogin(loginData) > 0 ) {
			return true;
		}
		
		return false;
	}

	@Override
	public Login info(Login login) {
		return loginDao.selectLoginById(login);
	}

	@Override
	public void infoWithdraw(String id) {
		
		loginDao.infoWithdrawDao(id);
	}

	@Override
	public void update(Login login) {

		loginDao.updateDao(login);
	}

	

	@Override
	public void filesave(MultipartFile file, ServletContext context,String userid) {
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");

		//UUID
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일의 이름 (원본이름 + UUID)
		String name = file.getOriginalFilename()+"_"+uId;
		
		//저장될 파일 객체
		File dest = new File(storedPath,name);
		
		//파일 저장
		try {
			file.transferTo(dest); // 실제 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//DB에 저장 (업로드 정보 기록)
		Filetest filetest = new Filetest();
		filetest.setOrigin_name(file.getOriginalFilename());
		filetest.setStored_name(name);
		filetest.setUserid(userid);
		
		if( loginDao.selectImgCnt(userid) > 0 ) {
			
			loginDao.Imgdelete(userid);			
		}
		
		loginDao.insertFile(filetest);
	}

	@Override
	public Filetest selectImg(String loginid) {
		return loginDao.selectImgDao(loginid);
		
	}

	@Override
	public int ImgCnt(String loginid) {
		
		
		
		return loginDao.selectImgCnt(loginid);

	}


}












