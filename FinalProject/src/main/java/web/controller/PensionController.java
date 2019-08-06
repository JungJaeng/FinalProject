package web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
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

import web.dto.Member;
import web.dto.Pension;
import web.dto.PensionComment;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.service.face.PensionService;
import web.util.Paging;

@Controller
public class PensionController {
	
	@Autowired PensionService pensionService;
	@Autowired ServletContext context;
	// ���멸��� ���������깅��у������ ������泥�
	private static final Logger logger = LoggerFactory.getLogger(PensionController.class);
	
	// ��������占� ��������占�
	@RequestMapping(value = "/pension/list", method = RequestMethod.GET)
	public void MemberList(@RequestParam(defaultValue = "1") int curPage, String name, String search, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage);
		map.put("name", name);
		map.put("search", search);

		logger.info(map.toString());

		Paging paging = pensionService.getCurPage(map);
		model.addAttribute("paging", paging);

		List<Pension> list = pensionService.getList(paging);
		model.addAttribute("pensionlist", list);
	}
	
	
	// ������ ������������
	@RequestMapping(value="/pension/room_view", method=RequestMethod.GET)
	public String View(
		@RequestParam int pension_no,
		Model model,
		HttpSession session) {
				
		Pension viewPension = pensionService.pensionView(pension_no);
		model.addAttribute("pension",viewPension);
		
		Pension check = new Pension();
		check.setWriter_id((String)session.getAttribute("login_id"));
		check.setWriter_nick((String)session.getAttribute("login_nick"));
		
		// 占쏙옙疫뀐옙 占쏙옙癰�占�
		PensionComment comment = new PensionComment();
		List<PensionComment> commentList = pensionService.getCommentList(viewPension);
		model.addAttribute("commentList", commentList);
				
		return "pension/room_view";
				
		
	}
	
	@RequestMapping(value = "/pension/insertComment", method = RequestMethod.POST)
	public String CommenetInsert(PensionComment pensionComment,
			Model model) {
		
		pensionService.insertComment(pensionComment);
		
		return "redirect:/pension/room_view?pension_no="
		+pensionComment.getPensionNo();
	}
	
	@RequestMapping(value = "/pension/deleteComment", method = RequestMethod.POST)
	public void DeleteComment(PensionComment pensionComment,
			Writer out) {
		
		boolean success = pensionService.deleteComment(pensionComment);;
		
		try {
			out.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/pension/delete", method=RequestMethod.GET)
	public String Delete(Pension pension, Model model) {
		pensionService.delete(pension);
			
		return "redirect:/pension/list";
	}
	
	// �������⒴���뱀�몄��泥� �����듭��������
	@RequestMapping(value="/pension/register_apply"
			, method=RequestMethod.GET)
	public void write() { }

	@RequestMapping(value="/pension/register_apply"
			, method=RequestMethod.POST)
	public String writeProcess(PensionRegisterApply pensionRegisterApply,
			HttpSession session,
			Member member) {
				
		// �����쎌�������� ���������깅�몄�� ���⑷낀��
		pensionRegisterApply.setWriter_id((String)session.getAttribute("login_id"));
		
		
		pensionService.write(pensionRegisterApply);
		
		return "redirect:/pension/list";
	}	
	
	@RequestMapping(value = "/pension/image_upload", method = RequestMethod.POST)
	   public @ResponseBody Upload_Image Fileupload(
	         Upload_Image board_image,
	           @RequestParam(value="file") MultipartFile fileupload
	      ) {
	      
	      board_image = pensionService.imgsave(board_image, fileupload, context);
	      return board_image;
	   }
	
	@RequestMapping(value = "/pensionimage", method = RequestMethod.GET)
	   public void Imgload(Upload_Image pension_image, HttpServletResponse resp) {
	      
	      pension_image = pensionService.FindImage(pension_image);
	      
	      File file = pensionService.findFile(pension_image, context);
	      resp.setContentLength((int) file.length());
	      resp.setCharacterEncoding("utf-8");
	      String filename = "";
	         
	      try {
	         filename = URLEncoder.encode(pension_image.getOrigin_name(), "utf-8");
	      } catch (UnsupportedEncodingException e1) {
	         e1.printStackTrace();
	      }
	         
	      //UTF-8 �����������몄�� ������������ ������������ (���쇨�紐��� ����������占� ���밸���몄�� �밧�������������멨������������ ����轅��� ������������������ ������������吏멨��占�)
	      filename = filename.replace("+", "%20"); //�������듬������占�
	      filename = filename.replace("%5B", "["); 
	      filename = filename.replace("%5D", "]");
	      filename = filename.replace("%21", "!"); 
	      filename = filename.replace("%23", "#"); 
	      filename = filename.replace("%24", "$"); 
	         
	         
	      File origin = new File(context.getRealPath("WEB-INF/upload"), pension_image.getStored_name());
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
	
	
	@RequestMapping(value="/pension/reserve", method=RequestMethod.GET)
	public String Reservation(
		Pension viewReserve,
		Model model,
		HttpSession session) {
				
		viewReserve = pensionService.reserveView(viewReserve);
		model.addAttribute("view",viewReserve);
		
		Pension check = new Pension();
		check.setWriter_id((String)session.getAttribute("login_id"));
		check.setWriter_nick((String)session.getAttribute("login_nick"));
				
		return "pension/reserve";
	}
	
	@RequestMapping(value="/pension/reserve", method=RequestMethod.POST)
	public String Reservation_proc(
		Pension viewPension,
		HttpSession session) {		
		return "redirect:/pension/reserveCheck";
	}
	
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String Reservation(
		Model model,
		HttpSession session) {
		
		return "pension/reserve";
	}
	
	@RequestMapping(value="/pension/reserveCheck", method=RequestMethod.GET)
	public void ReserveCheck() {
		
	}
	
	
	@RequestMapping(value="/pension/reserveFail", method=RequestMethod.GET)
	public void ReserveFail() {
		
	}
	

}