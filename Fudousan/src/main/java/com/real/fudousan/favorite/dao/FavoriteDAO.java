package com.real.fudousan.favorite.dao;

import java.util.List;

import com.real.fudousan.favorite.vo.Favorite;

public interface FavoriteDAO {

	//사용자가 찜한 모든 것들의 리스트 출력
	public List<Favorite> allFavorite(int memberId);
	
	//사용자의 찜목록에서 
	public List<Favorite> searchFavorite(int memberId,int estateId);
	
	
	
}
