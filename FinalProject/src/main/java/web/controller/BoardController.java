package web.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Upload_Image;
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
	public String WritePage(HttpSession session, Model model) {
		
		if((String)session.getAttribute("login_id") == null 
			&& (String)session.getAttribute("login_nick") == null) {
			return "redirect:/board/list";
		}
		
		Board board = new Board();
		board.setWriter_id((String)session.getAttribute("loginid"));
		board.setWriter_nick((String)session.getAttribute("loginnick"));
		
		model.addAttribute("board", board);
		
		return "board/write";
	}
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String Write(Board board,String images) {
		
		boardService.write(board,images);
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
	public @ResponseBody Upload_Image Fileupload(
			Upload_Image board_image,
	        @RequestParam(value="file") MultipartFile fileupload
		) {
		
		board_image = boardService.imgsave(board_image, fileupload, context);
		return board_image;
	}
	@RequestMapping(value = "/boardimage", method = RequestMethod.GET)
	public void Imgload(Upload_Image board_image, HttpServletResponse resp) {
		
		board_image = boardService.FindImage(board_image);
		
		File file = boardService.findFile(board_image, context);
		resp.setContentLength((int) file.length());
		resp.setCharacterEncoding("utf-8");
		String filename = "";
	      
		try {
			filename = URLEncoder.encode(board_image.getOrigin_name(), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	      
		//UTF-8 인코딩 오류 수정 (한글만 바꿔야 하는데 특수기호까지 바꿔서 문제가 생기는것)
		filename = filename.replace("+", "%20"); //띄어쓰기
		filename = filename.replace("%5B", "["); 
		filename = filename.replace("%5D", "]");
		filename = filename.replace("%21", "!"); 
		filename = filename.replace("%23", "#"); 
		filename = filename.replace("%24", "$"); 
	      
	      
		File origin = new File(context.getRealPath("WEB-INF/upload"), board_image.getStored_name());
		FileInputStream fis = null;
	      
		try {
			fis = new FileInputStream(origin);
			OutputStream out = resp.getOutputStream();
	   
			FileCopyUtils.copy(fis, out);
	         
			out.flush();
			fis.close();
			out.close();
	         
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		
	}
	

}	
