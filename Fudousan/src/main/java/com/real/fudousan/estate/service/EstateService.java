package com.real.fudousan.estate.service;

import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.estate.dao.EstateDAO;
import com.real.fudousan.estate.vo.Estate;

@Service
public class EstateService {
	private static final Logger logger = LoggerFactory.getLogger(EstateService.class);
	
	@Autowired
	private EstateDAO dao;
	
	/**
	 * 해당 매물 정보를 가져온다.
	 * @param estateId
	 * @return
	 */
	public Estate viewEstate(int estateId) {
		
		return null;
	}
	
	/**
	 * 매물 추가
	 * @param estate
	 * @return
	 */
	public int addEstate(Estate estate) {
		int result = dao.insertByIds(estate);
		
		return result;
	}
	
	/**
	 * 매물 수정
	 * @param estate
	 * @return
	 */
	public boolean modifyEstate(Estate estate) {
		
		return false;
	}
	
	/**
	 * 매물 삭제
	 * @param estateId
	 * @return
	 */
	public boolean delEstate(int estateId) {
		
		return false;
	}
	
	/**
	 * estateId 들을 모두 검색하여 가져온다.
	 * @param estateIds
	 * @return
	 */
	public List<Estate> getEsates(Set<Integer> estateIds) {
		logger.info("getEstates("+estateIds+") Start");
		List<Estate> result = dao.select(estateIds);
		logger.info("getEstates("+estateIds+") End");
		return result;
	}
}
