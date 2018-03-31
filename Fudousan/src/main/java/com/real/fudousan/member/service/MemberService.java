package com.real.fudousan.member.service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.common.util.FileService;
import com.real.fudousan.member.dao.MemberDAO;
import com.real.fudousan.member.vo.Member;

@Service
public class MemberService {
	
	private static final String memberFileBaseDirectory = "/member/";
	
	@Autowired
	private MemberDAO dao;
	
	
	
	/**
	 * 로그인
	 * @param member
	 * @return [1: not found id] [2: incorrect password] [3: login success]
	 */
	public Member login(Member member) {
		Member result = dao.select(member);
		
		return result;
	}
	
	/**
	 * 사용자 회원 가입
	 * @param member
	 * @return
	 */
	public boolean registerMember(Member member, List<MultipartFile> files) {
		
		
		// get designer result
		int designer=member.getDesigner();
		
		// if member isn't designer
		if (designer == 0 ) {	
			int result = 0; 
			if ((result = dao.insertMember(member))>= -1 && files != null) {
				for(MultipartFile file : files){
					FileService.saveFile(file, memberFileBaseDirectory + result, true);
				}
			}
			// insert member success
			return true; 
		}
		
		return false; 

	}
	
	/**
	 * 인테리어 업자 회원 가입
	 * @param member
	 * @return
	 */
	public boolean registerInterior(Member member) {
		
		// get designer
		int designer=member.getDesigner();
		
		// if member is designer		
		if (designer == 1 ) {
			// true
			int result = dao.insertMember(member);
			
			if (result != 1) {
				// insert member fail
				return false; 
				
			}
				// insert member success 
				return true;
		}
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
