package com.real.fudousan;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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


@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Autowired
    private AgencyService service; 
    
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String Home(Model model) {
    	logger.info("Home Start");
    	
    	// 중개 업소 주소 -> 좌표 변경 후 home jsp로 전송 
    	List<Agency> agencyLocationList = service.agencyLocationPrint();
    	Float[] coordsResult = null; 
    	String address; 
    	List<String> locationList = new ArrayList<>();
    	String lat="";
    	String lng="";
    	String location = "";
    	for (Agency agency : agencyLocationList) {
    		String Main = agency.getAddressMain();
			String Middle = agency.getAddressMiddle();
			String Small = agency.getAddressSmall();
			String Sub = agency.getAddressSub();
			address = Main + Middle + Small + Sub;
			
			
			coordsResult = geoCoding(address);
		/*	System.out.println(address + ": " + coordsResult[0] + ", " + coordsResult[1]);*/
			
			for (Float float1 : coordsResult) {
				lat = "lat: "+Float.toString(coordsResult[0]);
				lng = "lng: "+Float.toString(coordsResult[1]);
				location = "{"+lat +", "+lng+"}";
			}
			locationList.add(location);
			
			model.addAttribute("locationList", locationList);
		}
    	
    	//매물 정보 API활용해서 가져오기 
    	String estateInfo = "";
		RestTemplate restTemplate = new RestTemplate();
		String estateInfoResult = restTemplate.getForObject("http://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20151&to=20152&area=37", String.class, estateInfo);
		System.out.println("estateInfo:::"+estateInfoResult);
		
		
    	 	
    	logger.info("Home End");
    	return "home";
    }

    @RequestMapping(value="/prototype", method=RequestMethod.GET)
    public String prototype() {
    	logger.info("prototype Start");
    	logger.info("prototype End");
    	return "prototype/prototype";
    }
    
    
    // 주소 -> 좌표 변환 메소드 
    public static Float[] geoCoding(String location) {

    	if (location == null)  

    	return null;

    			       

    	Geocoder geocoder = new Geocoder();

    	// setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)

    	// setLanguate : 인코딩 설정

    	GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();

    	GeocodeResponse geocoderResponse;



    	try {

    	geocoderResponse = geocoder.geocode(geocoderRequest);

    	if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {



    	GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();

    	LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();

    					  

    	Float[] coords = new Float[2];

    	coords[0] = latitudeLongitude.getLat().floatValue();

    	coords[1] = latitudeLongitude.getLng().floatValue();

    	return coords;

    	}

    	} catch (IOException ex) {

    	ex.printStackTrace();

    	}

    	return null;

    }



	
}
