package com.oaga.oaga_v1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.oaga.oaga_v1.dto.RequestRestaurantDto;
import com.oaga.oaga_v1.dto.RequestTravelDto;
import com.oaga.oaga_v1.dto.RequestUpdateHotplaceDto;
import com.oaga.oaga_v1.dto.RequestUpdateRestaurantDto;
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

	@GetMapping("/admin/admin_mainpage")
	public String adminMaibForm() {
		return "admin/admin_main_home";
	}
	
	@GetMapping("/admin/admin_login_form")
	public String loginForm() {
		return "admin/admin_login_form";
	}
	
	@GetMapping("/auth/admin_logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return "redirect:/admin/admin_mainpage";
	}

	
	@GetMapping("/admin/restaurant_save_page")
	public String adminrestaurantPage(Model model) {
		List<Area> area = adminService.areaAll();
		model.addAttribute("areaList", area);
		return "admin/admin_restaurant_index";

	}

	@GetMapping("/auth/admin_join_page")
	public String adminJoinForm() {
		return "admin/admin_Join_form";
	}

	@PostMapping("/auth/admin_join")
	public String adminJoin(RequestUserProfileDto dto) {
		dto.setRole(RoleType.ADMIN);
		int result = userService.adminJoin(dto);
		return "redirect:/admin/admin_mainpage ";
	}
// ===================================================================
	
	@GetMapping("/admin/guinfo_save_page")
	public String adminPage(Model model) {
		List<Area> area = adminService.areaAll();
		model.addAttribute("areaList", area);
		return "admin/admin_guinfo_index";
	}
	// 수정 페이지

	@GetMapping("/admin/updatepage")
	private String adminUpdateForm(Model model) {
		List<Area> area = adminService.areaAll();
		model.addAttribute("areaList", area);
		return "/admin/update";
	}

	// 레드토랑 수정 페이지
	@GetMapping("/admin/restaurant_updatepage")
	private String adminRestaurantUpdateForm(Model model) {
		List<Area> area = adminService.areaAll();
		model.addAttribute("areaList", area);
		return "/admin/restaurant_update";
	}
	
	@PostMapping("/api/admin/guinfo/infoSave")
	public String guinfoSave(RequestTravelDto dto) {
		dto.setCategoryType(CategoryType.GUINFO);
		adminService.saveGuInfo(dto);
		return "redirect:/admin/admin_mainpage";

	}

//	@GetMapping({"/admin/deletepage","/oaga/admin/srch_deleterestaurant"})
//	public String adminDeletepage() {
//		return "admin/admin_delete_form";
//	}

	// 삭제할 레스토랑 검색
	@GetMapping({ "/admin/deletepage", "/admin/srch_deleterestaurant" })
	public String srchRestaurant(String srchtitle, Model model,
			@PageableDefault(size = 10, sort = "name", direction = Direction.ASC) Pageable pageable) {
		String searchTitle = srchtitle == null ? "" : srchtitle;
		model.addAttribute("searchTitle", searchTitle);
		Page<Restaurant> srchResult = adminService.searchRestaurantByTitle(searchTitle, pageable);
		model.addAttribute("restaurants", srchResult);
		return "admin/admin_delete_form";
	}

	@PostMapping("/admin/restaurant/infoSave")
	public String restaurantSave(RequestRestaurantDto dto) {
		dto.setCategoryType(CategoryType.RESTAURANT);
		adminService.saveRestaurant(dto);
		return "redirect:/admin/admin_mainpage";
	}

// ===================================================================== 수정
	@PostMapping("/api/admin/guinfo/update/{id}")// 수정하기
	public String updateGuInfo(RequestUpdateHotplaceDto dto, @PathVariable int id) {
		adminService.updateGuInfo(dto, id);
		return "redirect:/admin/admin_mainpage";
	}
	@PostMapping("/api/admin/restaurant/update/{id}")// 수정하기
	public String updateRestaurant(RequestUpdateRestaurantDto dto, @PathVariable int id) {
		System.out.println(dto + "api");
		System.out.println(id + "api");
		adminService.updateRestaurant(dto, id);
		
		return "redirect:/admin/admin_mainpage";
	}
// ===================================================================== 수정	 끝
}
