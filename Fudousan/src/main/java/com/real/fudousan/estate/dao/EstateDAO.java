package com.real.fudousan.estate.dao;

import java.util.List;

import com.real.fudousan.estate.vo.Estate;

public interface EstateDAO {
	public List<Estate> select(int[] estateIds);
}
