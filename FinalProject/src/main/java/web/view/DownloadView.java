package web.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import web.dto.Filetest;

public class DownloadView extends AbstractView{

	private static final Logger logger
	= LoggerFactory.getLogger(DownloadView.class);
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//모델값 가져오기 - FileTest 객체 (downFile)
		Filetest file = (Filetest) model.get("downFile");
		
//		System.out.println(file);
		
		//서블릿컨텍스트 얻기
		ServletContext context = request.getSession().getServletContext();
		
		//업로드된 파일 객체 얻기
		File src= new File(context.getRealPath("upload"),file.getStored_name());
		
		System.out.println(src.exists());
		
		//ContentType 설정
		// 응답데이터 형식으로 이진데이터를 설정함
		// 브라우저는 마땅한 형식이 없는 데이터라고 생각하고
		// 파일을 다운받아서 처리함
		response.setContentType("application/octet-stream");
		
		//응답 데이터(파일)의 크기 설정
		response.setContentLength((int)src.length());
		
		response.setCharacterEncoding("utf-8");
		
		//클라이언트가 저장할 때 사용할 파일 이름의 인코딩 설정
		String filename =URLEncoder.encode(file.getOrigin_name(),"utf-8");
//		System.out.println(filename);
		
		//UTF-8 인코딩 오류 수정
		filename = filename.replace("+", "%20"); // 띄어쓰기
		
		filename = filename.replace("%5B", "[");
		filename = filename.replace("%5D", "]");
		
		filename = filename.replace("%21", "!");
		filename = filename.replace("%23", "#");
		filename = filename.replace("%24", "$");
//		System.out.println(filename);
		
		//브라우저가 다운로드에 사용하는 이름 설정하기
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		
		// 서버의 File - > FileInputStream으로 읽기
		// -> Response의 OutputStream으로 출력
		
		// 서버에 저장된 파일 객체
		File origin = new File(
				context.getRealPath("upload"),
				file.getStored_name());
		
		// 서버의 파일 입력스트림
		FileInputStream fis = new FileInputStream(origin);
		
		//서버의 응답 출력 스트림
		OutputStream out = response.getOutputStream();
		
		// 서버 - > 클라이언트 복사
		FileCopyUtils.copy(fis, out);
		
		//출력스트림 버퍼 비우기
		out.flush();
		
		//스트림 닫기
		fis.close();
		out.close();
	}
	

}
