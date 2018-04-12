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
import com.real.fudousan.member.service.MemberService;


@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    

    
    @Autowired
    private AgencyService service; 
    
    @Autowired
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
    	
    	
    	
    	
    	
    	List<Estate> Eresult = null;
		List<String> ElocationList = new ArrayList<>();
    	Eresult = eService.selectEsatesLocation();
    	for (Estate estate : Eresult) {
    		System.out.println(estate);
    		
    		Double estateX = estate.getEstateX();
			Double estateY = estate.getEstateY();
			String lat = "lat: "+ estateX.toString();
			String lng = "lng: "+ estateY.toString(); 
			
			String estateLocation = "{"+lat +", "+lng+"}";
			
			ElocationList.add(estateLocation);
		}
		model.addAttribute("elocationList", ElocationList);
    	
    	
    	
    	
    		
    	
    	logger.info("estateInfo Start");
    	
    	
    	//매물 정보 API활용해서 가져오기 
    	String estateInfo = "";
		RestTemplate restTemplate = new RestTemplate();
		String estateInfoResult = restTemplate.getForObject("http://www.land.mlit.go.jp/webland/api/TradeListSearch?from=20151&to=20152&area=13", String.class, estateInfo);
		
		// object setting 
		Estate estate = new Estate();
		TransType trans = new TransType();
		MunicipalityCode mun = new MunicipalityCode();
		String address = "";
		String Prefecture = "";
		String Municipality = "";
		String DistrictName = "";
		
		try {
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(estateInfoResult);
			JSONArray  estateInfoArray = (JSONArray) jsonObject.get("data");
			
			
			for (int i = 0; i < estateInfoArray.size(); i++) {
				JSONObject  data= (JSONObject)estateInfoArray.get(i);
			
				// get estate 			
				String Type = data.get("Type").toString();
				
				
				if (data.get("Region") != null) {
					String Region = data.get("Region").toString();
					estate.setRegion(Region);					
				}
				
				if(data.get("Prefecture") != null){
					  Prefecture = data.get("Prefecture").toString();
						estate.setPrefecture(Prefecture);
				}
				
				if(data.get("Municipality") != null){
					 Municipality = data.get("Municipality").toString();
					 estate.setMunicipality(Municipality);
					}
				
				if(data.get("DistrictName") != null){
					DistrictName = data.get("DistrictName").toString();
					estate.setDistrictname(DistrictName);
				}
				if(data.get("NearestStation") != null){
					String NearestStation = data.get("NearestStation").toString();
					estate.setNeareststation(NearestStation); 
				}
				
				if(data.get("TimeToNearestStation")!= null){
					Integer TimeToNearestStation = Integer.parseInt(data.get("TimeToNearestStation").toString());
					estate.setTimetoneareststation(TimeToNearestStation);
				}
				
				if(data.get("TradePrice") != null){
					Integer TradePrice = Integer.parseInt(data.get("TradePrice").toString());
					estate.setTradeprice(TradePrice);
					}
				if(data.get("PricePerUnit") != null){
					Integer PricePerUnit = Integer.parseInt(data.get("PricePerUnit").toString());
					estate.setPriceperunit(PricePerUnit);
				}
				
				if(data.get("FloorPlan") != null){
					String FloorPlan = data.get("FloorPlan").toString();
					estate.setFloorplan(FloorPlan);
				} 
				
				if(data.get("Area") != null){
					Integer Area = Integer.parseInt(data.get("Area").toString());
					estate.setArea(Area);
				}
				
				if(data.get("UnitPrice") != null){
					Integer UnitPrice = Integer.parseInt(data.get("UnitPrice").toString());
					estate.setUnitprice(UnitPrice);
				}
				
				if(data.get("LandShape") != null){
					String LandShape = data.get("LandShape").toString();
					estate.setLandshape(LandShape);
				}
				if(data.get("Frontage") != null){
					Double Frontage = Double.parseDouble(data.get("Frontage").toString());
					
					estate.setFrontage(Frontage);
				} 
				if(data.get("TotalFloorArea") != null){
					Integer TotalFloorArea = Integer.parseInt(data.get("TotalFloorArea").toString());
					estate.setTotalfloorarea(TotalFloorArea);
				}
				if(data.get("BuildingYear") != null){
					String BuildingYear = data.get("BuildingYear").toString();
					estate.setBuildingyear(BuildingYear);
				}
				if(data.get("Structure") != null){
					String Structure = data.get("Structure").toString();
					estate.setStructure(Structure);
				}
				if(data.get("Use") != null){
					String Use = data.get("Use").toString();
					estate.setUse(Use);
				}
				 if(data.get("Purpose")!= null){
					 String Purpose = data.get("Purpose").toString();
					 estate.setPurpose(Purpose);
				}
				if(data.get("Direction") != null){
					String Direction = data.get("Direction").toString();
					estate.setDirection(Direction);
				}
				if(data.get("Classification") != null){
					String Classification = data.get("Classification").toString();
					estate.setClassification(Classification);
				}
				if(data.get("Breadth") != null){
					Double Breadth = Double.parseDouble(data.get("Breadth").toString());
					estate.setBreadth(Breadth);
				}
				if(data.get("CityPlanning") != null){
					String CityPlanning = data.get("CityPlanning").toString();
					estate.setCityplanning(CityPlanning);
				}
				if(data.get("CoverageRatio") != null){
					Integer CoverageRatio = Integer.parseInt(data.get("CoverageRatio").toString());
					estate.setCoverageratio(CoverageRatio);
				}
				 if(data.get("FloorAreaRatio") != null){
					 Integer FloorAreaRatio = Integer.parseInt(data.get("FloorAreaRatio").toString());
					 estate.setFloorarearatio(FloorAreaRatio);
				} 
				if(data.get("Period") != null){
					String Period = data.get("Period").toString();
					estate.setPeriod(Period);
				}
				if(data.get("Renovation") != null){
					String Renovation = data.get("Renovation").toString();
					estate.setRenovation(Renovation);
				}
				if(data.get("Remarks") != null){
					String Remarks = data.get("Remarks").toString();
					estate.setRemarks(Remarks);
				}
				
				// address setting 
				
				int cho = (int) (Math.random() * 10) + 1;
				int ban = (int) (Math.random() * 10) + 1;
				int go = (int) (Math.random() * 10) + 1;
				
				String Scho = String.valueOf(cho);
				String Sban = String.valueOf(ban);
				String Sgo = String.valueOf(go);

				address = Prefecture + Municipality + DistrictName+Scho+"-"+Sban+"-"+Sgo;
				
				estate.setAddress(address);
				System.out.println(address);
		    	String locationInfo = address;
				RestTemplate AddressRestTemplate = new RestTemplate();
				String locationResult = AddressRestTemplate.getForObject("https://maps.googleapis.com/maps/api/geocode/json?address={a}&key=AIzaSyAlZMVBrvQGWP2QTDvf5ur7HrtEC3xlOf0", String.class, locationInfo);
				System.out.println("locationInfo:::"+locationResult);
				
				
				try {
					
					JSONParser AddressJsonParser = new JSONParser();
					JSONObject AddressJsonObject = (JSONObject) AddressJsonParser.parse(locationResult);
					JSONArray  locationArray = (JSONArray) AddressJsonObject.get("results");

					if (locationArray.size() != 0) {
							
						
						for (int j = 0; j < locationArray.size(); j++) {
							JSONObject  geometry= (JSONObject)locationArray.get(j);
							JSONObject geometryLocation=(JSONObject)geometry.get("geometry");
							JSONObject location2 = (JSONObject)geometryLocation.get("location");
							System.out.println("geometryLocation: "+ geometryLocation);
							
							String lat2 = location2.get("lat").toString();
							String lng2 = location2.get("lng").toString();
							if (lat2 !=null && lng2 !=null) {
								
								estate.setEstateX(Double.parseDouble(lat2));
								estate.setEstateY(Double.parseDouble(lng2));
							}
							
						}
						// estate setting 
						
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
						} // if end
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
	
		} catch (Exception e) {
			
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
