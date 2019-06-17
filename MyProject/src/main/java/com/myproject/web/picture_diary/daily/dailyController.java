package com.myproject.web.picture_diary.daily;

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
public class dailyController {
	private static final Logger logger = LoggerFactory.getLogger(dailyController.class);
	
	@Autowired
	private ServletContext sc; 
	
	private String isDir;
	
	@Autowired
	SqlSession sqlsession;

	@RequestMapping(value = "/Picture_diary/daily/daily_life")
	public String daily_life(Model model, HttpSession session) {
		List<DailyDTO> al = sqlsession.selectList("daily.dailyselectAll");
		model.addAttribute("dailyList", al);
		
		
		return "Picture_diary/daily/daily_life";
	}

	@RequestMapping(value = "/Picture_diary/daily/read")
	public String read(@RequestParam("idx") int idx, Model model, HttpSession session) {
		DailyDTO dto = sqlsession.selectOne("daily.dailyselectimg", idx);
		System.out.println(dto);
		ArrayList<String> fileNames =new ArrayList<String>(); 
		
		isDir = sc.getRealPath("/resources/fileupload/"+dto.getTitle());
		
		for (File info : FileUtils.listFiles(new File(isDir), TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE)) {
			System.out.println(info.getName());
			fileNames.add(info.getName());
		}
		
		int temp = sqlsession.update("daily.dailycnt",dto);
		model.addAttribute("DailyDTO", dto);
		model.addAttribute("fileNames", fileNames);
		
		return "/Picture_diary/daily/read";
	}

	@RequestMapping(value = "Picture_diary/daily/write")
	public String write(Model model, HttpSession session) {
		
		return "Picture_diary/daily/write";
	}

//	@RequestMapping(value = "Picture_diary/daily/update")
//	public String update(@RequestParam("idx") int idx, Model model, HttpSession session) {
//		DailyDTO dto = sqlsession.selectOne("daily.dailyselectText",idx);
//		model.addAttribute("DailyTextDTO", dto);
//		ArrayList<String> fileNames =new ArrayList<String>(); 
//		isDir = sc.getRealPath("/resources/fileupload/"+dto.getTitle());
//		
//		for (File info : FileUtils.listFiles(new File(isDir), TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE)) {
//			System.out.println(info.getName());
//			fileNames.add(info.getName());
//		}
//		
//		model.addAttribute("DailyDTO", dto);
//		model.addAttribute("fileNames", fileNames);
//		
//		return "Picture_diary/daily/update";
//	}
//	
//	@RequestMapping(value = "/Posts/dailyUpdateProc")
//	public String daily_update(Model model, HttpSession session,
//			DailyDTO udto	) {
//		System.out.println(udto);
//		int temp = sqlsession.insert("Daily.Dailyupdate",udto);
//		 if( temp == 1 ) {
//			session.setAttribute("db_ud", udto);
//			List<DailyDTO> al = sqlsession.selectList("Daily.DailyselectAll");
//			model.addAttribute("DailyTextDto", al);
//			return "redirect:/Picture_diary/daily/daily_life";
//		}else {
//			model.addAttribute("joininfo","피치못할사정에 insert실패했어요..");
//			return "Picture_diary/daily/update";
//		}
//		}
	
	@RequestMapping(value = "/Picture_diary/daily/delete")
	public String delete(@RequestParam("idx") int idx, Model model, HttpSession session) {
		DailyDTO dto = sqlsession.selectOne("daily.dailyselectText",idx);
		model.addAttribute("DailyTextDto", dto);
		int temp = sqlsession.delete("daily.dailydelete",dto);
		return "redirect:/Picture_diary/daily/daily_life";
	}
	
	@RequestMapping(value = "/Picture_diary/daily/daily_lifeInsert", produces = "application/text; charset=utf8")

	public String daily_insert(Model model, HttpSession session, DailyDTO tdto, HttpServletResponse response) {

		int temp = sqlsession.insert("daily.dailyinsert", tdto);
		response.setContentType("text/html; charset=utf-8");
		if (temp == 1) {
			session.setAttribute("db_md", tdto);
			List<DailyDTO> al = sqlsession.selectList("daily.dailyselectAll");
			model.addAttribute("dailyList", al);
			return "redirect:/Picture_diary/daily/daily_life";
		} else {
			model.addAttribute("joininfo", "피치못할사정에 insert실패했어요..");
			return "redirect:Picture_diary/daily/write";
		}
	}

}
