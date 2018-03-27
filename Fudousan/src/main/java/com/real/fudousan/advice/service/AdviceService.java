package com.real.fudousan.advice.service;

import java.util.List;

import com.real.fudousan.advice.vo.Advice;

public class AdviceService {

	/**
	 * 신청한 모든 목록
	 * @param id 신청한 사람
	 * @return
	 */
	public List<Advice> getRequestList(String id) {
		
		return null;
	}
	
	/**
	 * 신청 받은 모든 목록
	 * @param id
	 * @return
	 */
	public List<Advice> getRequestedList(String id) {
		
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
}
