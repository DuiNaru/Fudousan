package com.real.fudousan.favorite.controller;

import org.springframework.stereotype.Controller;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
public class FavoriteController {
	private static final Logger logger = LoggerFactory.getLogger(FavoriteController.class);

	@Autowired
	private FavoriteService service;
	@Autowired
	private RoomService Rservice;
	@Autowired
	private FavoriteService Fservice;
	@Autowired
	private AdviceService Aservice;
	
	@RequestMapping(value="searchFavorite",method=RequestMethod.GET)
	public String saerchFavorite(Model model,int memberId, String favoSearch){
		List<Favorite> seacrhFavorite = null;
		seacrhFavorite = service.showSearchFavorite(memberId, favoSearch);
		logger.info("찜하기 매물의 검색값  : "+favoSearch);
		model.addAttribute("flist",seacrhFavorite);
		
		List<Room> allRooms = Rservice.showAllRoom(memberId);
        List<Advice> alist = Aservice.getRequestList(memberId);
        List<Advice> rclist = Aservice.getRequestedList(memberId);
        model.addAttribute("rlist",allRooms);
        model.addAttribute("alist", alist);
        model.addAttribute("rclist", rclist);
	
		return "user/mypagecustomer";
	}
}
