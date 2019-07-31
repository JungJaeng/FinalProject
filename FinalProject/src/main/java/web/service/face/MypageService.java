package web.service.face;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Filetest;
import web.dto.Member;

public interface MypageService {

	public Member info(Member member);

	public void infoWithdraw(String id);

	public void update(Member member);

	public void filesave(MultipartFile file,ServletContext context,String userid );

	public Filetest selectImg(String loginid);

	public int ImgCnt(String loginid);

	public void SelectAll2(String loginid); 
}
