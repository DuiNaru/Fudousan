package com.real.fudousan.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.member.vo.Member;

@Repository
public class MemberDAOOracle implements MemberDAO {
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

}
