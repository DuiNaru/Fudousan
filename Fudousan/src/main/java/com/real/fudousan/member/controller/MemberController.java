package com.real.fudousan.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.service.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService service;
    
    @RequestMapping(value="user/mypagecustomer", method=RequestMethod.GET)
    public String joinForm(Model model){
        logger.info("mypagecustomer start");
        
        /*service.login(id, pw);*/
        
        logger.info("mypagecustomer end");
        return "user/mypagecustomer";
    }
    
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String login(String id, String password, HttpSession session){
    	logger.info("로그인 시작");
    	
    	boolean loginCheck = service.login(id, password);
    	
    	if (loginCheck == false){
    		logger.info("로그인 실패");
    		return "";
    	}
    	else {
    		session.setAttribute("loginID", id);
    		
    		logger.info("로그인 성공");
    		return "";
    	}
    }
    
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logout(HttpSession session){
    	logger.info("로그아웃 시작");
    	
    	session.removeAttribute("loginID");
    	
    	logger.info("로그아웃 성공");
    	return "";
    }
}
