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

import com.real.fudousan.agency.vo.Agency;
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

			logger.info("회원 수정 시작(member)");
			System.out.println(member);
			boolean result = service.modifyMember(member, file);
			
			if (result == false) {
				
				model.addAttribute("errorMsg", "수정 실패");
				logger.info("회원 수정 실패");
				return "memberupdate/memberupdate";
				
			}
			else{
				// get member name 
				String resultMemberName = member.getMemberName();
							
				session.setAttribute("memberName", resultMemberName);
				logger.info("회원 수정 종료");
				
				return "redirect:updateResult";
			}
	}
	
	@RequestMapping(value="modifyAgency", method=RequestMethod.POST)
	public String updateAgency(
			@ModelAttribute("member") Member member
			, Agency agency
			, MultipartFile file
			, Model model
			, HttpSession session
			, String main 
			){
		
		logger.info("회원 수정 시작(agency)");
		// get login Id
		String loginEmail=(String)session.getAttribute("loginEmail");
		//search member
		Member searchMember = new Member();
		searchMember.setEmail(loginEmail);
		// search login member
		Member loginMember = service.login(searchMember);
		
		// member to set login member_id
		member.setMemberId(loginMember.getMemberId());
		System.out.println(member);
		// start member update
		// set address member 
		agency.setAddressMain(main);
		// set email address to member
		member.setEmail(loginEmail);
		logger.info("member 등록 시작");
		boolean memberUpdateResult = service.modifyAgencyMember(member, file);
		logger.info("member 등록 종료");
		
		// start agency update
		logger.info("agency 등록 시작");
		// set member 
		agency.setMember(member);
				
		boolean agencyUpdateResult = service.modifyAgency(agency);
		logger.info("agency 등록 종료 ");
		
		if (agencyUpdateResult && memberUpdateResult) {
			// true 
			logger.info("회원 등록 성공");
			model.addAttribute(memberUpdateResult);
			return "redirect:/memberupdate/agencyupdateresult";
		}
		else{
			logger.info("회원 등록 실패");
			model.addAttribute(memberUpdateResult);
			return "redirect:/memberupdate/agencyupdate";
		}
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
	
	@RequestMapping(value="agencyupdateresult", method=RequestMethod.GET)
	public String agencyupdateresult(
			SessionStatus session
			,Model model 
			,@ModelAttribute("member")Member member){
		
		logger.info("회원 정보 수정 완료 폼 이동 시작");
		model.addAttribute("memberName", member.getMemberName());
		session.setComplete();
		logger.info("회원 정보 수정 완료 폼 이동 종료");
		return "memberupdate/agencyupdateresult";
		
	}
	

	
}
