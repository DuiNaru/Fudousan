package com.real.fudousan.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.agency.vo.Agency;

import com.real.fudousan.member.controller.MemberController;

@Controller
public class AgencyController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	 @RequestMapping(value="agency/detailedinfomation", method=RequestMethod.GET)
	public String detailedInfomation(Agency agency, String id){
		logger.info("중개소 상세 보기 이동 시작 ");
		System.out.println("id"+id);
		
		
		logger.info("중개소 상세 보기 이동 종료 "); 
		 return "agency/detailedinfomation";
	}
	
}
