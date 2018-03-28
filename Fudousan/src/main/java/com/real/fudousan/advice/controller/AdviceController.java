package com.real.fudousan.advice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.real.fudousan.advice.service.AdviceService;

@Controller
public class AdviceController {
	
	@Autowired
	private AdviceService service;

}
