package com.real.fudousan.estate.dao;

import java.util.List;
import java.util.Set;

import com.real.fudousan.estate.vo.Estate;
import com.real.fudousan.estate.vo.MunicipalityCode;
import com.real.fudousan.estate.vo.TransType;

public interface EstateDAO {


	//리스트 뿌려주는거
	/*public List<Estate> select(Set<Integer> estateIds);*/
	
	public List<Estate> select(String email);
	
	
	//등록
	public int insertByIds(Estate estate);
	
	

	//업데이트
	public int updateByIds(Estate estate);
	
	/* 목록 기능 테스트*/

	public List<Estate> select(Set<Integer> estateIds);


	//삭제


	

	// INSERT TRANS 
	public int insertTrans(TransType trans);

	
	// INSERT MUNICIPALITY CODE
	public int insertMunicipalitycode(MunicipalityCode mun);

}
