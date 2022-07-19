package com.oaga.oaga_v1.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.CategoryType;
import com.oaga.oaga_v1.placeModel.GuInfo;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.service.TravelInfoService;
@Controller
public class TravelInfoController {

	
			@Autowired
			TravelInfoService travelInfoService;
			
			// 여행지 정보 보기 페이지
			@GetMapping({"/travel_info"})
			public String index( Model model) {
				Map<Integer, List<AreaGu>> map = travelInfoService.areaIdList();
				ArrayList<List<AreaGu>> list = new ArrayList<>();
				for(int i = 0; i < 13 ; i++) {
					list.add(i, map.get(i+1));
				}
				model.addAttribute("lists", list);
				
				return "/travelInfo/home";
			}
// ===================================================================================================
			
			
			
			// gu에 대한 정보 페이지 
			@GetMapping({"/travel_guinfo/{areaGu}"})
			public String guInfoList(Model model,@PathVariable int areaGu){
				int areaId = travelInfoService.guInfo(areaGu).get(0).getAreaGu().getArea().getId();
				
				List<GuInfo> guInfoList = travelInfoService.guInfo(areaGu);
				List<Restaurant> restaurantList = travelInfoService.guInfoRestaurant(areaGu);
				List<Area> areaImageList = travelInfoService.areaImage(areaId);
				System.out.println(restaurantList.size() + " @@@@@@@");
				model.addAttribute("guInfoList",guInfoList);
				model.addAttribute("restaurantList",restaurantList);
				model.addAttribute("areaImageList",areaImageList);
				return "/travelInfo/goinfo_form";
			}
			
// ===================================================================================================
			
			// 만약 여기서 swich를  쓰면? 
			// 
			
			
			
			// 식당 상세정보
			@GetMapping("/travel_detail/{id}")
			public String getDetailRestaurant(Model model, @PathVariable int id) {
					List<Restaurant> restaurantList = travelInfoService.findByIdRestaurant(id);
					
					model.addAttribute("restaurant",restaurantList);
				return "/travelInfo/detail_restaurant_form";
			}
			
			// 구 상세정보
			@GetMapping("/travel_detail/gu/{id}")
			public String getDetailGu(Model model, @PathVariable int id) {
					List<GuInfo> guInfoFindById = travelInfoService.findByGuinfoId(id);
					List<Restaurant> restaurantList = travelInfoService.findByIdRestaurant(id);
					model.addAttribute("gu",guInfoFindById);
					model.addAttribute("restaurant",restaurantList);
				
				return "/travelInfo/detail_gu_form";
			}
	
	
				


//===================================================================================================

		@GetMapping("/travel/areainfo/{id}")
		public String areaInfo(Model model,@PathVariable int id) {
			List<Area> areaImageList = travelInfoService.areaImage(id);
			
			
			List<AreaGu> areaGuAllList = travelInfoService.areaGu(id);
			List<GuInfo>guinfoAllList = travelInfoService.guInfo(id);
			List<Restaurant> restaurantAllList = travelInfoService.guInfoRestaurant(id);
			model.addAttribute("areaImage" ,areaImageList);
			model.addAttribute("areaGu" ,areaGuAllList);
			model.addAttribute("guinfo" ,guinfoAllList);
			model.addAttribute("restaurant" ,restaurantAllList);
			return "/travelInfo/area_info_form";
		}
}	
//===================================================================================================
				// stream 
				// List 데이터를 변경할 때 map 함수 , 필터 - filter , sort()
				
				
				//List<AreaGu> arealist = travelInfoService.areaIdList(areaid, pageable);
				//model.addAttribute("arealist",arealist);
//				arealist.stream().sorted(Comparator.comparing(AreaGu::getId).reversed());
				
//				model.addAttribute(arealist);
				
				
//				List<Integer> stream = arealist.stream().map(t -> t.getArea().getId()).collect(Collectors.toList());
//				stream.forEach(t ->{
//				});
				
//				map<String, ArrayList> {				
//					"서울" : [0, 1]
// 				}		
				
//				List<AreaGu> test = arealist.stream().filter(t -> t.getArea().getId() == 1).collect(Collectors.toList());
//				for(AreaGu areaGu : arealist) {
//					System.out.println(areaGu.getArea().getId() == 2);
//				}
				
//				    List<Human> tmpHumans = humans.stream()
//				            .filter(h -> h.getMoney() > 2000)
//				            .collect(Collectors.toList());
//
//				    for (Human human : tmpHumans) {
//				        System.out.println(human.getIdx());
//				}
				
				// stream . map 
				// stream . filter 							
				
//				if(id == 1) {
//					AreaGu[] seoulList = {arealist.get(0), arealist.get(1)};
//					model.addAttribute("seoulList", seoulList);
//				}else if(id == 2) {				
//					AreaGu[] busanList = {arealist.get(2), arealist.get(3)};
//					model.addAttribute("busanList", busanList);
//				}else if(id == 3) {			
//					AreaGu[] inchunList = {arealist.get(4), arealist.get(5)};
//					model.addAttribute("inchunList", inchunList);
//				}else if(id == 4) {			
//					AreaGu[] jejuList = {arealist.get(10), arealist.get(11)};
//					model.addAttribute("inchunList", jejuList);
//				}else {
	
//				}
				
				
//					List<AreaGu> seoulList = travelInfoService.seoul();
//					model.addAttribute("seoulList");
//					
//					List<AreaGu> busanList = travelInfoService.busan();
//					model.addAttribute("busanList", busanList);
//					
//					List<AreaGu> jejuList = travelInfoService.jeju();
//					model.addAttribute("jejuList", jejuList);
//					
//					List<AreaGu> deaguList = travelInfoService.deagu();
//					model.addAttribute("deaguList", deaguList);
//					
//					List<AreaGu> inchunList = travelInfoService.inchun();
//					model.addAttribute("inchunList", inchunList);	
//				
				

//					private Stream<AreaGu> map(Area area) {
//						// TODO Auto-generated method stub
//						return null;
//					}
				
			
			
			

		
			
			

			
		
			

			