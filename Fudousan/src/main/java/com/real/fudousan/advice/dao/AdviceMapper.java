package com.real.fudousan.advice.dao;

import java.util.List;

import com.real.fudousan.advice.vo.Advice;

public interface AdviceMapper {

	public List<Advice> normalUserHelpCall(int id);
}
