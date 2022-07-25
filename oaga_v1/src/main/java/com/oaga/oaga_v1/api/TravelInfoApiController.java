package com.oaga.oaga_v1.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.service.TravelInfoService;

@RestController
public class TravelInfoApiController {

	@Autowired
	private TravelInfoService infoService;
//	
//	@PostMapping("/api/getAreaId")
//	public ResponseDto<Integer> test( @RequestBody AreaGu areaGu){
//		infoService.test();
//		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
//	}

	// 여행지 정보 검색
	@GetMapping("/api/searchArea/{searchArea}")
	public ResponseDto<List<Area>> searchArea(@PathVariable String searchArea) {
		List<Area> result = infoService.findAreaByTitle(searchArea);
		return new ResponseDto<>(HttpStatus.OK, result);
	}

	@PostMapping("/ajax/autocomplete.do")
	public Map<String, Object> autocomplete(@RequestParam Map<String, Object> paramMap) throws Exception {
		String area = paramMap.get("value").toString();
		List<Area> resultList = infoService.findAreaByTitle(area);
		paramMap.put("resultList", resultList);
		return paramMap;
	}
	
//	@PostMapping("/ajax/admindelete_autocomplete.do")
//	public Map<String, Object> adminDeleteAutoComplete(@RequestParam Map<String, Object> paramMap) throws Exception{
//		System.out.println("@ adminDelete autocomplete in TInfoController");
//		String restaurant = paramMap.get("value").toString();
//		System.out.println("?????????????"+restaurant);
////		select * from restaurant where name like '%?%' 
//		List<Restaurant> restaurantList = infoService.findRestaurantByName(restaurant);
//		System.out.println(restaurantList);
//		paramMap.put("restaurantList", restaurantList);
//		return paramMap;
//	}

}
