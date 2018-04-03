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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String searchMyRoom(Model model,String roomSearch,int memberId){
		logger.info("RoomController-searchMyRoom_Start");
		logger.info("매물 이름 검색한 결과 :  " + roomSearch);
		List<Room> srlist = Rservice.showMyRoom(roomSearch, memberId);
		model.addAttribute("rlist",srlist);

        List<Favorite> flist = Fservice.showAllFavorite(memberId);
        List<Advice> alist = Aservice.getRequestList(memberId, Advice.REQUEST);
        List<Advice> rclist = Aservice.getRequestList(memberId, Advice.CONFIRMED);
        
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
	
	@ResponseBody
	@RequestMapping(value="changeRoomPublic" , method=RequestMethod.GET)
	public int changeRoomPublic(int roomId, int roomPublic){
		logger.info("changeRoomPublic("+roomId+", "+roomPublic+") Start");
		// TODO 로그인 아이디로 변경
		int memberId = 1;
		
		int result = -1;
		if(Rservice.changeRoomPublic(memberId, roomId, roomPublic)) {
			result = roomPublic;
		}
		logger.info("changeRoomPublic("+roomId+", "+roomPublic+") End");
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteRoom" , method=RequestMethod.GET)
	public boolean deleteRoom(int roomId){
		logger.info("deleteRoom("+roomId+") Start");
		// TODO 로그인 아이디로 변경
		int memberId = 1;
		
		boolean result = Rservice.deleteRoom(memberId, roomId);
		logger.info("deleteRoom("+roomId+") End");
		return result;
	}
}
