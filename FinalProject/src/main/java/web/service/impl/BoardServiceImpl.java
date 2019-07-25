package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import web.dao.face.BoardDao;
import web.dto.Board;
import web.dto.Upload_Image;
import web.dto.Comment;
import web.service.face.BoardService;
import web.util.Paging;



@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Autowired BoardDao boardDao;
	@Autowired ServletContext context;
	@Override
	public Paging getCurPage(Map<String, Object> map) {

		int totalCount = boardDao.selectCntAll(map);
		int curPage = Integer.parseInt(map.get("curPage").toString());
		
		Paging paging = new Paging(totalCount,curPage);
		
		paging.setName((String)map.get("name"));
		paging.setSearch((String)map.get("search"));
		
		return paging;
	}

	@Override
	public List<Board> getList(Paging paging) {
		return boardDao.selectAll(paging);
	}

	@Override
	public Board view(int board_no) {
		
		return boardDao.selectBoardByboard_no(board_no);
	}

	@Override
	public void hitview(int board_no) {
		boardDao.updateHit(board_no);
	}

	@Override
	public void write(Board board) {
		boardDao.insert(board);
		
	}
	@Override
	public void update(Board board) {
		boardDao.update(board);
	}

	@Override
	public void delete(int board_no) {
		boardDao.deleteBoardByboard_no(board_no);
		boardDao.deleteCommentByboard_no(board_no);
		
		List<Upload_Image> list = boardDao.selectBoard_ImageByboard_no(board_no);
		
		for(Upload_Image i : list) {
			String fileName = i.getStored_name();
			String fileDir = context.getRealPath("WEB-INF/upload");
			File file = new File(fileDir,fileName);
			logger.info("-------------------------------------");
			logger.info(fileDir);
			logger.info(""+file.exists());
			if(file.exists()) {file.delete();}
		};
		
		
		boardDao.deleteBoard_ImageByboard_no(board_no);
		
		
	} 

	@Override
	public List<Comment> commentView(int board_no) {
		return boardDao.selectCommentByboard_no(board_no);
	}

	@Override
	public void commentInsert(Comment comment) {
		if(comment.getCommentno() != 0){
			comment.setRef_commentno(comment.getCommentno());
			comment.setDept(comment.getDept()+1);
			boardDao.insertComment(comment);
		}else {
			boardDao.insertComment(comment);
		}
		
	}

	@Override
	public void commentDelete(Comment comment) {
		boardDao.deleteComment(comment);
		
	}

	@Override
	public Upload_Image imgsave(Upload_Image board_image, MultipartFile file, ServletContext context) {
		String storedPath = context.getRealPath("WEB-INF/upload");
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일의 이름(원본이름+UUID)
		String name=file.getOriginalFilename()+"_"+uId;
		
		
		//저장될 파일 객체
		File dest = new File(storedPath,name);
		
		//파일 저장
		try {
			file.transferTo(dest); //실제 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Upload_Image upimage = new Upload_Image();
		if(board_image.getBoard_no() == 0) {
			upimage.setBoard_no(boardDao.getBoard_no());
		}else {
			upimage.setBoard_no(board_image.getBoard_no());
		}
		upimage.setOrigin_name(file.getOriginalFilename());
		upimage.setStored_name(name);
		upimage.setFilesize((int)file.getSize());
		
		
		boardDao.insertImage(upimage);
		logger.info(upimage.toString());
		return upimage;
	}

	@Override
	public Upload_Image FindImage(Upload_Image board_image) {
		
		return boardDao.selectImgbyfileno(board_image);
	}

	@Override
	public File findFile(Upload_Image board_image,ServletContext context) {
		File file = new File(
				context.getRealPath("WEB-INF/upload"),board_image.getStored_name());
		return file;
	}
}
