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

import web.dto.Pension;
import web.dto.PensionRegisterApply;
import web.dto.Upload_Image;
import web.service.face.PensionService;
import web.util.Paging;

@Controller
public class PensionController {
	
	@Autowired PensionService pensionService;
	@Autowired ServletContext context;
	// �α� ���̺귯�� ��ü
	private static final Logger logger = LoggerFactory.getLogger(PensionController.class);
	
	// ��� ���
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
	
//	@RequestMapping(value="/pension/room_view"
//			, method=RequestMethod.GET)
//	public String view( Pension viewPension
//			, Model model
//			, HttpSession session) {
//		
//		// �Խñ� ��ȣ�� 1���� ������ ������� ������
//		if(viewPension.getPension_no() < 1) {
//			return "redirect:/pension/list";
//		}
//		
//		// ��� �� ���� ����
//		viewPension = pensionService.pensionView(viewPension);
//		model.addAttribute("view", viewPension);
//		
//		// ��� ����
//		Comment comment = new Comment();
//		List<Comment> commentList = pensionService.getCommentList(viewPension);
//		model.addAttribute("commentList", commentList);
//		
//		return "pension/room_view";
//	}	
	
	// ��ǵ�Ͽ�û �۾���
	@RequestMapping(value="/pension/register_apply"
			, method=RequestMethod.GET)
	public void write() { }

	@RequestMapping(value="/pension/register_apply"
			, method=RequestMethod.POST)
	public String writeProcess(PensionRegisterApply pensionRegisterApply,
			HttpSession session) {
				
		
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
	         
	      //UTF-8 ���ڵ� ���� ���� (�ѱ۸� �ٲ�� �ϴµ� Ư����ȣ���� �ٲ㼭 ������ ����°�)
	      filename = filename.replace("+", "%20"); //����
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
	
	
	
}	
	
















