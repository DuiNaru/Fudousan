package com.real.fudousan.reply.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.member.controller.MemberController;
import com.real.fudousan.reply.vo.Reply;

@Repository
public class ReplyDAOOracle implements ReplyDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertReply(Reply reply){
		logger.info("Insert Reply Start - DAO Oracle");
		int result = 0; 
		
		try{
			ReplyMapper replyMapper = sqlSession.getMapper(ReplyMapper.class);
			result = replyMapper.insertReply(reply);
		} catch(Exception e){
			e.printStackTrace();
		}
		logger.info("Insert Reply End - DAO Oracle");
		return result;
	}
	
	public Reply selectReply(){
		logger.info("Select Reply Start - DAO Oracle");
		Reply result = null; 
		try{
			ReplyMapper replyMapper = sqlSession.getMapper(ReplyMapper.class);
			result = replyMapper.selectReply();
		} catch(Exception e){
			e.printStackTrace();
		}
		logger.info("Select Reply End - DAO Oracle");
		return result;
	}
/*public int deleteReply(Reply reply){
		return 0;
	}
	public int updateReply(Reply reply){
		return 0;
	}*/
}
