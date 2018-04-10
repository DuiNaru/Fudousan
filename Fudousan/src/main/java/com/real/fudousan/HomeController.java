package com.real.fudousan;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import com.real.fudousan.estate.service.EstateService;
import com.real.fudousan.estate.vo.Estate;
import com.real.fudousan.estate.vo.MunicipalityCode;
import com.real.fudousan.estate.vo.TransType;


@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Autowired
    private AgencyService service; 
    private EstateService eService; 
    
    
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
    	
    	logger.info("estateInfo Start");
    	
    	//매물 정보 API활용해서 가져오기 
    	String estateInfo = "";
		RestTemplate restTemplate = new RestTemplate();
		String estateInfoResult = restTemplate.getForObject("http://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20101&to=20134&station=02590", String.class, estateInfo);
		
		// object setting 
		Estate estate = new Estate();
		TransType trans = new TransType();
		MunicipalityCode mun = new MunicipalityCode();
		
		try {
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(estateInfoResult);
			JSONArray  estateInfoArray = (JSONArray) jsonObject.get("data");
			
			
			for (int i = 0; i < estateInfoArray.size(); i++) {
				JSONObject  data= (JSONObject)estateInfoArray.get(i);
				
				// get estate Type 
				String Type = data.get("Type").toString();
				
				
				// trans name setting 
				trans.setTransName(Type);	
				
				
				// trans id setting 
				if (Type.contains("中古マンション等")) {
					
					// trans type id setting to trans 
					trans.setTransTypeId(1);
						
						// start insert trans
						eService.insertTrans(trans);
				
				
					// municipality Code setting to mun object 
					mun.setMunicipalitycodeId(Integer.parseInt(data.get("MunicipalityCode").toString()));
				
					
					//municipality name setting to mun object 
					mun.setCodeName(data.get("Municipality").toString());
						
						// start insert Municipality code 
						eService.insertMunicipalitycode(mun);
				
					// estate setting 
					estate.setTransType(trans);
					estate.setMunicipalitycode(mun);
						
						// start insert estate 
						eService.addEstate(estate);
					
					
				
				}else if(Type.contains("宅地(土地と建物)")){
					// trans type id setting to trans 
					trans.setTransTypeId(2);
					
						// start insert trans
						eService.insertTrans(trans);
					
					
					// municipality Code setting to mun object 
					mun.setMunicipalitycodeId(Integer.parseInt(data.get("MunicipalityCode").toString()));
				
					
					//municipality name setting to mun object 
					mun.setCodeName(data.get("Municipality").toString());
						
						// start insert Municipality code 
						eService.insertMunicipalitycode(mun);
						
					// estate setting 
					estate.setTransType(trans);
					estate.setMunicipalitycode(mun);
						
						// start insert estate 
						eService.addEstate(estate);
				
					
				}else if(Type.contains("宅地(土地)")){
					
					// trans type id setting to trans 
					trans.setTransTypeId(3);
					
						// start insert trans
						eService.insertTrans(trans);
				
				
					// municipality Code setting to mun object 
					mun.setMunicipalitycodeId(Integer.parseInt(data.get("MunicipalityCode").toString()));
			
				
					//municipality name setting to mun object 
					mun.setCodeName(data.get("Municipality").toString());
				
						// start insert Municipality code 
						eService.insertMunicipalitycode(mun);
						
					// estate setting 
					estate.setTransType(trans);
					estate.setMunicipalitycode(mun);
						
						// start insert estate 
						eService.addEstate(estate);
				}
				
				
				
			
				
				
				
				/*JSONObject geometryLocation=(JSONObject)data.get("geometry");
				JSONObject location2 = (JSONObject)geometryLocation.get("location");
				System.out.println("geometryLocation: "+ geometryLocation);
			
				String lat2 = location2.get("lat").toString();
				String lng2 = location2.get("lng").toString();
				agency.setGpsX(Double.parseDouble(lat2));
				agency.setGpsY(Double.parseDouble(lng2));*/

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
    	 	
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
