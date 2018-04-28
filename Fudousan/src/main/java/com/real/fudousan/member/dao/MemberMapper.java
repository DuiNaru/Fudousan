package com.real.fudousan.member.dao;
import java.util.ArrayList;

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
	public int updateAgencyMember(Member member);
	public int updateAgency(Agency agency);

	public ArrayList<Member> interior();
	
	//회원정보 하나가져오기 이메일을 파라메터로 받아서.
	public Member getOneMember(String email);
}
