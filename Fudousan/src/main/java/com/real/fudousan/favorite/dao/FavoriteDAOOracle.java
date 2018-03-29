package com.real.fudousan.favorite.dao;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.real.fudousan.favorite.vo.Favorite;

@Repository
public class FavoriteDAOOracle implements FavoriteDAO {

	private static final Logger logger = LoggerFactory.getLogger(FavoriteDAOOracle.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Favorite> allFavorite(Integer memberId) {
		logger.info("사용자가 찜했던 모든 방 불러오기 - Start");
		FavoriteMapper mapper = sqlsession.getMapper(FavoriteMapper.class);
		List<Favorite> flist = null;
		try{
			flist = mapper.allFavorite(memberId);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("사용자가 찜했던 모든 방 불러오기 - End");
		return flist;
	}

	@Override
	public List<Favorite> searchFavorite(int memberId,int favoSearch) {
		logger.info("사용자 찜목록 검색- Start");
		
		FavoriteMapper mapper = sqlsession.getMapper(FavoriteMapper.class);
		List<Favorite> fslist = null;
		try{
			fslist = mapper.searchFavorite(memberId,favoSearch);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("사사용자 찜목록 검색 - Start");
		return fslist;
	}
}
