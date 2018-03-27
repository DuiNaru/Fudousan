package com.real.fudousan.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.service.MemberService;

@Controller
@RequestMapping(value="join")
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService service;
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(){
		
		return "join/join";
	}
	
	@RequestMapping(value="agencyjoin", method=RequestMethod.GET)
	public String AgencyJoin(){
		return "join/agencyjoin";
	}

}



