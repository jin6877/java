package com.myproject.web.picture_diary.daily;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
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

@Controller
public class FileUploadController {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	ServletContext sc;

	@RequestMapping(value = "/fileupload", method = RequestMethod.GET)
	public String fileuploadget(Model model) {
		logger.info("get방식 요청");
		model.addAttribute("menu", "fileupload");
		return "fileupload/index";
	}
	
	@RequestMapping(value = "/fileupload/ajax", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String fileuploadpostAjax(Model model, MultipartFile pfile, @RequestParam String title, @RequestParam(defaultValue = "") String beforefile) throws UnsupportedEncodingException {
		String resource_path = sc.getRealPath("/resources/fileupload/");
		
		System.out.println("테스트");
		String titleCh = new String(title.getBytes(), "UTF-8");
		System.out.println("titleCh"+titleCh);
		
		File desti = new File(resource_path+title);
		 
		// 디렉토리 생성
		if(desti.exists() == false) {
		    desti.mkdirs();
		}
		
		System.out.println("desti"+desti);
		File file = new File(desti, System.currentTimeMillis()+".jpg");
		System.out.println(file.getAbsolutePath());

//		if( !beforefile.equals("")) {
//			System.out.println("beforeFile = "+beforefile);
//			File before_file = new File(resource_path, beforefile);
//			if( file.exists() ){
//	            if(file.delete()){
//	                System.out.println("파일삭제 성공");
//	            }else{
//	                System.out.println("파일삭제 실패");
//	            }
//	        }else{
//	            System.out.println("파일이 존재하지 않습니다.");
//	        }
//
//			System.out.println("풀패스"+before_file.getAbsoluteFile());
//		}
		
		try {
			System.out.println(pfile);
			System.out.println(file);
			FileCopyUtils.copy(pfile.getBytes(), file);
			model.addAttribute("test", "true");
		} catch (Exception e) {
			e.printStackTrace();
		}
//		model.addAttribute("menu", "fileupload");
		
		
		String result =title+"/"+file.getName(); 
		URLEncoder.encode(result , "UTF-8");
//		System.out.println("result = "+result);
		
		
		return result;
	}
}
