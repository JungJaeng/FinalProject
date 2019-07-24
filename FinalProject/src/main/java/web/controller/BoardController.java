package web.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Board_Image;
import web.dto.Comment;
import web.service.face.BoardService;
import web.util.Paging;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired ServletContext context;
	//서비스 객체
	@Autowired BoardService boardService;
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public void BoardList(
			@RequestParam(defaultValue="1")int curPage,String name,String search,Model model) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("curPage",curPage);
		map.put("name",name);
		map.put("search",search);
		
		logger.info(map.toString());
		
		Paging paging = boardService.getCurPage(map);
		model.addAttribute("paging",paging);
		
		List<Board> list = boardService.getList(paging);
		model.addAttribute("boardlist",list);
	}
	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
	public void View(
			@RequestParam int board_no,
			Model model) {
		
		boardService.hitview(board_no);
		Board viewboard = boardService.view(board_no);
		model.addAttribute("board",viewboard);
		
		List<Comment> list = boardService.commentView(board_no);
		model.addAttribute("commentlist",list);
	}
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public void WritePage(HttpSession session, Model model) {
		
		Board board = new Board();
		board.setWriter_id((String)session.getAttribute("loginid"));
		board.setWriter_nick((String)session.getAttribute("loginnick"));
		
		model.addAttribute("board", board);
	}
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String Write(Board board, Model model) {
		boardService.write(board);
		return "redirect:/board/list";
	}
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public void Updateview(@RequestParam int board_no, Model model) {
		Board board = boardService.view(board_no);
		
		model.addAttribute("board",board);
	}
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String Update(Board board, Model model) {
		logger.info(board.toString());
		boardService.update(board);
		return "redirect:/board/view?board_no="+board.getBoard_no();
	}
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String Delete(
			@RequestParam int board_no) {
		boardService.delete(board_no);
		
		return "redirect:/board/list";
	}
	@RequestMapping(value = "/board/comment/insert", method = RequestMethod.POST)
	public String CommenetInsert(Comment comment ,Model model) {
		
		boardService.commentInsert(comment);
		
		List<Comment> list = boardService.commentView(comment.getBoard_no());
		model.addAttribute("commentlist",list);
		return "board/comment";
	}
	@RequestMapping(value = "/board/comment/delete", method = RequestMethod.POST)
	public String DeleteInsert(Comment comment ,Model model) {
		
		boardService.commentDelete(comment);
		
		List<Comment> list = boardService.commentView(comment.getBoard_no());
		model.addAttribute("commentlist",list);
		
		return "board/comment";
	}
	@RequestMapping(value = "/board/imageupload", method = RequestMethod.POST)
	public @ResponseBody Board_Image Fileupload(
			Board_Image board_image,
	        @RequestParam(value="file") MultipartFile fileupload
		) {
		
		board_image = boardService.imgsave(board_image, fileupload, context);
		return board_image;
	}
	

}	
