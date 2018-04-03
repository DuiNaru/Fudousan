package com.real.fudousan.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.vo.Member;

@Controller
@RequestMapping(value="memberupdate")
public class UpdateMemberController {

	@RequestMapping(value="memberupdate", method=RequestMethod.GET)
	public String memberupdate(){
		
		
		return "memberupdate/memberupdate";
	}
	
	@RequestMapping(value="agencyupdate", method=RequestMethod.GET)
	public String agencyupdate(){
		
		
		return "memberupdate/agencyupdate";
	}
	
	@RequestMapping(value="modifyMember", method=RequestMethod.POST)
	public String modifyMember(Member member){
		
		
		return "";
	}
	
	
}
