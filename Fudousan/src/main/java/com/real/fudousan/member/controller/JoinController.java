package com.real.fudousan.member.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.member.service.MemberService;
import com.real.fudousan.member.vo.Member;

@Controller
@RequestMapping(value="join")
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
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
	public String insertMember(Model model, Member member,  MultipartFile file){
		boolean memberResult= false;	
		
		logger.info("회원 등록 시작");
		int designer = member.getDesigner();
		
		if (designer == 0) {
			
			memberResult = service.registerMember(member, file);
			
		} else if(designer == 1) {
			
			memberResult = service.registerInterior(member, file);
		}
		if (memberResult) {
			// result가 true이면 
			logger.info("회원 등록 성공");
			model.addAttribute(memberResult);
			return "redirect:join/joinresult";
			
		}
		else{
			// result가 false이면 
			logger.info("회원 등록 실패");
			model.addAttribute(memberResult);
			return "redirect:join/join";
		}	
	}
<<<<<<< HEAD
	
	
=======
>>>>>>> d0dda8b83f13005edff4f2996091239237249745

	@RequestMapping(value="insertAgency",  method=RequestMethod.POST)
	public String insertAgency(Model model, Member member,  MultipartFile file, Agency agency, String main){
			
		logger.info("회원 등록 시작");
		agency.setAddressMain(main);
		logger.info("member 등록 시작");
		boolean memberResult = service.registerAgencyMember(member, file);
		logger.info("member 등록 종료");
		logger.info("agency 등록 시작");
		agency.setMember(member);
		System.out.println(member);
		boolean AgencyResult = service.registerAgency(agency);
		logger.info("agency 등록 종료");
		System.out.println(agency);

		if (memberResult && AgencyResult) {
			// result가 true이면 
			logger.info("회원 등록 성공");
			model.addAttribute(memberResult);
			return "join/agencyjoinresult";
			
		}
		else{
			// result가 false이면 
			logger.info("회원 등록 실패");
			model.addAttribute(memberResult);
			return "redirect:join/agencyjoin";
		}	
	}
	
	

}



