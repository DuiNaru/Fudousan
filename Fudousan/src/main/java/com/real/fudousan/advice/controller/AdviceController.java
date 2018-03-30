package com.real.fudousan.advice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.advice.service.AdviceService;
import com.real.fudousan.advice.vo.Advice;
import com.real.fudousan.member.controller.MemberController;

@Controller
public class AdviceController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private AdviceService service;

	@RequestMapping(value="cancelAdviceTrue", method=RequestMethod.GET)
	public String cancelAdviceCall(Model model,Integer customer , Integer interior){
		logger.info("Advice_Controller 사용자의 도움요청 취소 Start");
		Advice advice = new Advice();
		advice.setRequestMemberId(customer);
		advice.setRequestedMemeberId(interior);
		boolean tfresult = false;
		tfresult = service.cancelAdvice(advice);
		model.addAttribute("tfresult",tfresult);
		logger.info("tfresult : "+tfresult);
		logger.info("Advice_Controller 사용자의 도움요청 취소 End");
	       return  "user/mypagecustomer";
	}
}
