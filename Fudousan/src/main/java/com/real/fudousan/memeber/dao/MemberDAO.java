package com.real.fudousan.memeber.dao;

import com.real.fudousan.memeber.vo.Member;

public interface MemberDAO {
	public Member select(String id, String pw);
}
