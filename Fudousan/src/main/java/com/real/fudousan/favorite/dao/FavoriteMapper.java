package com.real.fudousan.favorite.dao;

import java.util.List;

import com.real.fudousan.favorite.vo.Favorite;

public interface FavoriteMapper {
	public List<Favorite> allFavorite(Integer memberId);
	
	public List<Favorite> searchFavorite(int memberId,int estateId);
}
