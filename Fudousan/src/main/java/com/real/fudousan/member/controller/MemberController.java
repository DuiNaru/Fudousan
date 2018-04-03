package com.real.fudousan.member.controller;

import java.util.HashMap;
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

import com.real.fudousan.advice.service.AdviceService;
import com.real.fudousan.advice.vo.Advice;
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
	@Autowired
	private AdviceService Aservice;
    
	@RequestMapping(value="mypageNormalUser", method=RequestMethod.GET)
	public String mypageNormalUser(Model model, Integer memberId){	
		logger.info("MC 일반 사용자의 마이페이지 접속  Start");
		memberId = 1;
        List<Room> rlist = Rservice.showAllRoom(memberId);
        List<Favorite> flist = Fservice.showAllFavorite(memberId);
        List<Advice> alist = Aservice.getRequestList(memberId, Advice.REQUEST);
        List<Advice> rclist = Aservice.getRequestList(memberId, Advice.CONFIRMED);
        logger.info("사용자가 꾸미는 매물 리스트 출력 결과 : "+rlist.size());
        logger.info("사용자의 찜목록  출력 결과 : "+ flist.size());
        logger.info("사용자가 도움을 요청한 기록 출력 결과 : "+ alist.size());
        logger.info("인테리어 업자의 도움요청 승인 목록 결과 : "+ rclist.size());
        model.addAttribute("rlist", rlist);
        model.addAttribute("flist", flist);
        model.addAttribute("alist", alist);
        model.addAttribute("rclist", rclist);
        logger.info("MC 일반 사용자의 마이페이지 접속  End");
        return  "user/mypagecustomer";
	}
	
    
    @ResponseBody
    @RequestMapping(value="login", method=RequestMethod.POST)
    public HashMap<String, Object> login(HttpSession session, String email, String password){
    	logger.info("로그인 시작");
    	
    	Member member = new Member();
    	member.setEmail(email);
    	member.setPassword(password);
    	
    	Member loginMember = service.login(member);
    	
    	if (loginMember == null){
    		logger.info("로그인 실패 - 아이디 없음");
    		
    		HashMap<String, Object> result = new HashMap<>();
    		result.put("result", false);
    		result.put("errCode", "1");
    		
    		return result;
    	}
    	else if (!loginMember.getPassword().equals(password)){
    		logger.info("로그인 실패 - 비밀번호 틀림");
    		
    		HashMap<String, Object> result = new HashMap<>();
    		result.put("result", false);
    		result.put("errCode", "2");
    		
    		return result;
    	}
    	else {
    		session.setAttribute("loginEmail", email);
    		session.setAttribute("loginMemberName", loginMember.getMemberName());
    		
    		logger.info("로그인 성공");
    		
    		HashMap<String, Object> result = new HashMap<>();
    		result.put("result", true);
    		result.put("memeberName", loginMember.getMemberName());
    		
    		return result;
    	}
    }
    
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logout(HttpSession session){
    	logger.info("로그아웃 시작");
    	
    	session.removeAttribute("loginEmail");
    	
    	logger.info("로그아웃 성공");
    	return "redirect:/";
    }
}
