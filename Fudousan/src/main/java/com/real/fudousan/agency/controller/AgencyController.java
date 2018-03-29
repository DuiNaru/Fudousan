package com.real.fudousan.agency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AgencyController {
/*테스트*/
	 @RequestMapping(value="bc", method=RequestMethod.GET)
	    public String prototype() {
	    	
	    	return "/brokers/bc";
	    }
	
	
}
