package com.myproject.web.posts;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.web.member.MemberDTO;

@Controller
public class PostsController {
	private static final Logger logger = LoggerFactory.getLogger(PostsController.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/Posts/thirty")
	public String thirty_info(Model model, HttpSession session) {
		List<ThirtyDTO> al = sqlsession.selectList("thirty.thirtyselectAll");
		model.addAttribute("ThirtyList", al);
		return "posts/thirty";
	}
	
//	@RequestMapping(value = "/Posts/thirty/read")
//	public String thirty_read( Model model, HttpSession session) {
//		
//		List<ThirtyDTO> al = sqlsession.selectList("thirty.thirtyselectAll");
//
//		model.addAttribute("ThirtyList", al);
//		
//		return "posts/thirty";
//	}
//	
	@RequestMapping(value = "/Posts/write")
	public String write(Model model, HttpSession session) {

		return "posts/write";
	}
//	@RequestMapping(value = "/Posts/update")
//	public String update(Model model, HttpSession session) {
//
//		return "posts/update";
//	}
	
	@RequestMapping(value = "/Posts/read")
	public String read(@RequestParam("idx") int idx, Model model, HttpSession session) {
		ThirtyDTO dto = sqlsession.selectOne("thirty.thirtyselectText",idx);
		int temp = sqlsession.update("thirty.thirtycnt",dto);
		model.addAttribute("ThirtyDto", dto);
		return "posts/read";
	}
	
	@RequestMapping(value = "/Posts/update")
	public String update(@RequestParam("idx") int idx, Model model, HttpSession session) {
		ThirtyDTO dto = sqlsession.selectOne("thirty.thirtyselectText",idx);
		model.addAttribute("ThirtyTextDto", dto);
		return "posts/update";
	}
	
	@RequestMapping(value = "/Posts/delete")
	public String delete(@RequestParam("idx") int idx, Model model, HttpSession session) {
		ThirtyDTO dto = sqlsession.selectOne("thirty.thirtyselectText",idx);
		model.addAttribute("ThirtyTextDto", dto);
		int temp = sqlsession.delete("thirty.thirtydelete",dto);
		return "redirect:/Posts/thirty";
	}
	
	@RequestMapping(value = "/Posts/thirtyInsert")
	public String thirty_insert(Model model, HttpSession session,
				ThirtyDTO tdto	) {
		
		int temp = sqlsession.insert("thirty.thirtyinsert",tdto);
		
		 if( temp == 1 ) {
			session.setAttribute("db_md", tdto);
			List<ThirtyDTO> al = sqlsession.selectList("thirty.thirtyselectAll");
			model.addAttribute("ThirtyList", al);
			return "redirect:/Posts/thirty";
		}else {
			model.addAttribute("joininfo","피치못할사정에 insert실패했어요..");
			return "redirect:/Posts/write";
		}
		}


		@RequestMapping(value = "/Posts/thirtyUpdateProc")
		public String thirty_update(Model model, HttpSession session,
					ThirtyDTO udto	) {
			System.out.println(udto);
			int temp = sqlsession.insert("thirty.thirtyupdate",udto);
			 if( temp == 1 ) {
				session.setAttribute("db_ud", udto);
				List<ThirtyDTO> al = sqlsession.selectList("thirty.thirtyselectAll");
				model.addAttribute("ThirtyTextDto", al);
				return "redirect:/Posts/thirty";
			}else {
				model.addAttribute("joininfo","피치못할사정에 insert실패했어요..");
				return "redirect:posts/write";
			}
			}
}








