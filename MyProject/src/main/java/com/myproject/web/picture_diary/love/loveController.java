package com.myproject.web.picture_diary.love;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.TrueFileFilter;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.web.member.MemberDTO;
import com.mysql.fabric.Response;

@Controller
public class loveController {
	private static final Logger logger = LoggerFactory.getLogger(loveController.class);
	
	@Autowired
	private ServletContext sc; 
	
	private String isDir;
	
	@Autowired
	SqlSession sqlsession;

	@RequestMapping(value = "/Picture_diary/love/love")
	public String love_life(Model model, HttpSession session) {
		List<LoveDTO> al = sqlsession.selectList("love.loveselectAll");
		model.addAttribute("loveList", al);
		
		
		return "Picture_diary/love/love";
	}

	@RequestMapping(value = "/Picture_diary/love/read")
	public String read(@RequestParam("idx") int idx, Model model, HttpSession session) {
		LoveDTO dto = sqlsession.selectOne("love.loveselectimg", idx);
		ArrayList<String> fileNames =new ArrayList<String>(); 
		
		isDir = sc.getRealPath("/resources/fileupload/"+dto.getTitle());
		
		for (File info : FileUtils.listFiles(new File(isDir), TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE)) {
			System.out.println(info.getName());
			fileNames.add(info.getName());
		}
		int temp = sqlsession.update("love.lovecnt",dto);
		model.addAttribute("loveDTO", dto);
		model.addAttribute("fileNames", fileNames);
		
		return "/Picture_diary/love/read";
	}

	@RequestMapping(value = "Picture_diary/love/write")
	public String write(Model model, HttpSession session) {
		
		return "Picture_diary/love/write";
	}

//	@RequestMapping(value = "Picture_diary/love/update")
//	public String update(@RequestParam("idx") int idx, Model model, HttpSession session) {
//		loveDTO dto = sqlsession.selectOne("love.loveselectText",idx);
//		model.addAttribute("loveTextDTO", dto);
//		ArrayList<String> fileNames =new ArrayList<String>(); 
//		isDir = sc.getRealPath("/resources/fileupload/"+dto.getTitle());
//		
//		for (File info : FileUtils.listFiles(new File(isDir), TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE)) {
//			System.out.println(info.getName());
//			fileNames.add(info.getName());
//		}
//		
//		model.addAttribute("loveDTO", dto);
//		model.addAttribute("fileNames", fileNames);
//		
//		return "Picture_diary/love/update";
//	}
//	
//	@RequestMapping(value = "/Posts/loveUpdateProc")
//	public String love_update(Model model, HttpSession session,
//			loveDTO udto	) {
//		System.out.println(udto);
//		int temp = sqlsession.insert("love.loveupdate",udto);
//		 if( temp == 1 ) {
//			session.setAttribute("db_ud", udto);
//			List<loveDTO> al = sqlsession.selectList("love.loveselectAll");
//			model.addAttribute("loveTextDto", al);
//			return "redirect:/Picture_diary/love/love_life";
//		}else {
//			model.addAttribute("joininfo","피치못할사정에 insert실패했어요..");
//			return "Picture_diary/love/update";
//		}
//		}
	
	@RequestMapping(value = "/Picture_diary/love/delete")
	public String delete(@RequestParam("idx") int idx, Model model, HttpSession session) {
		LoveDTO dto = sqlsession.selectOne("love.loveselectText",idx);
		model.addAttribute("loveTextDto", dto);
		int temp = sqlsession.delete("love.lovedelete",dto);
		return "redirect:/Picture_diary/love/love";
	}
	
	@RequestMapping(value = "/Picture_diary/love/love_lifeInsert", produces = "application/text; charset=utf8")

	public String love_insert(Model model, HttpSession session, LoveDTO tdto, HttpServletResponse response) {

		int temp = sqlsession.insert("love.loveinsert", tdto);
		response.setContentType("text/html; charset=utf-8");
		if (temp == 1) {
			session.setAttribute("db_md", tdto);
			List<LoveDTO> al = sqlsession.selectList("love.loveselectAll");
			model.addAttribute("loveList", al);
			return "redirect:/Picture_diary/love/love";
		} else {
			model.addAttribute("joininfo", "피치못할사정에 insert실패했어요..");
			return "redirect:Picture_diary/love/write";
		}
	}

}
