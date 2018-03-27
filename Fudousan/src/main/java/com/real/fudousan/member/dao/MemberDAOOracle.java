package com.real.fudousan.member.dao;

import org.springframework.stereotype.Repository;

import com.real.fudousan.member.vo.Member;

@Repository
public class MemberDAOOracle implements MemberDAO {

	@Override
	public Member select(String id, String pw) {
		// TODO 직접 Mybatis로 id와 pw 검색해서 Member 반환
		return null;
	}

}
