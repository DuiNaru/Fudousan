package com.real.fudousan.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.estate.vo.TransType;
import com.real.fudousan.common.util.FileService;
import com.real.fudousan.member.dao.MemberDAO;
import com.real.fudousan.member.vo.Member;
import com.real.fudousan.member.vo.Permission;

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
	public boolean registerMember(Member member, MultipartFile file) {
		// get designer result
		int designer=member.getDesigner();
		
		// if member isn't designer
		if (designer == 0 ) {	
		
			Permission p= new Permission(1, "member");
			member.setPermission(p);
			
			int result = 0; 
			if ((result = dao.insertMember(member))>= -1 && file != null) {
				FileService.saveFile(file, memberFileBaseDirectory + result, true);
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
	public boolean registerInterior(Member member, MultipartFile file) {
		
		// get designer
		int designer=member.getDesigner();

		// if member is designer		
		if (designer == 1 ) {
		
			// member permission id setting 
			Permission p= new Permission(2, "Interior");
			int result = 0; 
			if ((result = dao.insertMember(member))>= -1 && file != null) {
				FileService.saveFile(file, memberFileBaseDirectory + result, true);
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
	public boolean registerAgencyMember(Member member, MultipartFile file ) {
		
		/*return registerAgency(member, null);*/
		// get designer result
		int designer=member.getDesigner();
		
		// if member isn't designer
		if (designer == 0 ) {	
		
			Permission p= new Permission(3, "agency");
			member.setPermission(p);
			
			int result = 0; 
			if ((result = dao.insertAgencyMember(member))>= -1 && file != null) {
				FileService.saveFile(file, memberFileBaseDirectory + result, true);
			}
			// insert member success
			return true; 
		}
		
		return false; 
	}
	
	/**
	 * 부동산 업자 회원 가입
	 * @param member
	 * @param agency
	 * @return
	 */
	public boolean registerAgency(Agency agency) {
		
		int result = 0;	
	
		// trans type set 
		
		TransType t = new TransType(0, "test");
		agency.setTransType(t);
		
		// confirm set
		agency.setConfirm(0);
		System.out.println(agency);
		result = dao.insertAgency(agency);
		
		if (result == 1) {
			// insert success
			return true; 
		}
		else{			
			
			// insert fail 
			return false; 
		}
					
				
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
