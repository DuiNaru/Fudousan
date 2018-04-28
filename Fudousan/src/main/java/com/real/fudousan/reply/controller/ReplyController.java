package com.real.fudousan.reply.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.real.fudousan.member.controller.MemberController;
import com.real.fudousan.member.vo.Member;

import com.real.fudousan.reply.service.ReplyService;
import com.real.fudousan.reply.vo.Reply;

@Controller
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	ReplyService service;
	
	@ResponseBody
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	public String insertReply(Reply reply, String estateId, String memberId){
		logger.info("Insert Reply Start - controller");
		Member member = new Member();
		
		String estateIdTrim = estateId.trim();
		int estateIdResult = Integer.parseInt(estateIdTrim);
		int memberIdResult = Integer.parseInt(memberId);
		member.setMemberId(memberIdResult);
		reply.setEstateId(estateIdResult);
		reply.setMember(member);
		service.insertReply(reply);
		logger.info("Insert Reply End - controller");
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="selectReply", method=RequestMethod.POST)
	public List<Reply> selectReply(Model model){
		logger.info("Select Reply Start - Controller");
		List<Reply> reply = service.selectReply();
		logger.info("Select Reply End - Controller");
		return reply;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	public Boolean deleteReply( int replyId){
		logger.info("Delete Reply Start - Controller");
	
		boolean result = service.deleteReply(replyId);
		logger.info("Delete Reply End - Controller");
		return result;
	}
	/*@RequestMapping(value="updateComment", method=RequestMethod.POST)
	public String updateComment(Reply reply){
		return "";
	}*/
	
}
