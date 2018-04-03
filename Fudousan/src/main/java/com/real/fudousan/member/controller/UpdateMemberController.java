package com.real.fudousan.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.real.fudousan.member.service.MemberService;
import com.real.fudousan.member.vo.Member;

@Controller
@RequestMapping(value="memberupdate")
public class UpdateMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(UpdateMemberController.class);
	
	@Autowired
	private MemberService service;

	@RequestMapping(value="memberupdate", method=RequestMethod.GET)
	public String memberupdate(){
		
		
		return "memberupdate/memberupdate";
	}
	
	@RequestMapping(value="agencyupdate", method=RequestMethod.GET)
	public String agencyupdate(){
		
		
		return "memberupdate/agencyupdate";
	}
	
	@RequestMapping(value="modifyMember", method=RequestMethod.POST)
	public String modifyMember(
			@ModelAttribute("member") Member member
			, MultipartFile file
			, Model model
			, HttpSession session){

			logger.info("회원 수정 시작");
			
			System.out.println(member);
			boolean result = service.modifyMember(member, file);
			
			Member resultMember=service.login(member);
			if (result == false) {
				
			}else{
				model.addAttribute("errorMsg", "수정 실패");
				logger.info("회원 수정 실패");
				return "memberupdate/memberupdate";
			}
			
			session.setAttribute("memberName", resultMember.getMemberName());
			logger.info("회원 수정 종료");
			
			return "redirect:memberupdate/updateResult";
	}
	
	@RequestMapping(value="updateResult", method=RequestMethod.GET)
	public String updateResult(
			SessionStatus session
			,Model model 
			,@ModelAttribute("member")Member member){
		
		logger.info("회원 정보 수정 완료 폼 이동 시작");
		model.addAttribute("memberName", member.getMemberName());
		session.setComplete();
		
		logger.info("회원 정보 수정 완료 폼 이동 종료");
		
		return "memberupdate/updateResult";
		
	}
	
	
}
