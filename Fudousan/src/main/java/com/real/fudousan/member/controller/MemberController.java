package com.real.fudousan.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.service.MemberService;

@Controller
@RequestMapping(value="user")
public class MemberController {

	private MemberService service;
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @RequestMapping(value="mypagecustomer", method=RequestMethod.GET)
    public String joinForm(Model model){
        logger.info("mypagecustomer start");
        
        /*service.login(id, pw);*/
        
        logger.info("mypagecustomer end");
        return "user/mypagecustomer";
    }
    

}
