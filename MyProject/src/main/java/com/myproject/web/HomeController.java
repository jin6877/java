package com.myproject.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.web.picture_diary.daily.DailyDTO;
import com.myproject.web.picture_diary.love.LoveDTO;
import com.myproject.web.posts.ThirtyDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	SqlSession sqlsession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		List<LoveDTO> al1 = sqlsession.selectList("love.loveselectFive");
		List<DailyDTO> al2 = sqlsession.selectList("daily.dailyselectFive");
		List<ThirtyDTO> al3 = sqlsession.selectList("thirty.thirtyselectFive");
		model.addAttribute("loveList", al1);
		model.addAttribute("dailyList", al2);
		model.addAttribute("ThirtyList", al3);
		
		return "index";
	}
	
}
