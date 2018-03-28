package com.real.fudousan.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.favorite.service.FavoriteService;
import com.real.fudousan.favorite.vo.Favorite;
import com.real.fudousan.member.service.MemberService;
import com.real.fudousan.room.service.RoomService;
import com.real.fudousan.room.vo.Room;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	@Autowired
	private RoomService Rservice;
	@Autowired
	private FavoriteService Fservice;
    
	@RequestMapping(value="mypageNormalUser", method=RequestMethod.GET)
	public String mypageNormalUser(Model model, int memberId){	
		logger.info("MC 일반 사용자의 마이페이지 접속  Start");
        List<Room> rlist = Rservice.showAllRoom(memberId);
        List<Favorite> flist = Fservice.showAllFavorite(memberId);
     
        model.addAttribute("rlist", rlist);
        model.addAttribute("flist", flist);
        logger.info("MC 일반 사용자의 마이페이지 접속  End");
        return  "user/mypagecustomer";
	}
	
	
    @RequestMapping(value="join", method=RequestMethod.GET)
    public String joinForm(Model model){
        logger.info("가입 시작");
        logger.info("가입 끝");
        return "";
    }
    
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String login(String id, String password, HttpSession session){
    	logger.info("로그인 시작");
    	
    	boolean loginCheck = service.login(id, password);
    	
    	if (loginCheck == false){
    		logger.info("로그인 실패");
    		return "";
    	}
    	else {
    		session.setAttribute("loginID", id);
    		
    		logger.info("로그인 성공");
    		return "";
    	}
    }
    
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logout(HttpSession session){
    	logger.info("로그아웃 시작");
    	
    	session.removeAttribute("loginID");
    	
    	logger.info("로그아웃 성공");
    	return "";
    }
}
