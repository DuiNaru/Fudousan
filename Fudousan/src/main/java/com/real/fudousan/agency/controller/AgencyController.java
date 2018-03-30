package com.real.fudousan.agency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AgencyController {
/*테스트*/
	 @RequestMapping(value="okhtest", method=RequestMethod.GET)
	    public String prototype() {
	    	
	    	return "/okhtest";
	
	    }
	 
	 @RequestMapping(value="bw", method=RequestMethod.GET)
	    public String bw() {
	    	
	    	return "/brokers/bw";
	    	
	 }
	 
	 @RequestMapping(value="bc", method=RequestMethod.GET)
	    public String bc() {
	    	
	    	return "/brokers/bc";
	 }
	 
	 @RequestMapping(value="bm", method=RequestMethod.GET)
	    public String bm() {
	    	
	    	return "/brokers/bm";
	 }
	 
	 
	 
	
	
}
