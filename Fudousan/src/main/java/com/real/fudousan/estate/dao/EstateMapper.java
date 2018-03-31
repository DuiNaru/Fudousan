package com.real.fudousan.estate.dao;

import java.util.List;
import java.util.Set;

import com.real.fudousan.estate.vo.Estate;

public interface EstateMapper {
	public List<Estate> selectByIds(Set<Integer> estateIds);
}
