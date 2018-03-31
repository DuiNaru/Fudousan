package com.real.fudousan.advice.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.advice.dao.AdviceDAO;
import com.real.fudousan.advice.vo.Advice;
import com.real.fudousan.item.dao.ItemDAOOracle;

@Service
public class AdviceService {
	private static final Logger logger = LoggerFactory.getLogger(AdviceService.class);
	@Autowired
	private AdviceDAO dao;

	/**
	 * 신청한 모든 목록
	 * @param id 신청한 사람
	 * @return
	 */
	public List<Advice> getRequestList(int id) {
		logger.info("getRequestList("+id+") Start");
		List<Advice> HelpCall = null;
		HelpCall = dao.normalUserHelpCall(id);
		logger.info("getRequestList("+id+") End");
		return HelpCall;
	}
	
	/**
	 * 신청 받은 모든 목록
	 * @param id
	 * @return
	 */
	public List<Advice> getRequestedList(int id) {
		logger.info("getRequestedList("+id+") Start");
		List<Advice> reverseCall = null;
		reverseCall = dao.reverseCall(id);
		logger.info("getRequestedList("+id+") End");
		return reverseCall;
	}
	
	/**
	 * 내가 인테리어 업자의 조언 요청 취소하기
	 * @param advice
	 * @return
	 */
	public boolean cancelAdvice(Advice advice) {
		logger.info("cancelAdvice("+advice+") Start");
			boolean cancelOk = false;
			cancelOk = dao.cancleAdvice(advice);
			logger.info("cancelAdvice("+advice+") End");
		return cancelOk;
	}
	
	/**
	 * 승인 하기
	 * @param advice 승인 대상
	 * @return
	 */
	public boolean confirm(Advice advice) {
		logger.info("confirm("+advice+") Start");
		logger.info("confirm("+advice+") End");
		
		return false;
	}
	
	/**
	 * 요청 거부 하기
	 * @param advice
	 * @return
	 */
	public boolean unConfirm(Advice advice) {
		logger.info("unConfirm("+advice+") Start");
		logger.info("unConfirm("+advice+") End");
		
		return false;
	}
	
	/**
	 * 이메일1이 이메일2한테 요청
	 * @param email1
	 * @param email2
	 * @return
	 */
	public boolean request(String email1, String email2) {
		logger.info("request("+email1+", "+email2+") Start");
		logger.info("request("+email1+", "+email2+") End");
		
		return false;
	}
}
