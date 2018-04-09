package com.real.fudousan.estate.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.agency.service.AgencyService;
import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.entry.service.EntryService;
import com.real.fudousan.entry.vo.Entry;
import com.real.fudousan.estate.service.EstateService;
import com.real.fudousan.estate.vo.Estate;
import com.real.fudousan.estate.vo.MunicipalityCode;
import com.real.fudousan.estate.vo.TransType;
import com.real.fudousan.member.controller.MemberController;

@Controller
public class EstateController {
	
	/*테스트*/
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private EstateService estateService;
	@Autowired
	private EntryService entryService;
	@Autowired
	private AgencyService agencyService;
	
	
	
/*	@RequestMapping(value="estatewrite", method=RequestMethod.POST)
	public String estatewrite(Model model, HttpSession session, Estate estate, TransType transType
			,MunicipalityCode municipalitycode , String prefecture ,String municipality,String districtname
			,String neareststation,Integer  timetoneareststation,Integer tradeprice,Integer priceperunit,String floorplan ,Integer area,
			Integer unitprice,String landshape, Integer totalfloorarea ,String buildingyear,String structure,String use,
		    Integer  coverageratio ,Integer  floorarearatio , String address , String estateName, Integer price){
		
		logger.info("매물 등록 시작");
		Entry entry = new Entry();
		
		System.out.println("estate = " +   estate);
		entry.setPrice(price);
		estate.setEstateName(estateName);
		estate.setTransType(transType);
		estate.setMunicipalitycode(municipalitycode);
		estate.setPrefecture(prefecture);
		estate.setMunicipality(municipality);
		estate.setDistrictname(districtname);
		estate.setNeareststation(neareststation);
		estate.setTimetoneareststation(timetoneareststation);
		estate.setTradeprice(tradeprice);
		estate.setPriceperunit(priceperunit);
		estate.setFloorplan(floorplan);
		estate.setArea(area);
		estate.setUnitprice(unitprice);
		estate.setLandshape(landshape);
		estate.setTotalfloorarea(totalfloorarea);
		estate.setBuildingyear(buildingyear);
		estate.setStructure(structure);
		estate.setUse(use);
		estate.setCoverageratio(coverageratio);
		estate.setFloorarearatio(floorarearatio);
		estate.setAddress(address);
		
		System.out.println(price);
		estateService.addEstate(estate);
		int estate_id = estate.getEstateId();
		
		String email = (String) session.getAttribute("loginEmail");
		int agency_id = agencyService.selectAgencyId(email);
		
		entry.setEstate_id(estate_id);
		entry.setAgency_id(agency_id);
		entryService.addEntry(entry);

		logger.info("매물 등록 종료");
		return "/brokers/bm";
	}*/
	
	@RequestMapping(value="estatewrite", method=RequestMethod.POST)
	public String estatewrite(Model model, HttpSession session, Estate estate, TransType transType
			,MunicipalityCode municipalitycode , String prefecture ,String municipality,String districtname
			,String neareststation,Integer  timetoneareststation,Integer tradeprice,Integer priceperunit,String floorplan ,Integer area,
			Integer unitprice,String landshape, Integer totalfloorarea ,String buildingyear,String structure,String use,
		    Integer  coverageratio ,Integer  floorarearatio , String address , String estateName, Integer price){
		
		logger.info("매물 등록 시작");
		Entry entry = new Entry();
		
		System.out.println("estate = " +   estate);
		entry.setPrice(price);
		estate.setEstateName(estateName);
		estate.setTransType(transType);
		estate.setMunicipalitycode(municipalitycode);
		estate.setPrefecture(prefecture);
		estate.setMunicipality(municipality);
		estate.setDistrictname(districtname);
		estate.setNeareststation(neareststation);
		estate.setTimetoneareststation(timetoneareststation);
		estate.setTradeprice(tradeprice);
		estate.setPriceperunit(priceperunit);
		estate.setFloorplan(floorplan);
		estate.setArea(area);
		estate.setUnitprice(unitprice);
		estate.setLandshape(landshape);
		estate.setTotalfloorarea(totalfloorarea);
		estate.setBuildingyear(buildingyear);
		estate.setStructure(structure);
		estate.setUse(use);
		estate.setCoverageratio(coverageratio);
		estate.setFloorarearatio(floorarearatio);
		estate.setAddress(address);
		
		System.out.println(price);
		estateService.addEstate(estate);
		int estate_id = estate.getEstateId();
		
		String email = (String) session.getAttribute("loginEmail");
		int agency_id = agencyService.selectAgencyId(email);
		
		logger.info("estate_id : " + estate_id);
		entry.setEstate(estate);
		Agency agency = new Agency();
		agency.setAgencyId(agency_id);
		entry.setAgency(agency);
		//entry.setEstate_id(estate_id);
		//entry.setAgency_id(agency_id);
		entryService.addEntry(entry);

		logger.info("매물 등록 종료");
		return "/brokers/bm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*테스트*/
	//이젠 무쓸모 
	 @RequestMapping(value="okhtest", method=RequestMethod.GET)
	    public String prototype() {
		 logger.info("okh 테스트 페이지 이동");
	    	return "/okhtest";
	
	    }
	 
	 @RequestMapping(value="bw", method=RequestMethod.GET)
	    public String bw() {
		 logger.info("매물 등록 페이지 이동");
	    	return "/brokers/bw";
	    	
	 }
	 
	 @RequestMapping(value="bc", method=RequestMethod.GET)
	    public String bc(Model model) {
		 logger.info("수정 페이지 이동");
		 	
	
		 
	    	return "/brokers/bc";
	 }
	 
	 /*수정*/
	 @RequestMapping(value="estateupdate", method=RequestMethod.POST)
	    public String estateupdate(Model model){
			
		
		 	
			logger.info("수정 페이지 이동");
		 
	    	return "/brokers/bm";
	 }
	 
	 
	 @RequestMapping(value="bm", method=RequestMethod.GET)
	 public String bm(Model model, HttpSession session) {
		logger.info("메니저 페이저 진입 / 매물 목록 출력 완료  ");
		 
		String email = (String) session.getAttribute("loginEmail");
		System.out.println("Login Email: " + email);
		 
		ArrayList<Estate> select = new ArrayList<Estate>();
		select = (ArrayList<Estate>) estateService.getEsates(email);
		
		model.addAttribute("select", select);
		 	
		System.out.println(select);
		// System.out.println(estate);
		logger.info("매물 목록 출력 완료  ");
	    return "/brokers/bm";
	 }
	 /*테스트 끝*/
	 
	 
	
	 
	 
	 
	 
}
