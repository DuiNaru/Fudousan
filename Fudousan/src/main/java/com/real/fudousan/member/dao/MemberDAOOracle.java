package com.real.fudousan.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.item.dao.ItemDAOOracle;
import com.real.fudousan.member.vo.Member;

@Repository
public class MemberDAOOracle implements MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOOracle.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Member select(Member member) {
		// TODO 직접 Mybatis로 id와 pw 검색해서 Member 반환
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		Member result = null;
		
		try {
			result = memberMapper.selectMember(member);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 회원 가입  
	@Override
	public int insertMember(Member member){
		
		int result = 0;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			result = memberMapper.insertMember(member);
		} catch(Exception e){
			e.printStackTrace();
			
		}
		
		return result; 
	}

}
