package com.RealEstimate.www.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value="user")
public class UserMypageController {

	private static final Logger logger = LoggerFactory.getLogger(UserMypageController.class);
	
	@Autowired
	
	@RequestMapping(value="mypageCustomer", method=RequestMethod.GET)
	public String joinForm(Model model){
		logger.info("mypageCustomer start");
		logger.info("mypageCustomer end");
		return "user/mypageCustomer";
	}
	
}
