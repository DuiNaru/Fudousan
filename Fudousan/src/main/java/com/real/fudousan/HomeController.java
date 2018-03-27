package com.real.fudousan;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.controller.MemberController;

@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String Home() {
    	logger.info(this.getClass().getName() + "Start");
    	logger.info(this.getClass().getName() + "End");
    	return "home";
    }

    @RequestMapping(value="/prototype", method=RequestMethod.GET)
    public String prototype() {
    	logger.info(this.getClass().getName() + "Start");
    	logger.info(this.getClass().getName() + "End");
    	return "prototype/prototype";
    }
	
}
