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


import web.dto.TripSpot;
import web.dto.Upload_Image;
import web.service.face.TripspotService;
import web.util.Paging;

@Controller
public class TripspotController {
	private static final Logger logger = LoggerFactory.getLogger(TripspotController.class);
	@Autowired TripspotService tripspotService;
	@Autowired ServletContext context;
	@RequestMapping(value = "/tripspot/list", method = RequestMethod.GET)
	public void TripspotList(@RequestParam(defaultValue="1")int curPage,
			@RequestParam(name="region",defaultValue="")String name,
			@RequestParam(name="region_detail",defaultValue="")String search,
			Model model) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("curPage",curPage);
		map.put("name",name);
		map.put("search",search);
		
		logger.info(map.toString());
		Paging paging = tripspotService.getCurPage(map);
		model.addAttribute("paging",paging);
		List<TripSpot> list = tripspotService.getList(paging);
		model.addAttribute("tripspotlist",list);

	}@RequestMapping(value = "/tripspot/view", method = RequestMethod.GET)
	public void View(
			@RequestParam int board_no,
			Model model) {
		
		tripspotService.hitview(board_no);
		TripSpot viewtripspot = tripspotService.view(board_no);
		model.addAttribute("tripspot",viewtripspot);
		
//		List<Comment> list = boardService.commentView(board_no);
//		model.addAttribute("commentlist",list);
	}
	@RequestMapping(value = "/tripspot/write", method = RequestMethod.GET)
	public String WritePage(HttpSession session, Model model) {
		if((String)session.getAttribute("login_id") == null 
			&& (String)session.getAttribute("login_nick") == null) {
			return "redirect:/tripspot/list";
		}
		TripSpot tripspot = new TripSpot();
		tripspot.setWriter_id((String)session.getAttribute("loginid"));
		tripspot.setWriter_nick((String)session.getAttribute("loginnick"));
		model.addAttribute("tripspot", tripspot);
		return "tripspot/write";
	}
	@RequestMapping(value = "/tripspot/write", method = RequestMethod.POST)
	public String Write(TripSpot tripspot,String images) {
		
		tripspotService.write(tripspot,images);
		return "redirect:/tripspot/list";
	}
	@RequestMapping(value = "/tripspot/imageupload", method = RequestMethod.POST)
	public @ResponseBody Upload_Image Fileupload(
			Upload_Image tripspot_image,
	        @RequestParam(value="file") MultipartFile fileupload
		) {
		
		tripspot_image = tripspotService.imgsave(tripspot_image, fileupload, context);
		return tripspot_image;
	}
	@RequestMapping(value = "/tripspotimage", method = RequestMethod.GET)
	public void Imgload(Upload_Image tripspot_image, HttpServletResponse resp) {
		
		tripspot_image = tripspotService.FindImage(tripspot_image);
		
		File file = tripspotService.findFile(tripspot_image, context);
		resp.setContentLength((int) file.length());
		resp.setCharacterEncoding("utf-8");
		String filename = "";
	      
		try {
			filename = URLEncoder.encode(tripspot_image.getOrigin_name(), "utf-8");
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
	      
	      
		File origin = new File(context.getRealPath("WEB-INF/upload"), tripspot_image.getStored_name());
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
