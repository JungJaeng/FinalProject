package web.service.impl;

import java.util.List;
import java.util.Map;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BoardDao;
import web.dto.Board;
import web.dto.Comment;
import web.service.face.BoardService;
import web.util.Paging;



@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Autowired BoardDao boardDao;

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
		
	}

	@Override
	public List<Comment> commentView(int board_no) {
		return boardDao.selectCommentByboard_no(board_no);
	}

	@Override
	public void commentInsert(Comment comment) {
		
		boardDao.insertComment(comment);
		
		
	}
}
