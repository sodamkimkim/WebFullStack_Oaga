package com.oaga.oaga_v1.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.HotPlace;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.repository.HotPlaceRepository;
import com.oaga.oaga_v1.service.AdminService;
import com.oaga.oaga_v1.userModel.User;

@RestController
public class AdminApiController {

	@Autowired
	private AdminService adminService;
	
	

	@GetMapping("/api/admin/areaId/{id}")
	public ResponseDto<List<AreaGu>> areaListAll(Model model, @PathVariable int id) {
		List<AreaGu> areaGu = adminService.areaGuAll(id);

		model.addAttribute("areaGuList", areaGu);

		return new ResponseDto<>(HttpStatus.OK, areaGu);
	}

	@GetMapping("/api/admin/areaIdGu/{id}")
	public ResponseDto<List<AreaGu>> restaurantSave(@PathVariable int id, Model model) {

		List<AreaGu> areaGuList = adminService.areaGuNmae(id);
		
		model.addAttribute("areaGuName",areaGuList);
		
		return new ResponseDto<>(HttpStatus.OK, areaGuList);
	}
	
	// ==========================================================
	@GetMapping("/api/admin/hotplace_update/{areaguid}")
	public ResponseDto<List<HotPlace>> guinfoUpdateList(@PathVariable int areaguid, Model model){
		
		List<HotPlace> hotplceList = adminService.findAreaGuId(areaguid);

		model.addAttribute("hotplceList",hotplceList);
		
		return new ResponseDto<>(HttpStatus.OK, hotplceList);
	}
	// ==========================================================	
	
	@GetMapping("/api/admin/restaurantUpdate/{areaguid}")
	public ResponseDto<List<Restaurant>> restaurantUpdateList(@PathVariable int areaguid, Model model){
		List<Restaurant> restaurantList = adminService.findAreaGuId2(areaguid);

		model.addAttribute("restaurantList",restaurantList);
		
		return new ResponseDto<>(HttpStatus.OK, restaurantList);
	}
	
	
	@GetMapping("/api/admin/hotplace_info/{hotplace}") // 구인포리스트 클릭했을때 어펜드 하기 위해
	public ResponseDto<List<HotPlace>> guinfoupdatefindid(@PathVariable int hotplace, Model model){
		
		List<HotPlace> guinfo_info = adminService.findHotplaceId(hotplace);
		model.addAttribute("guinfo_info",guinfo_info);
		
		return new ResponseDto<>(HttpStatus.OK, guinfo_info);
	}
	
	@GetMapping("/api/admin/restaurant_info/{restaurant}") // 레스토랑 클릭했을때 어펜드 하기 위해
	public ResponseDto<List<Restaurant>> restaurantupdatefindid(@PathVariable int restaurant, Model model){
		
		List<Restaurant> restaurant_info = adminService.findRestaurant(restaurant);
		model.addAttribute("restaurant_info",restaurant_info);
		
		return new ResponseDto<>(HttpStatus.OK, restaurant_info);
	}
	

	@DeleteMapping("/admin/deleterestaurant/{id}")
	public ResponseDto<Integer> deleteRestaurantById(@PathVariable int id) {
		adminService.deleteRestaurantById(id);
		return new ResponseDto<Integer>(HttpStatus.OK, 1);
	}
	
	// 회원 삭제
	@DeleteMapping("/admin/deleteUser/{userId}")
	public ResponseDto<Integer> deleteUserById(@PathVariable int userId){
		// 서비스 요청
		adminService.deleteUser(userId);
		return new ResponseDto<>(HttpStatus.OK, 1);
	}
	
	// oauth별로 조회
	@GetMapping("/admin/getUser/{oauth}")
	private ResponseDto<Page<User>> getNomalUserList(@PageableDefault(size = 12, sort = "id", direction = Direction.ASC)Pageable pageable, @PathVariable String oauth) {
		// 서비스 요청
		System.out.println(adminService.findByUserOauth(pageable, oauth));
		return new ResponseDto<>(HttpStatus.OK, adminService.findByUserOauth(pageable, oauth));
	}
	
	// 놀거리 정보 삭제
	@DeleteMapping("/api/admin/deletePlay/{id}")
	private ResponseDto<Integer> deletePlayById(@PathVariable int id) {
		adminService.deletePlay(id);
		return new ResponseDto<>(HttpStatus.OK, 1);
	}


}
