package com.real.fudousan.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	 								
	@RequestMapping(value="insertMember",  method=RequestMethod.POST)
	public String insertMember(Model model, Member member,  List<MultipartFile> files){
			
		logger.info("회원 등록 시작");
		
		boolean memberResult = service.registerMember(member, files);
	
		if (memberResult) {
			// result가 true이면 
			logger.info("회원 등록 성공");
			model.addAttribute(memberResult);
			return "join/joinresult";
			
		}
		else{
			// result가 false이면 
			logger.info("회원 등록 실패");
			model.addAttribute(memberResult);
			return "join/join";
		}	
	}
	

}



