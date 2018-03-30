package com.real.fudousan.room.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.advice.service.AdviceService;
import com.real.fudousan.advice.vo.Advice;
import com.real.fudousan.favorite.service.FavoriteService;
import com.real.fudousan.favorite.vo.Favorite;
import com.real.fudousan.room.service.RoomService;
import com.real.fudousan.room.vo.Room;

@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	@Autowired
	private RoomService Rservice;
	@Autowired
	private FavoriteService Fservice;
	@Autowired
	private AdviceService Aservice;
	
	@RequestMapping(value="searchMyRoom" , method=RequestMethod.GET)
	public String searchMyRoom(Model model,int roomSearch,int memberId){
		logger.info("RoomController-searchMyRoom_Start");
		logger.info("매물 이름 검색한 결과 :  " + roomSearch);
		List<Room> srlist = Rservice.showMyRoom(roomSearch, memberId);
		model.addAttribute("rlist",srlist);

        List<Favorite> flist = Fservice.showAllFavorite(memberId);
        List<Advice> alist = Aservice.getRequestList(memberId);
        List<Advice> rclist = Aservice.getRequestedList(memberId);
        
        model.addAttribute("flist", flist);
        model.addAttribute("alist", alist);
        model.addAttribute("rclist", rclist);
		
		logger.info("RoomController-searchMyRoom_End");
		return "user/mypagecustomer";
	}
	
	@RequestMapping(value="allMyRooms" , method=RequestMethod.GET)
	public String allMyRooms(Model model,int memberId){
		logger.info("RoomController-searchMyRoom_Start");
		List<Room> allRooms = Rservice.showAllRoom(memberId);
		model.addAttribute("rlist",allRooms);
		logger.info("RoomController-searchMyRoom_End");
		return "user/mypagecustomer";
	}
	
	
}
