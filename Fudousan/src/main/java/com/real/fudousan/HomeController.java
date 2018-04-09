package com.real.fudousan;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
import com.real.fudousan.agency.service.AgencyService;
import com.real.fudousan.agency.vo.Agency;


@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Autowired
    private AgencyService service; 
    
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String Home(Model model) {
    	logger.info("Home Start");
    	
    	List<Agency> result = null;
    	List<String> locationList = new ArrayList<>();
    	String location = "";
    	result = service.agencyLocationPrint();
    	
    	for (Agency agency : result) {
			Double gpsX = agency.getGpsX();
			Double gpsY = agency.getGpsY();
			
			String lat = "lat: "+ gpsX.toString();
			String lng = "lng: "+ gpsY.toString();
			
			location = "{"+lat +", "+lng+"}";
					
			locationList.add(location);
			model.addAttribute("locationList", locationList);
		}
    	
    	
    	//매물 정보 API활용해서 가져오기 
    	String estateInfo = "";
		RestTemplate restTemplate = new RestTemplate();
	/*	String estateInfoResult = restTemplate.getForObject("http://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20151&to=20152&area=37", String.class, estateInfo);
		System.out.println("estateInfo:::"+estateInfoResult);*/
		
		
    	 	
    	logger.info("Home End");
    	return "home";
    }

    @RequestMapping(value="/prototype", method=RequestMethod.GET)
    public String prototype() {
    	logger.info("prototype Start");
    	logger.info("prototype End");
    	return "prototype/prototype";
    }
    


    @RequestMapping(value="/crossdomain", method=RequestMethod.GET)
    public String crossdomain() {
    	logger.info("crossdomain Start");
    	logger.info("crossdomain End");
    	return "crossdomain";
    }

	
    @RequestMapping(value="/anhaemin",method=RequestMethod.GET)
    public String stackTest(){
    	return "anhaeminTest";
    }
}
