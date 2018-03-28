package com.real.fudousan.favorite.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.real.fudousan.favorite.vo.Favorite;

@Service
public class FavoriteService {
	/**
	 * 내가 찜한 매물 확인
	 * @param id
	 * @return
	 */
	public List<Favorite> viewMyFavorite(String id) {
		
		return null;
	}
	
	/**
	 * 찜하기
	 * @param id
	 * @param estateId
	 * @return
	 */
	public boolean add(String id, int estateId) {
		
		return false;
	}
}
