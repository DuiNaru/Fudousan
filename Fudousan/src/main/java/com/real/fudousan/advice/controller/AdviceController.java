package com.real.fudousan.advice.controller;

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
import com.real.fudousan.member.controller.MemberController;
import com.real.fudousan.room.service.RoomService;
import com.real.fudousan.room.vo.Room;

@Controller
public class AdviceController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private AdviceService Aservice;
	@Autowired
	private FavoriteService Fservice;
	@Autowired
	private RoomService Rservice;

	@RequestMapping(value="cancelAdviceTrue", method=RequestMethod.GET)
	public String cancelAdviceCall(Model model,Integer customer , Integer interior){
		logger.info("Advice_Controller 사용자의 도움요청 취소 Start");
		Advice advice = new Advice();
		advice.setRequestMemberId(customer);
		advice.setRequestedMemeberId(interior);
		boolean tfresult = false;
		tfresult = Aservice.cancelAdvice(advice);
		model.addAttribute("tfresult",tfresult);
		logger.info("tfresult : "+tfresult);
		logger.info("Advice_Controller 사용자의 도움요청 취소 End");
		
		
        List<Favorite> flist = Fservice.showAllFavorite(customer);
        List<Advice> alist = Aservice.getRequestList(customer);
        List<Advice> rclist = Aservice.getRequestedList(customer);
		List<Room> allRooms = Rservice.showAllRoom(customer);
        
		model.addAttribute("rlist",allRooms);
        model.addAttribute("flist", flist);
        model.addAttribute("alist", alist);
        model.addAttribute("rclist", rclist);
		
	       return  "user/mypagecustomer";
	}
}
