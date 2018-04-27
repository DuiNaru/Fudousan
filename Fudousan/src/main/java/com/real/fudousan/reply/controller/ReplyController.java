package com.real.fudousan.reply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.member.controller.MemberController;
import com.real.fudousan.member.vo.Member;
import com.real.fudousan.reply.service.ReplyService;
import com.real.fudousan.reply.vo.Reply;

@Controller
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	ReplyService service;
	
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReply(Reply reply, String estateId, String memberId){
		logger.info("Insert Reply Start - controller");
		Member member = new Member();
		
		int estateIdResult = Integer.parseInt(estateId);
		int memberIdResult = Integer.parseInt(memberId);
		member.setMemberId(memberIdResult);
		reply.setEstateId(estateIdResult);
		reply.setMember(member);
		service.insertReply(reply);
		logger.info("Insert Reply End - controller");
		return "";
	}
	
	@RequestMapping(value="selectReply", method=RequestMethod.POST)
	public String selectReply(Model model){
		logger.info("Select Reply Start - Controller");
		Reply reply = service.selectReply();
		model.addAttribute("reply", reply);
		logger.info("Select Reply End - DAO Oracle");
		return "";
	}
	
/*	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	public String deleteReply(Reply reply){
		return "";
	}
	@RequestMapping(value="updateComment", method=RequestMethod.POST)
	public String updateComment(Reply reply){
		return "";
	}*/
	
}
