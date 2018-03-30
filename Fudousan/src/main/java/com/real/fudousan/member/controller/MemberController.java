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
import org.springframework.web.bind.annotation.ResponseBody;

import com.real.fudousan.favorite.service.FavoriteService;
import com.real.fudousan.favorite.vo.Favorite;
import com.real.fudousan.member.service.MemberService;
import com.real.fudousan.member.vo.Member;
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
	public String mypageNormalUser(Model model, Integer memberId){	
		logger.info("MC 일반 사용자의 마이페이지 접속  Start");
		memberId = 1;
        List<Room> rlist = Rservice.showAllRoom(memberId);
        List<Favorite> flist = Fservice.showAllFavorite(memberId);
        
        logger.info("room 리스트 출력 결과 : "+rlist);
        logger.info("favorite 리스트 출력 결과 : "+ flist);
        
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
    
    @ResponseBody
    @RequestMapping(value="login", method=RequestMethod.POST)
    public int login(HttpSession session, String email, String password){
    	logger.info("로그인 시작");
    	
    	Member member = new Member();
    	member.setEmail(email);
    	member.setPassword(password);
    	
    	int loginCheck = service.login(member);
    	
    	if (loginCheck == 1){
    		logger.info("로그인 실패 - 아이디 없음");
    		return 1;
    	}
    	else if (loginCheck == 2){
    		return 2;
    	}
    	else {
    		session.setAttribute("loginEmail", email);
    		
    		logger.info("로그인 성공");
    		return 0;
    	}
    }
    
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logout(HttpSession session){
    	logger.info("로그아웃 시작");
    	
    	session.removeAttribute("loginEmail");
    	
    	logger.info("로그아웃 성공");
    	return "home";
    }
}
