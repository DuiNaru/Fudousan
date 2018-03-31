package com.real.fudousan.member.dao;

import org.springframework.stereotype.Repository;

import com.real.fudousan.member.vo.Member;

@Repository
public interface MemberDAO {

	public Member select(Member member);
	public int insertMember(Member member);


}
