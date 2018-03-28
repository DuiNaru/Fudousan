package com.real.fudousan.estate.service;

import org.springframework.stereotype.Service;

import com.real.fudousan.estate.vo.Estate;

@Service
public class EstateService {
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
		
		return -1;
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
}
