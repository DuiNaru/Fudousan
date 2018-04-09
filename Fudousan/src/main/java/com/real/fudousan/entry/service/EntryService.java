package com.real.fudousan.entry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.entry.dao.EntryDAO;
import com.real.fudousan.entry.vo.Entry;

@Service
public class EntryService {

	
	@Autowired
	private EntryDAO dao;
	
	/**
	 * 해당 부동산 중개사무소에서 등록한 매물 리스트
	 * @param agencyId
	 * @return
	 */
	public List<Entry> getEntryByAgency(int agencyId) {
		
		return null;
	}
	
	/**
	 * 매물 등록
	 * @param entry
	 * @return
	 */
	//public boolean addEntry(Entry entry) {
		
	public int addEntry(Entry entry) {
	int result = dao.insertEntry(entry);
		
		
		return result;
	}
	
	/**
	 * 매물 등록
	 * @param agencyId
	 * @param estateId
	 * @param price
	 * @return
	 */
	/*public boolean addEntry(int agencyId, int estateId, int price) {
		return addEntry(new Entry( TODO ));
	}*/
	
	/**
	 * 매물 삭제
	 * @param entry
	 * @return
	 */
	public boolean delEntry(Entry entry) {
		return false;
	}
	
	/**
	 * 매물 삭제
	 * @param agencyId
	 * @param estateId
	 * @return
	 */
	public boolean delEntry(int agencyId, int estateId) {
		return delEntry(new Entry(/* TODO */));
	}
	
	/**
	 * 매물 가격 수정
	 * @param entry
	 * @return
	 */
	public boolean modifyPrice(Entry entry) {
		return false;
	}
	
	/**
	 * 매물 가격 수정
	 * @param agencyId
	 * @param estateId
	 * @param price
	 * @return
	 */
	public boolean modifyPrice(int agencyId, int estateId, int price) {
		return modifyPrice(new Entry(/* TODO */));
	}
}
