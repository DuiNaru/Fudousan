package com.real.fudousan.member.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.member.vo.Member;

@Repository
public interface MemberDAO {

	public Member select(Member member);
	
	// 회원가입 
	public int insertMember(Member member);
	
	public int insertAgencyMember(Member member);
	public int insertAgency(Agency agency);



}
