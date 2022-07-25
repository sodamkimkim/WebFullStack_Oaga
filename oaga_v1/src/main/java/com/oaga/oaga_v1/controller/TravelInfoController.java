package com.oaga.oaga_v1.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.GuInfo;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.service.TravelInfoService;

@Controller
public class TravelInfoController {

	@Autowired
	TravelInfoService travelInfoService;

	// 여행지 정보 보기 페이지
	@GetMapping({ "/travel_info" })
	public String index(Model model) {
		Map<Integer, List<AreaGu>> map = travelInfoService.areaIdList();
		ArrayList<List<AreaGu>> list = new ArrayList<>();
		for (int i = 0; i < 18; i++) {
			list.add(i, map.get(i + 1));
		}
		model.addAttribute("lists", list);
		
		return "/travelInfo/home";
	}


	// gu에 대한 정보 페이지
	@GetMapping({ "/travel_guinfo/{areaGu}" })
	public String guInfoList(Model model, @PathVariable int areaGu) {
		
		List<AreaGu> guInfoImage = travelInfoService.findByid_image(areaGu);
		List<GuInfo> guInfoList = travelInfoService.guInfo(areaGu);
		List<Restaurant> restaurantList = travelInfoService.guInfoRestaurant(areaGu);
		model.addAttribute("guInfoList", guInfoList);
		model.addAttribute("guInfoImage", guInfoImage);
		model.addAttribute("restaurantList", restaurantList);
		
		return "/travelInfo/guinfo_form";
	}


	// 식당 상세정보
	@GetMapping("/travel_detail/{id}")
	public String getDetailRestaurant(Model model, @PathVariable int id) {
		int areaGu = travelInfoService.findByIdRestaurant(id).get(0).getAreaGu().getId();
		List<Restaurant> restaurantList = travelInfoService.findByIdRestaurant(id);
		List<Restaurant> guRestaurantListAll = travelInfoService.remainderRestaurant(areaGu, id);
		model.addAttribute("restaurant", restaurantList);
		model.addAttribute("guRestaurantListAll", guRestaurantListAll);

		return "/travelInfo/detail_restaurant_form";
	}

	// 구 상세정보
	@GetMapping("/travel_detail/gu/{id}")
	public String getDetailGu(Model model, @PathVariable int id) {

		int areaGu = travelInfoService.findByGuinfoId(id).get(0).getAreaGu().getId();
		List<GuInfo> guInfoFindById = travelInfoService.findByGuinfoId(id);
		List<Restaurant> guRestaurantListAll = travelInfoService.guInfoRestaurant(areaGu);
		model.addAttribute("gu", guInfoFindById);
		model.addAttribute("guRestaurantListAll", guRestaurantListAll);

		return "/travelInfo/detail_gu_form";
	}

	// Area에 모든 정보
	@GetMapping("/travel/areainfo/{id}")
	public String areaInfo(Model model, @PathVariable int id) {
		List<Area> areaImageList = travelInfoService.areaImage(id);
		List<AreaGu> areaGuAllList = travelInfoService.areaGu(id);
		int areaGuId = travelInfoService.areaImage(id).get(0).getId();
		List<GuInfo> guinfoAllList = travelInfoService.findByAreaGuId(areaGuId);
		List<Restaurant> restaurantAllList = travelInfoService.findByGuInfoId(areaGuId);

		model.addAttribute("areaImage", areaImageList);
		model.addAttribute("areaGu", areaGuAllList);
		model.addAttribute("guinfo", guinfoAllList);
		model.addAttribute("restaurant", restaurantAllList);
		return "/travelInfo/area_info_form";
	}
}
