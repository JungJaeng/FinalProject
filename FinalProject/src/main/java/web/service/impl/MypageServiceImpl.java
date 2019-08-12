package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MypageDao;
import web.dto.Board;
import web.dto.Filetest;
import web.dto.Member;
import web.dto.TripSpot;
import web.service.face.MypageService;
import web.util.Paging;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired MypageDao mypageDao;
	
	@Override
	public Member info(Member member) {
		return mypageDao.selectLoginById(member);
	}

	@Override
	public void infoWithdraw(String id) {
		
		mypageDao.infoWithdrawDao(id);
	}

	@Override
	public void update(Member member) {

		mypageDao.updateDao(member);
	}

	

	@Override
	public void filesave(MultipartFile file, ServletContext context,String userid) {
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("WEB-INF/upload");

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
		
		if( mypageDao.selectImgCnt(userid) > 0 ) {
			
			mypageDao.Imgdelete(userid);			
		}
		
		mypageDao.insertFile(filetest);
	}

	@Override
	public Filetest selectImg(String loginid) {
		return mypageDao.selectImgDao(loginid);
		
	}

	@Override
	public int ImgCnt(String loginid) {
		
		
		
		return mypageDao.selectImgCnt(loginid);

	}

	@Override
	public Paging getCurPage(Map<String,Object> map) {
		

		int totalCount = mypageDao.selectCntAll2(map.get("writer_id").toString());
		int curPage = Integer.parseInt(map.get("curPage").toString());
		
		Paging paging = new Paging(totalCount,curPage);
		

		
		return paging;
	}

	@Override
	public List<Board> getList(Map<String,Object> map) {
		return mypageDao.selectAll2(map);
	}

	public Paging getCurPage2(Map<String, Object> map) {
		int totalCount = mypageDao.selectCntAll3(map.get("writer_id").toString());
		int curPage = Integer.parseInt(map.get("curPage").toString());
		Paging paging = new Paging(totalCount,curPage);
		
		
		return paging;
	}

	
	
	@Override
	public List<TripSpot> getList2(Map<String, Object> map) {
		
		return mypageDao.selectAll3(map);
	}

//	@Override
//	public boolean checkpw(String user_id, String user_pw) {
//		boolean result = false;
//		Map<String,String> map = new HashMap<String,String>();
//		map.put("userId", user_id);
//		map.put("userPw", user_pw);
//		int count = sqlSession.selectOne("member.checkPw",map);
//		if(count==1) result=true;
//		
//		return mypageDao.checkpw(user_id,user_pw);
	}


	

