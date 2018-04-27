package com.real.fudousan.reply.dao;

import com.real.fudousan.reply.vo.Reply;

public interface ReplyDAO {
	public int insertReply(Reply reply);
	public Reply selectReply();
/*	public int deleteReply(Reply reply);
	public int updateReply(Reply reply);*/
}
