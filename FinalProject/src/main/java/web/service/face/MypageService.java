package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Filetest;
import web.dto.Member;
import web.dto.TripSpot;
import web.util.Paging;

public interface MypageService {

	public Member info(Member member);

	public void infoWithdraw(String id);

	public void update(Member member);

	public void filesave(MultipartFile file,ServletContext context,String userid );

	public Filetest selectImg(String loginid);

	public int ImgCnt(String loginid);

	public Paging getCurPage(Map<String,Object> map);
	
	public List<Board> getList(Map<String,Object> map);

	public List<TripSpot> getList2(Map<String, Object> map);

	public Paging getCurPage2(Map<String, Object> map);

//	public boolean checkpw(String user_id, String user_pw);

	
	
}
