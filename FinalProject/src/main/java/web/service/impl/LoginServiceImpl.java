package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.LoginDao;
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

}












