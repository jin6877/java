package com.myproject.web.member;

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
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService ms;
	
	@Autowired
	SqlSession sqlsession;
	
	
	@RequestMapping(value = "/member/logOut")
	public String loginOut(Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/member/login")
	public String login(Model model, HttpSession session) {

		return "member/login";
	}
	
	@RequestMapping(value = "/member/loginProc")
	public String successlogin(Model model, 
//					HttpServletRequest request,
//					String email,
//					String password,
//					String emailsave,
					MemberDTO param_md,
					HttpSession session) {
		
//		ms.doinsert();
		
//		logger.info("password = "+password);
//		logger.info("emailsave = "+emailsave);
//		logger.info("md = "+md);
		MemberDTO db_md 
			= (MemberDTO) sqlsession.selectOne("members.selectlogin", param_md);
		
		if( param_md != null && db_md !=null) {
			if( param_md.getEmail().equals( db_md.getEmail() ) ) {
				session.setAttribute("logininfo", db_md);
				return "redirect:/";
			}
		}else {
			model.addAttribute("log", "logfail"); 
			return "member/login";
		}
		
//		logger.info(md.toString());
/*		
 * 		파라메타 확인하기 위해서 출력		
 * 		String email1 = request.getParameter("email");
 *		logger.info("email = "+email);
 *		logger.info("email1 = "+email1);
 */	
		model.addAttribute("menu", "index");
		List<MemberDTO> al = sqlsession.selectList("members.selectAll");
		model.addAttribute("memberList", al);
		return "index";
	}
	
	
	
	@RequestMapping(value = "/member/emailcheck")
	@ResponseBody
	public String emailcheck(Model model, String email, HttpSession session) {
		String emailcheck = sqlsession.selectOne("members.emailcheck",email);
		if(emailcheck == null && email != null) {
			return "success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/member/join")
	public String join(Model model, HttpSession session) {
		return "member/join";
	}
	
	@RequestMapping(value = "/member/joinProc")
	public String joinProc(Model model, HttpSession session,
				MemberDTO mdto	) {
		
//		if(temp == null) {
		int temp = sqlsession.insert("members.insertmember",mdto);
//		if(mdto.getPw() == null && mdto.getEmail() == null && mdto.getName() == null) {
//			System.out.println("문제발생");
//			String joinError = "error";
//			return "join";
//		}
		 if( temp == 1 ) {
//			System.out.println("insert 성공");
			session.setAttribute("db_md", mdto);
			List<MemberDTO> al = sqlsession.selectList("members.selectAll");
			model.addAttribute("memberList", al);
			return "index";
		}else {
//			System.out.println("insert 실패");
			model.addAttribute("joininfo","피치못할사정에 insert실패했어요..");
			return "member/join";
		}
		}
//		}
	
	
	@RequestMapping(value = "/member/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	@RequestMapping(value = "/member")
	public String home(Locale locale, Model model) {
		List<MemberDTO> list = sqlsession.selectList("members.selectpage", new Page(1, 10));
		int pageCnt = sqlsession.selectOne("members.selectcount");
//		logger.info("pageCnt = "+pageCnt);
		
		model.addAttribute("memberListPage", list);
		model.addAttribute("memberListCount", pageCnt);
		model.addAttribute("menu", "member");

		return "member/index";
	}

	@RequestMapping(value = "/member/{page}")
	public String home(Locale locale, Model model, 
			@PathVariable(value = "page") int page) {
//		logger.info("page = " + page);
		
		int pageCount = 10;
		Page pageobj = new Page(1, 10);
		
		if(page ==1) {
			pageobj.setStartrow(1);
			pageobj.setEndrow(10);
		}
		else {
			pageobj.setStartrow( (page-1) * pageCount);
			pageobj.setEndrow( page * pageCount);
		}
		
		List<MemberDTO> list = sqlsession.selectList("members.selectpage", pageobj);
		int pageCnt = sqlsession.selectOne("members.selectcount");
//		logger.info("pageCnt = "+pageCnt);

		model.addAttribute("page", page);
		model.addAttribute("memberListPage", list);
		model.addAttribute("memberListCount", pageCnt);
		model.addAttribute("menu", "member");

		return "member/index";
	}

}








