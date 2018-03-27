package com.real.fudousan.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.member.dao.MemberDAO;
import com.real.fudousan.member.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;

	/**
	 * 로그인
	 * @param id 아이디
	 * @param pw 비밀번호
	 * @return
	 */
	public boolean login(String id, String pw) {
		if(dao.select(id, pw) == null) {
			return false;
		}
		return true;
	}
	
	/**
	 * 로그아웃
	 * @param id 아이디
	 * @return
	 */
	public boolean logout(String id) {
		
		return false;
	}
	
	/**
	 * 사용자 회원 가입
	 * @param member
	 * @return
	 */
	public boolean registerMember(Member member) {
		
		return false;
	}
	
	/**
	 * 인테리어 업자 회원 가입
	 * @param member
	 * @return
	 */
	public boolean registerInterior(Member member) {
		
		return false;
	}
	
	/**
	 * 부동산 업자 회원 가입
	 * @param member
	 * @return
	 */
	public boolean registerAgency(Member member) {
		
		return registerAgency(member, null);
	}
	
	/**
	 * 부동산 업자 회원 가입
	 * @param member
	 * @param agency
	 * @return
	 */
	public boolean registerAgency(Member member, Agency agency) {
		
		return false;
	}
	
	/**
	 * 회원 정보 수정
	 * @param member id에 해당하는 회원을 해당 정보로 변경한다.
	 * @return
	 */
	public boolean modifyMember(Member member) {
		
		return false;
	}
}
