package web.dao.face;

import web.dto.Login;

public interface LoginDao {

	/**
	 * 회원정보 삽입
	 * 
	 * @param login - 회원가입 정보
	 */
	public void insertLogin(Login login);
	
	/**
	 * 로그인 데이터와 일치하는 행 수를 조회한다
	 * 
	 * @param login - id, pw를 가지는 객체
	 * @return int - 조회된 행 수
	 */
	public int selectCntLogin(Login login);
	
	/**
	 * id를 이용하여 회원의 상세정보를 조회한다
	 * 
	 * @param login - 조회 대상의 id를 가진 객체
	 * @return Login - 조회 결과
	 */
	public Login selectLoginById(Login login);
}
