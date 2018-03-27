package com.real.fudousan.member.dao;

import com.real.fudousan.member.vo.Member;

public interface MemberDAO {
	public Member select(String id, String pw);
}
