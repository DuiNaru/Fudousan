package com.real.fudousan.agency.dao;

import java.util.List;

import com.real.fudousan.agency.vo.Agency;

public interface AgencyDAO {
	public List<Agency> selectByConfirmed(int confirm);
}
