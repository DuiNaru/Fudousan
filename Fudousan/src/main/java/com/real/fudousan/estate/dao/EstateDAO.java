package com.real.fudousan.estate.dao;

import java.util.List;
import java.util.Set;

import com.real.fudousan.estate.vo.Estate;

public interface EstateDAO {
	public List<Estate> select(Set<Integer> estateIds);
}
