package com.real.fudousan.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.service.MemberService;

@RequestMapping("admin")
@Controller
public class AdminController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String adminpage(Model model) {
		logger.info("adminpage() Start");
		
		logger.info("adminpage() End");
		return "admin/adminPage";
	}
}
