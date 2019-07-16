package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import web.dto.Board;
import web.dto.Comment;
import web.util.Paging;

public interface BoardService {
	
	/**
	 * 현재 페이지(없으면 1페이지), 검색어, 문장을 입력받아 페이징 처리 한다
	 * @param map ( int curPage, String name, String search )
	 * @return Paging
	 */
	public Paging getCurPage(Map<String,Object> map);
	
	/**
	 *  페이징 된 값을 입력해 (검색어,문장 있으면 검색도 같이 함) 리스트를 받아온다
	 * @param paging 
	 * @return List<Board>
	 */
	public List<Board> getList(Paging paging);
	
	/**
	 * board_no를 입력받아 해당 board_no에 해당하는 행 하나를 받아온다 
	 * @param board_no
	 * @return Board
	 */
	public Board view(int board_no);

	/**
	 * board_no를 입력받아 해당 행의 조회수(hit)을 하나 올린다
	 * @param board_no
	 */
	public void hitview(int board_no);

	
	public void write(Board board);

	public void update(Board board);

	public void delete(int board_no);

	public List<Comment> commentView(int board_no);

	public void commentInsert(Comment comment);

	
}
