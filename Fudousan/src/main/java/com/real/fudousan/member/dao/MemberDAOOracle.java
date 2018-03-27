package com.real.fudousan.member.dao;

import com.real.fudousan.member.vo.Member;

public class MemberDAOOracle implements MemberDAO {

	@Override
	public Member select(String id, String pw) {
		// TODO 직접 Mybatis로 id와 pw 검색해서 Member 반환
		return null;
	}

}
