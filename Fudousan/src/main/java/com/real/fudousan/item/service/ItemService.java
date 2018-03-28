package com.real.fudousan.item.service;

import org.springframework.stereotype.Service;

import com.real.fudousan.item.vo.Item;

@Service
public class ItemService {
	/**
	 * 아이템을 추가한다.
	 * @param item
	 * @return 추가한 아이템 ID, 실패시 -1
	 */
	public int addItem(Item item) {
		
		return -1;
	}
	
	/**
	 * 아이템을 수정한다.
	 * @param item
	 * @return
	 */
	public boolean modifyItem(Item item) {
		
		return false;
	}
	
	/**
	 * 아이템을 삭제한다.
	 * @param itme
	 * @return
	 */
	public boolean deleteItem(Item itme) {
		
		return false;
	}
	
	/**
	 * 아이템 상세 보기
	 * @param itemId
	 * @return
	 */
	public Item viewItem(int itemId) {
		
		return null;
	}
}
