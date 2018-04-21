package com.real.fudousan.room.controller;

import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.real.fudousan.advice.service.AdviceService;
import com.real.fudousan.advice.vo.Advice;
import com.real.fudousan.common.util.PageNavigator;
import com.real.fudousan.favorite.service.FavoriteService;
import com.real.fudousan.favorite.vo.Favorite;
import com.real.fudousan.item.service.ItemService;
import com.real.fudousan.room.service.RoomService;
import com.real.fudousan.room.vo.Room;
import com.real.fudousan.roomitem.service.RoomItemService;
import com.real.fudousan.roomwall.service.RoomWallService;
import com.real.fudousan.roomwall.vo.RoomWall;

@SessionAttributes("loginId")
@Controller
public class RoomController {

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	@Autowired
	private RoomService Rservice;
	@Autowired
	private FavoriteService Fservice;
	@Autowired
	private AdviceService Aservice;
	@Autowired
	private RoomWallService roomWallService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private RoomItemService roomItemService;
	
	
	@RequestMapping(value="searchMyRoom" , method=RequestMethod.GET)
	public String searchMyRoom(Model model,String roomSearch,int memberId){
		logger.info("RoomController-searchMyRoom_Start");
		logger.info("매물 이름 검색한 결과 :  " + roomSearch);
		List<Room> srlist = Rservice.showMyRoom(roomSearch, memberId);
		model.addAttribute("rlist",srlist);

        List<Favorite> flist = Fservice.showAllFavorite(memberId);
        List<Advice> alist = Aservice.getRequestList(memberId, Advice.REQUEST);
        List<Advice> rclist = Aservice.getRequestList(memberId, Advice.CONFIRMED);
        
        model.addAttribute("flist", flist);
        model.addAttribute("alist", alist);
        model.addAttribute("rclist", rclist);
		
		logger.info("RoomController-searchMyRoom_End");
		return "user/mypagecustomer";
	}
	
	@RequestMapping(value="allMyRooms" , method=RequestMethod.GET)
	public String allMyRooms(Model model,int memberId){
		logger.info("RoomController-searchMyRoom_Start");
		List<Room> allRooms = Rservice.showAllRoom(memberId);
		model.addAttribute("rlist",allRooms);
		logger.info("RoomController-searchMyRoom_End");
		return "user/mypagecustomer";
	}
	
	@ResponseBody
	@RequestMapping(value="changeRoomPublic" , method=RequestMethod.GET)
	public int changeRoomPublic(@ModelAttribute("loginId") int memberId, int roomId, int roomPublic){
		logger.info("changeRoomPublic("+roomId+", "+roomPublic+") Start");
		
		int result = -1;
		if(Rservice.changeRoomPublic(memberId, roomId, roomPublic)) {
			result = roomPublic;
		}
		logger.info("changeRoomPublic("+roomId+", "+roomPublic+") End");
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteRoom" , method=RequestMethod.GET)
	public boolean deleteRoom(@ModelAttribute("loginId") int memberId, int roomId){
		logger.info("deleteRoom("+roomId+") Start");
		
		boolean result = Rservice.deleteRoom(memberId, roomId);
		logger.info("deleteRoom("+roomId+") End");
		return result;
	}
	
	@RequestMapping(value="newRoom", method=RequestMethod.GET)
	public String newRoom(@ModelAttribute("loginId") int loginId, Room room, Model model) {
		logger.info("newRoom("+loginId+", "+room+") Start");
		String returnedURL = "redirect:roomPage";
		
		room.setMemberId(loginId);
		int roomId = Rservice.createRoom(room);
		model.addAttribute("roomId", roomId);
		// 만약, 실제 방이 존재하지 않는 방이면 벽 생성화면으로 이동한다.
		if(room.getEstate() == null) {
			returnedURL = "redirect:wall/wallPage";
		}
		
		
		logger.info("newRoom("+loginId+", "+room+") End");
		return returnedURL;
	}
	
	@RequestMapping(value="roomPage", method=RequestMethod.GET)
	public String roomPage(@ModelAttribute("loginId") int loginId, int roomId, Model model) {
		logger.info("roomPage("+loginId+", "+roomId+") Start");
		
		Room room = Rservice.showRoom(roomId);
		if (room != null) {
			model.addAttribute("room", room);
			
			Map<String, List<?>> map = roomWallService.getWallAndConnector(roomId);
			model.addAttribute("walls", map.get("walls"));
			
			model.addAttribute("itemList", itemService.allList());
			
			model.addAttribute("roomitemList", roomItemService.getRoomItemsInRoom(roomId));
		}
		
		logger.info("roomPage("+loginId+", "+roomId+") End");
		return "room/room";
	}
	

	/*방높이*/
	@ResponseBody
	@RequestMapping(value="wallheightchange", method=RequestMethod.POST)
	public String wallheightchange(int roomId, int height){
		logger.info("방높이 변경 시작 컨트롤러 ");
		System.out.println("넘어오낭");
		Room room = new Room();
		room.setRoomId(roomId);
		room.setHeight(height);
		System.out.println("room: " + room);
		Rservice.wallheightchange(room);
	
		return "";
	}

	@ResponseBody
	@RequestMapping(value="selectRoomEstate", method=RequestMethod.POST)
	public HashMap<String, Object> selecteRoomEstate(
			Model model 
			,String estateId
			, @RequestParam(value="page", defaultValue="1")int page
			){
		logger.info("estate id에 해당하는 3d디자인 방 가져오기 시작");
		final int countPerPage = 3;
		final int pagePerGroup = 5; 
		
	
		// estateId(String) --> int 
		int estateIdresult = Integer.parseInt(estateId);
		
		int total = Rservice.getTotal(estateIdresult);
		
		PageNavigator navi = new PageNavigator (countPerPage, pagePerGroup, page, total);
		
		// 총 페이지  수 
		
		
		List<Room> list= Rservice.selectEstateRoom(estateIdresult, navi.getStartRecord(), navi.getCountPerPage());
		HashMap<String, Object> map = new HashMap<>(); 
		map.put("list", list);
		map.put("totalPage", navi.getTotalPageCount());
		
		logger.info("estate id에 해당하는 3d디자인 방 가져오기 종료");

		return map;

	}
	
	
	
	
}
