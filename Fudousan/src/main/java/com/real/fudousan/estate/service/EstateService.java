package com.real.fudousan.estate.service;

import java.util.List;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.real.fudousan.estate.dao.EstateDAO;
import com.real.fudousan.estate.vo.Estate;
import com.real.fudousan.estate.vo.MunicipalityCode;
import com.real.fudousan.estate.vo.TransType;

@Service
public class EstateService {
	private static final Logger logger = LoggerFactory.getLogger(EstateService.class);
	
	@Autowired
	private EstateDAO dao;
	
	/**
	 * 해당 매물 정보를 가져온다.
	 * @param estateId
	 * @return
	 */
	/*public Estate viewEstate(int estateId) {
	
		return null;
	}*/
	public Estate viewEstate(int estateId) {
		
		Estate result = dao.viewEstate(estateId);
		
		return result;
	}
	/**
	 * 매물 추가
	 * @param estate
	 * @return
	 * (완료)
	 */
	public int addEstate(Estate estate) {
		int result = dao.insertByIds(estate);
		
		return result;
	}
	
	/**
	 * 매물 수정
	 * @param estate
	 * @return
	 */
	public boolean modifyEstate(Estate estate) {
		
		return false;
	}
	//매물 수정 페이지로 이동
public boolean modifyEstatepage(Estate estate) {
		
		return false;
	}
	
	/**
	 * 매물 삭제
	 * @param estate
	 * @return
	 */
/*	public boolean delEstate(Estate estate) {
		int result = dao.delteByIds(estate)
		
		return false;
	}*/
	
	/**
	 * estateId 들을 모두 검색하여 가져온다.
	 * @param estateIds
	 * @return
	 */
	public List<Estate> getEsates(String email) {
		logger.info("getEstates("+email+") Start");
		
		List<Estate> result = dao.select(email);
		
		logger.info("getEstates("+email+") End");
		return result;
	}

	

	// INSERT TRANS 
	public int insertTrans(TransType trans){
		logger.info("insert trans start");
		
		
		int result = dao.insertTrans(trans);
		logger.info("insert trans end");
		return result;
		
	}
	
	// INSERT MUNICIPALITY CODE
	public int insertMunicipalitycode(MunicipalityCode mun){
		
		logger.info("insert municipalitycode start");

		int result = dao.insertMunicipalitycode(mun);
		logger.info("insert municipalitycode end");
		return result;
	}
	
	
	
	
	 /*
	
	public String ApiOutput(){

		// 중개 업소 주소 -> 좌표 변경 세팅  DB에 저장 

		logger.info("ApiOutput Start");
		
		//매물 주소 파싱  
   	String estateInfo="";
		RestTemplate restTemplate = new RestTemplate();
		String estateResult = restTemplate.getForObject("http://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20151&to=20152&city=13102", String.class, estateInfo);
		System.out.println("estateInfo:::"+estateResult);
		logger.info("ApiOutput End");
		return estateResult; 
		
		
		try {
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(locationResult);
			JSONArray  locationArray = (JSONArray) jsonObject.get("results");
			
			for (int i = 0; i < locationArray.size(); i++) {
				JSONObject  geometry= (JSONObject)locationArray.get(i);
				JSONObject geometryLocation=(JSONObject)geometry.get("geometry");
				JSONObject location2 = (JSONObject)geometryLocation.get("location");
				System.out.println("geometryLocation: "+ geometryLocation);
			
				String lat2 = location2.get("lat").toString();
				String lng2 = location2.get("lng").toString();
				agency.setGpsX(Double.parseDouble(lat2));
				agency.setGpsY(Double.parseDouble(lng2));

			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	
		
		
		
	}
	
	*/

	
}
