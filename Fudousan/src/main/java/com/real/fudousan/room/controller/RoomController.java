package com.real.fudousan.room.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.room.service.RoomService;
import com.real.fudousan.room.vo.Room;

@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	@Autowired
	private RoomService service;
	
	@RequestMapping(value="searchMyRoom" , method=RequestMethod.GET)
	public String searchMyRoom(Model model,int estateId,int memberId){
		logger.info("RoomController-searchMyRoom_Start");
		Room myroom = service.showMyRoom(estateId, memberId);
		model.addAttribute("myroom",myroom);
		logger.info("RoomController-searchMyRoom_End");
		return "user/mypagecustomer";
	}
	
	
}
