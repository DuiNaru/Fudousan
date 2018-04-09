package com.real.fudousan.member.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.estate.vo.TransType;
import com.real.fudousan.common.util.FileService;
import com.real.fudousan.member.controller.UpdateMemberController;
import com.real.fudousan.member.dao.MemberDAO;
import com.real.fudousan.member.vo.Member;
import com.real.fudousan.member.vo.Permission;

@Service
public class MemberService {
	
	private static final String memberFileBaseDirectory = "/member/";
	
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	@Autowired
	private MemberDAO dao;
	
	
	
	/**
	 * 로그인
	 * @param member
	 * @return [1: not found id] [2: incorrect password] [3: login success]
	 */
	public Member login(Member member) {
		Member result = dao.select(member);
		return result;
	}
	
	/**
	 * 사용자 회원 가입
	 * @param member
	 * @return
	 */
	public boolean registerMember(Member member, MultipartFile file) {

			Permission p= new Permission(1, "member");
			member.setPermission(p);
			
			int result = 0; 
			if ((result = dao.insertMember(member))>= -1 && file != null) {
				FileService.saveFile(file, memberFileBaseDirectory + result, true);
			}
			
			if (result == 1) {
				// insert success
				return true; 
			}
			else{			
				
				// insert fail 
				return false; 
			}


	}
	
	/**
	 * 인테리어 업자 회원 가입
	 * @param member
	 * @return
	 */
	public boolean registerInterior(Member member, MultipartFile file) {
		

		Permission p= new Permission(2, "Interior");
		member.setPermission(p);
		
		int result = 0; 
		if ((result = dao.insertMember(member))>= -1 && file != null) {
			FileService.saveFile(file, memberFileBaseDirectory + result, true);
		}
		
		if (result == 1) {
			// insert success
			return true; 
		}
		else{			
			
			// insert fail 
			return false; 
		}
	
	}
	
	/**
	 * 부동산 업자 회원 가입
	 * @param member
	 * @return
	 */
	public boolean registerAgencyMember(Member member, MultipartFile file) {

		Permission p= new Permission(3, "Agency");
		member.setPermission(p);
		
		int result = 0; 
		if ((result = dao.insertAgencyMember(member))>= -1 && file != null) {
			FileService.saveFile(file, memberFileBaseDirectory + result, true);
		}
		
		if (result == 1) {
			// insert success
			return true; 
		}
		else{			
			
			// insert fail 
			return false; 
		}
	}
	
	/**
	 * 부동산 업자 회원 가입
	 * @param member
	 * @param agency
	 * @return
	 */
	public boolean registerAgency(Agency agency) {
		

		int result = 0;	
		
		
		
		// 중개 업소 주소 -> 좌표 변경 세팅  DB에 저장 
		Double lat=0.0; 
		Double lng=0.0;
		String location = "";		
		String address; 
		Float[] coordsResult = null; 
		String Main = agency.getAddressMain(); 
		String Middle = agency.getAddressMiddle();
		String Small = agency.getAddressSmall();
		String Sub = agency.getAddressSub();
		address = Main + Middle + Small + Sub; 
		
	
		do {
			// geoCoding으로 좌표값을 가져온다. 
			coordsResult = geoCoding(address);
			// 좌표 값을 lat, lng 변수에 넣어준다. 
			lat = Double.valueOf(coordsResult[0]);
			lng = Double.valueOf(coordsResult[1]);
			// agency 안에 gps를 넣어준다. 
			agency.setGpsX(lat);
			agency.setGpsY(lng);
			
		} while (coordsResult !=null);
	
		
		
		
    /*	
    	List<String> locationList = new ArrayList<>();
    	for (Agency agency : agencyLocationList) {
    		String Main = agency.getAddressMain();
			String Middle = agency.getAddressMiddle();
			String Small = agency.getAddressSmall();
			String Sub = agency.getAddressSub();
			address = Main + Middle + Small + Sub;
			
			
			coordsResult = geoCoding(address);
			System.out.println(address + ": " + coordsResult[0] + ", " + coordsResult[1]);
			
			for (int i=0; i<coordsResult.length; i++) {
				lat = "lat: "+Float.toString(coordsResult[0]);
				lng = "lng: "+Float.toString(coordsResult[1]);
				location = "{"+lat +", "+lng+"}";
			}
			locationList.add(location);
			
			model.addAttribute("locationList", locationList);
		}*/
		
		
		

	
		// trans type set 
		
		TransType t = new TransType(1, "apart");
		agency.setTransType(t);
		
		// confirm set
		agency.setConfirm(0);
		System.out.println("service:"+agency);
		result = dao.insertAgency(agency);
		
		if (result == 1) {
			// insert success
			return true; 
		}
		else{			
			
			// insert fail 
			return false; 
		}
					
				
	}
	
	/**
	 * 회원 정보 수정
	 * @param member id에 해당하는 회원을 해당 정보로 변경한다.
	 * @return
	 */
	public boolean modifyMember(Member member, MultipartFile file) {
		logger.info("회원 수정 시작 SERVICE");
		int result = 0;
		// get designer
		int designer = member.getDesigner();
		
		if (designer == 0) {
			
			Permission p= new Permission(1, "Member");
			member.setPermission(p);
			System.out.println(member);
			if ((result = dao.updateMember(member))>= -1 && file != null) {
				
				FileService.saveFile(file, memberFileBaseDirectory + result, true);
				
			}
			
		} else if(designer == 1){
			
			Permission p= new Permission(2, "Interior");
			member.setPermission(p);
			System.out.println(member);
			if ((result = dao.updateInterior(member))>= -1 && file != null) {
				
				FileService.saveFile(file, memberFileBaseDirectory + result, true);
				
			}
		}
	
		if (result == 1) {
			// insert success
			return true; 
		}
		else{			
			// insert fail 
			return false; 
		}
	}
	
	
	public boolean modifyAgencyMember(Member member, MultipartFile file){
		logger.info("회원 수정 시작 SERVICE");
		int result = 0;
		Permission p= new Permission(3, "Agency");
		member.setPermission(p);
		System.out.println(member);
		if ((result = dao.updateAgencyMember(member))>= -1 && file != null) {
			
			FileService.saveFile(file, memberFileBaseDirectory + result, true);
			
		}
		if (result == 1) {
			// insert success
			return true; 
		}
		else{			
			// insert fail 
			return false; 
		}
	}
	
	public boolean modifyAgency(Agency agency){
		logger.info("회원 수정 시작 SERVICE");
		int result = 0;	
		
		// 중개 업소 주소 -> 좌표 변경 세팅  DB에 저장 
		Double lat=0.0; 
		Double lng=0.0;
		String location = "";		
		String address; 
		Float[] coordsResult = null; 
		String Main = agency.getAddressMain(); 
		String Middle = agency.getAddressMiddle();
		String Small = agency.getAddressSmall();
		String Sub = agency.getAddressSub();
		address = Main + Middle + Small + Sub; 
		
	
		do {
			// geoCoding으로 좌표값을 가져온다. 
			coordsResult = geoCoding(address);
			// 좌표 값을 lat, lng 변수에 넣어준다. 
			lat = Double.valueOf(coordsResult[0]);
			lng = Double.valueOf(coordsResult[1]);
			// agency 안에 gps를 넣어준다. 
			agency.setGpsX(lat);
			agency.setGpsY(lng);
			
		} while (coordsResult !=null);
	
		
		// trans type set 
		
		TransType t = new TransType(1, "apart");
		agency.setTransType(t);
		
		// confirm set
		agency.setConfirm(0);
		System.out.println("service:"+agency);
		result = dao.updateAgency(agency);
		
		if (result == 1) {
			// insert success
			return true; 
		}
		else{			
			
			// insert fail 
			return false; 
		}
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


