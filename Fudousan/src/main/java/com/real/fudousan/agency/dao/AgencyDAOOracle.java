package com.real.fudousan.agency.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.agency.vo.Agency;

@Repository
public class AgencyDAOOracle implements AgencyDAO {
	private static final Logger logger = LoggerFactory.getLogger(AgencyDAOOracle.class);
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Agency> selectByConfirmed(int confirm) {
		logger.info("selectByConfirmed(" + confirm + ") Start");
		List<Agency> result = null;
		
		try {
			AgencyMapper mapper = session.getMapper(AgencyMapper.class);
			result = mapper.selectByConfirmed(confirm);
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
		}
		
		logger.info("selectByConfirmed(" + confirm + ") End");
		return result;
	}
	


}
