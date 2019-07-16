package web.service.face;

import web.dto.Login;

public interface LoginService {

	/**
	 * 회원가입
	 * 
	 * @param login - 회원가입 정보
	 */
	public void join(Login login);

	/**
	 * 로그인 정보 처리 메소드
	 * 
	 * @param loginData - 존재하는 사용자인지 확인할 데이터
	 * @return boolean - 로그인 성공/실패
	 */
	public boolean login(Login loginData);
	
	/**
	 * 사용자 정보 조회 
	 * 
	 * @param login - 조회 대상 id를 가진 객체
	 * @return Login - 조회 결과
	 */
	public Login info(Login login);
	
}
