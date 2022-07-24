package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oaga.oaga_v1.dto.RequestTravelDto;
import com.oaga.oaga_v1.dto.RequestUserProfileDto;
import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.CategoryType;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.service.AdminService;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.RoleType;

@Controller
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private AdminService adminService;

	@GetMapping("/admin/page")
	public String adminPage(Model model) {

		List<Area> area = adminService.areaAll();
		model.addAttribute("areaList", area);

		return "admin/admin_index";
	}

	@GetMapping("/auth/admin_join_page")
	public String adminJoinForm() {
		return "admin/admin_Join_form";
	}

	@PostMapping("/auth/admin_join")
	public String adminJoin(RequestUserProfileDto dto) {
		dto.setRole(RoleType.ADMIN);
		int result = userService.adminJoin(dto);
		return "redirect:/";
	}

	// 수정 페이지
	@GetMapping("/admin/updatepage")
	private String adminUpdateForm() {
		return "/admin/update";
	}

	@PostMapping("/api/damin/guinfo/infoSave")
	public String restaurantSave(RequestTravelDto dto) {
		dto.setCategoryType(CategoryType.GUINFO);
		System.out.println("가나다");
		adminService.saveGuInfo(dto);
		return "redirect:/";

	}

//	@GetMapping({"/admin/deletepage","/oaga/admin/srch_deleterestaurant"})
//	public String adminDeletepage() {
//		return "admin/admin_delete_form";
//	}

	// 삭제할 레스토랑 검색
	@GetMapping({"/admin/deletepage","/admin/srch_deleterestaurant"})
	public String srchRestaurant(String srchtitle, Model model,
			@PageableDefault(size = 10, sort = "name", direction = Direction.ASC) Pageable pageable) {
		String searchTitle = srchtitle == null ? "" : srchtitle;
		model.addAttribute("searchTitle", searchTitle);
		Page<Restaurant> srchResult = adminService.searchRestaurantByTitle(searchTitle, pageable);
		model.addAttribute("restaurants", srchResult);
		System.out.println("srchResult in adminController : " + srchResult.toString());
		return "admin/admin_delete_form";
	}

}
