package com.real.fudousan.estate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.controller.MemberController;

@Controller
public class EstateController {
	/*테스트*/
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	 @RequestMapping(value="okhtest", method=RequestMethod.GET)
	    public String prototype() {
		 logger.info("okh 테스트 페이지 이동");
	    	return "/okhtest";
	
	    }
	 
	 @RequestMapping(value="bw", method=RequestMethod.GET)
	    public String bw() {
		 logger.info("매물 등록 페이지 이동");
	    	return "/brokers/bw";
	    	
	 }
	 
	 @RequestMapping(value="bc", method=RequestMethod.GET)
	    public String bc() {
		 logger.info("수정 페이지 이동");
	    	return "/brokers/bc";
	 }
	 
	 @RequestMapping(value="bm", method=RequestMethod.GET)
	    public String bm() {
		 logger.info("매니저 페이지 이동");
	    	return "/brokers/bm";
	 }
	 
}
