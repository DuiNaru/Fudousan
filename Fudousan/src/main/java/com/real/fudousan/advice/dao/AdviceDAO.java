package com.real.fudousan.advice.dao;

import java.util.List;

import com.real.fudousan.advice.vo.Advice;

public interface AdviceDAO {

	public List<Advice> normalUserHelpCall(int id);

	public List<Advice> reverseCall(int id);
	
	public boolean cancleAdvice(Advice advice);

}
