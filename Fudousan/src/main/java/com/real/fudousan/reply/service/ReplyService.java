package com.real.fudousan.reply.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.member.controller.MemberController;
import com.real.fudousan.reply.dao.ReplyDAO;
import com.real.fudousan.reply.vo.Reply;

@Service
public class ReplyService {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	ReplyDAO dao;
	
	public int insertReply(Reply reply){
		logger.info("Insert Reply Start - service");
		int result = dao.insertReply(reply);
		logger.info("Insert Reply End - service ");
		return result;
	}
	
	public Reply selectReply(){
		logger.info("Select Reply Start - service");
		Reply reply = dao.selectReply();
		logger.info("Select Reply End - service");
		return reply; 
	}
	
	

}
