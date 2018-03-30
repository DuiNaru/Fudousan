package com.real.fudousan.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.service.MemberService;
import com.real.fudousan.member.vo.Member;

@Controller
@RequestMapping(value="join")
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService service;
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(){
		logger.info("join Form 이동 시작");
		
		logger.info("join Form 이동  종료");
		return "join/join";
	}
	
	@RequestMapping(value="agencyjoin", method=RequestMethod.GET)
	public String AgencyJoin(){
		logger.info("Agency join Form 이동 시작");
		logger.info("Agency join Form 이동 종료");
		return "join/agencyjoin";
	}
	
	@RequestMapping(value="insertMember", method=RequestMethod.POST)
	public String insertMember(
			@ModelAttribute("member") Member member
			,Model model){
			
		logger.info("insertMember 시작");
		
	
		
		logger.info("insertMember 종료");
		
		return "";
		
		
	}
	

}



