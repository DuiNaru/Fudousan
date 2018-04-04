package com.real.fudousan.estate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	private EstateService service;
	
	@RequestMapping(value="estatewrite", method=RequestMethod.POST)
	public String estatewrite(Model model, Estate estate ,TransType transType
			,MunicipalityCode municipalitycode , String prefecture ,String municipality,String districtname
			,String neareststation,Integer  timetoneareststation,Integer tradeprice,Integer priceperunit,String floorplan ,Integer area,
			Integer unitprice,String landshape, Integer totalfloorarea ,String buildingyear,String structure,String use,
		    Integer  coverageratio ,Integer  floorarearatio , String address
			 ){
		logger.info("매물 등록 시작");
		System.out.println(transType.toString() +  municipalitycode +  prefecture + municipality+
				districtname+ neareststation +timetoneareststation+ tradeprice+ priceperunit+
				floorplan+ area+ unitprice +  landshape + totalfloorarea + buildingyear +
				structure + use + coverageratio + floorarearatio + address );
		
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
		
		service.addEstate(estate);
		
		
		
		
		logger.info("매물 등록 종료");
		return "/brokers/bm";
	}
	
	
	
	/*테스트*/
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
	    public String bc() {
		 logger.info("수정 페이지 이동");
	    	return "/brokers/bc";
	 }
	 
	 @RequestMapping(value="bm", method=RequestMethod.GET)
	    public String bm() {
		 logger.info("매니저 페이지 이동");
	    	return "/brokers/bm";
	 }
	 /*테스트 끝*/
	 
	 
	
	 
	 
	 
	 
}
