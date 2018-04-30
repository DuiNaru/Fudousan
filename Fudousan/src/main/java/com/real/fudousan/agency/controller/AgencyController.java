package com.real.fudousan.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.agency.service.AgencyService;
import com.real.fudousan.agency.vo.Agency;

import com.real.fudousan.member.controller.MemberController;

@Controller
public class AgencyController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private AgencyService service;
	
	 @RequestMapping(value="agency/detailedinformation", method=RequestMethod.GET)
	public String detailedInformation(int agencyId, Model model){
		logger.info("detailedInformation("+agencyId+") Start");
		
		model.addAttribute("agency", service.selectAgencyOne(agencyId));

		logger.info("detailedInformation("+agencyId+") End");
		 return "agency/detailedinformation";
	}
	
}
