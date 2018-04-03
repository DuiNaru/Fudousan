package com.real.fudousan.member.dao;
import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.member.vo.Member;

public interface MemberMapper {
	public Member selectMember(Member member);
	
	// join 
	public int insertMember(Member member);
	public int insertAgencyMember(Member member);
	public int insertAgency(Agency agency);
	
	// update
	public int updateMember(Member member);
	
}
