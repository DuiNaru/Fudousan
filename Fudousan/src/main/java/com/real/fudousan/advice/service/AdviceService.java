package com.real.fudousan.advice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.advice.dao.AdviceDAO;
import com.real.fudousan.advice.vo.Advice;

@Service
public class AdviceService {
	@Autowired
	private AdviceDAO dao;

	/**
	 * 신청한 모든 목록
	 * @param id 신청한 사람
	 * @return
	 */
	public List<Advice> getRequestList(int id) {
		List<Advice> HelpCall = null;
		HelpCall = dao.normalUserHelpCall(id);
		return HelpCall;
	}
	
	/**
	 * 신청 받은 모든 목록
	 * @param id
	 * @return
	 */
	public List<Advice> getRequestedList(int id) {
		
		return null;
	}
	
	/**
	 * 조언 요청 취소하기
	 * @param advice
	 * @return
	 */
	public boolean cancelAdvice(Advice advice) {
		
		return false;
	}
	
	/**
	 * 승인 하기
	 * @param advice 승인 대상
	 * @return
	 */
	public boolean confirm(Advice advice) {
		
		return false;
	}
	
	/**
	 * 요청 거부 하기
	 * @param advice
	 * @return
	 */
	public boolean unConfirm(Advice advice) {
		
		return false;
	}
	
	/**
	 * 이메일1이 이메일2한테 요청
	 * @param email1
	 * @param email2
	 * @return
	 */
	public boolean request(String email1, String email2) {
		
		return false;
	}
}
