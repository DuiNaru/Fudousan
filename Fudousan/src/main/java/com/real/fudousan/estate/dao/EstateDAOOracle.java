
package com.real.fudousan.estate.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.entry.dao.EntryMapper;
import com.real.fudousan.estate.service.EstateService;
import com.real.fudousan.estate.vo.Estate;

@Repository
public class EstateDAOOracle implements EstateDAO {
   private static final Logger logger = LoggerFactory.getLogger(EstateService.class);
   
   @Autowired
   private SqlSession session;
   
   
   //목록 리스트
   @Override
   public List<Estate> select(String email){
	   List<Estate> result = null;
	   
      try {
         EstateMapper mapper = session.getMapper(EstateMapper.class);
         result = mapper.select(email);
      } catch(Exception e) {
         e.printStackTrace();
      }
      
      logger.info("select("+email+") End");
      return result;
   }

   
   /*@Override
   public List<Estate> select(Set<Integer> estateIds) {
      logger.info("select("+estateIds+") Start");
      List<Estate> result = null;
      try {
         EstateMapper mapper = session.getMapper(EstateMapper.class);
         result = mapper.select(estateIds);
      } catch(Exception e) {
         e.printStackTrace();
      }
      logger.info("select("+estateIds+") End");
      return result;
   }*/

   
   
   
   
   
   
/*매물등록*/
   @Override
   public int insertByIds(Estate estate) {
      int result = 0;
      
      try{
         EstateMapper mapper = session.getMapper(EstateMapper.class);
        // EntryMapper mapper2= session.getMapper(EntryMapper.class);
         result = mapper.insertByIds(estate);
      }
      catch(Exception e){
         e.printStackTrace();
      }
      
      return result;
   }




@Override
public int updateByIds(Estate estate) {
	
	return 0;
}
   
   
   

}




/*package com.real.fudousan.estate.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.estate.service.EstateService;
import com.real.fudousan.estate.vo.Estate;

@Repository
public class EstateDAOOracle implements EstateDAO {
	private static final Logger logger = LoggerFactory.getLogger(EstateService.class);
	
	@Autowired
	private SqlSession session;

	
	public List<Estate> select(Set<Integer> estateIds) {
		logger.info("select("+estateIds+") Start");
		List<Estate> result = null;
		try {
			EstateMapper mapper = session.getMapper(EstateMapper.class);
			result = mapper.selectByIds(estateIds);
		} catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("select("+estateIds+") End");
		return result;
	}

	
	
	
매물등록
	@Override
	public int insertByIds(Estate estate) {
		int result = 0;
		
		try{
			EstateMapper mapper = session.getMapper(EstateMapper.class);
			result = mapper.insertByIds(estate);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	//업데이트
	@Override
	public int updateByIds(Estate estate) {
		int result = 0;
		
		try{
			EstateMapper mapper = session.getMapper(EstateMapper.class);
			result = mapper.insertByIds(estate);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	

}*/
