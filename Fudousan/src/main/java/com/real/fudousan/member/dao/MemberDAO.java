package com.real.fudousan.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.member.controller.JoinController;
import com.real.fudousan.member.vo.Member;

@Repository
public interface MemberDAO {
	public Member select(String id, String pw);
	
	public int insertMember(Member member);

}
