package com.real.fudousan.memeber.dao;

import com.real.fudousan.memeber.vo.Member;

public class MemberDAOOracle implements MemberDAO {

	@Override
	public Member select(String id, String pw) {
		// TODO 직접 Mybatis로 id와 pw 검색해서 Member 반환
		return null;
	}

}
