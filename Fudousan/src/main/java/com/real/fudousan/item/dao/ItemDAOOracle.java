package com.real.fudousan.item.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.item.vo.Item;

@Repository
public class ItemDAOOracle implements ItemDAO {
	private static final Logger logger = LoggerFactory.getLogger(ItemDAOOracle.class);
	
	@Autowired
	private SqlSession session;

	@Override
	public int insert(Item item) {
		logger.info("insert(" + item + ") Start");
		int result = -1;
		try {
			ItemMapper mapper = session.getMapper(ItemMapper.class);
			mapper.insert(item);
			// ID 가져오기
			result = item.getItemId();
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		logger.info("insert(" + item + ") End");
		return result;
	}

	@Override
	public List<Item> selectAll() {
		logger.info("selectAll() Start");
		List<Item> result = null;
		try {
			ItemMapper mapper = session.getMapper(ItemMapper.class);
			result = mapper.selectAll();
		} catch(Exception e) {
			e.printStackTrace();
			result = null;
		}
		logger.info("selectAll() End");
		return result;
	}

}
