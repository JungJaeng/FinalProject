package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Board;
import web.dto.Comment;
import web.util.Paging;

public interface BoardDao {

	
	/**
	 * 전체 게시글 수 조회(검색어가 있으면 검색)
	 * @param map ( int curPage, String name, String search )
	 * @return int totalCount
	 */
	public int selectCntAll(Map<String, Object> map);
	
	/**
	 * 해당 테이블을 전체 조회(검색어가 있으면 검색)하여 리스트를 리턴한다
	 * @param paging
	 * @return List<Board>
	 */
	public List<Board> selectAll(Paging paging);

	/**
	 * board_no를 입력받아 board테이블을 검색한 행을 리턴한다
	 * @param board_no
	 * @return Board
	 */
	public Board selectBoardByboard_no(int board_no);

	/**
	 * board_no를 입력받아 해당 행의 조회수(hit)을 하나 올린다
	 * @param board_no
	 */
	public void updateHit(int board_no);

	public void insert(Board board);

	public void update(Board board);

	public void deleteBoardByboard_no(int board_no);

	public List<Comment> selectCommentByboard_no(int board_no);

	public int selectref_commentno(Comment comment);

	public void insertComment(Comment comment);
	
}
