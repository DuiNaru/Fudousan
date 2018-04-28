package com.real.fudousan.entry.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.real.fudousan.agency.dao.AgencyDAO;
import com.real.fudousan.entry.dao.EntryDAO;
import com.real.fudousan.entry.vo.Entry;
import com.real.fudousan.estate.controller.EstateController;
import com.real.fudousan.estate.dao.EstateDAO;
import com.real.fudousan.estate.vo.Estate;

@Service
public class EntryService {

	
	@Autowired
	private EntryDAO dao;
	
	
	
	/**
	 * 해당 부동산 중개사무소에서 등록한 매물 리스트
	 * @param agencyId
	 * @return
	 */
	public List<Entry> getEntryByAgency(int agencyId) {
		
		return null;
	}
	
	/**
	 * 매물 등록
	 * @param entry
	 * @return
	 */
	//public boolean addEntry(Entry entry) {
		
	public int addEntry(Entry entry) {
	
  /*  //중개소 주소 파싱  
    String locationInfo = "municipality"+"districtname"+"address";
   RestTemplate restTemplate = new RestTemplate();
   String locationResult = restTemplate.getForObject("https://maps.googleapis.com/maps/api/geocode/json?address={a}&key=AIzaSyAlZMVBrvQGWP2QTDvf5ur7HrtEC3xlOf0", String.class, locationInfo);
   System.out.println("locationInfo:::"+locationResult);
   
   
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
    
         entry.getEstate().setEstateX(Double.parseDouble(lat2));
         entry.getEstate().setEstateY(Double.parseDouble(lng2));
         
         System.out.println("서비스 " + entry);
      }
      
   } catch (Exception e) {
      // TODO: handle exception
   }
    */

	int result = dao.insertEntry(entry);
	System.out.println(entry);
		return result;
	}
	
	public int updateByIds(Entry entry){
		int result = dao.updateByIds(entry);
		return result;
		
	}
	
	/**
	 * 매물 삭제
	 * @param entry
	 * @return
	 */
	public int deleteEntry(Entry entry) {
		int result = dao.deleteEntry(entry);
		
		return result;
	}
	
	//매물 수정 페이지로 이동
	public int modifyEstatePage(Entry entry){
		int result = dao.modifyEstatePage(entry);
		
		
		return result;
		
	}
	
	
	
	/**
	 * 매물 삭제
	 * @param agencyId
	 * @param estateId
	 * @return
	 */
	
	
	/**
	 * 매물 가격 수정
	 * @param entry
	 * @return
	 */
	public boolean modifyPrice(Entry entry) {
		return false;
	}
	
	/**
	 * 매물 가격 수정
	 * @param agencyId
	 * @param estateId
	 * @param price
	 * @return
	 */
	public boolean modifyPrice(int agencyId, int estateId, int price) {
		return modifyPrice(new Entry(/* TODO */));
	}
}
