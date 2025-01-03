package com.oaga.oaga_v1.controller;

import java.util.ArrayList;
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
import com.oaga.oaga_v1.placeModel.HotPlace;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.service.AdminService;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.RoleType;
import com.oaga.oaga_v1.userModel.User;

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
	
	@GetMapping("/admin/hotplace_save_page")
	public String adminPage(Model model) {
		List<Area> area = adminService.areaAll();
		model.addAttribute("areaList", area);
		return "admin/admin_hotplace_index";
	}
	// 수정 페이지

	@GetMapping("/admin/updatepage")
	private String adminUpdateForm(Model model) {
		List<Area> area = adminService.areaAll();
		model.addAttribute("areaList", area);
		return "/admin/hotplace_update_form";
	}

	// 레드토랑 수정 페이지
	@GetMapping("/admin/restaurant_updatepage")
	private String adminRestaurantUpdateForm(Model model) {
		List<Area> area = adminService.areaAll();
		model.addAttribute("areaList", area);
		return "/admin/restaurant_update";
	}
	
	@PostMapping("/api/admin/hotplace/infoSave")
	public String hotplaceSave(RequestTravelDto dto) {
		dto.setCategoryType(CategoryType.GUINFO);
		adminService.saveGuInfo(dto);
		return "redirect:/admin/admin_mainpage";

	}


	// 삭제할 레스토랑 검색
	@GetMapping({ "/admin/restaurantDeletepage", "/admin/srch/restaurant" })
	public String srchRestaurant(String srchtitle, Model model,
			@PageableDefault(size = 10, sort = "name", direction = Direction.ASC) Pageable pageable) {
		String searchTitle = srchtitle == null ? "" : srchtitle;
		Page<Restaurant> srchResult = adminService.searchRestaurantByTitle(searchTitle, pageable);
		int nowPage = srchResult.getPageable().getPageNumber() +1;
		int startPage = Math.max(nowPage-2, 1);
		int endPage = Math.min(nowPage+2, srchResult.getTotalPages());
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for(int i = startPage; i<=endPage; i++) {
			pageNumbers.add(i);
		}
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("resultList", srchResult);
		model.addAttribute("pageNumbers", pageNumbers);
		
		
		return "admin/admin_delete_form";
	}
	
	// 삭제할 놀거리 검색
	@GetMapping("/admin/playDeletepage")
	public String srchGuInfo(String srchtitle,@PageableDefault(size = 10, sort = "name", direction = Direction.DESC)Pageable pageable, Model model) {
		String searchTitle = srchtitle == null ? "" : srchtitle;

		Page<HotPlace> playList = adminService.findBySearchTitle(pageable, searchTitle);
		int nowPage = playList.getPageable().getPageNumber() +1;
		int startPage = Math.max(nowPage-2, 1);
		int endPage = Math.min(nowPage+2, playList.getTotalPages());
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for(int i = startPage; i<=endPage; i++) {
			pageNumbers.add(i);
		}
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("resultList", playList);
		return "admin/admin_playDelete_form";
	}

	@PostMapping("/admin/restaurant/infoSave")
	public String restaurantSave(RequestRestaurantDto dto) {
		dto.setCategoryType(CategoryType.RESTAURANT);
		adminService.saveRestaurant(dto);
		return "redirect:/admin/admin_mainpage";
	}
	
	// 회원 관리 페이지
	@GetMapping("/admin/user")
	private String adminUserForm(String searchName, @PageableDefault(size = 12, sort = "id", direction = Direction.ASC)Pageable pageable, Model model) {
		// 회원 정보 전체 / 검색
		String name = searchName == null ? "" : searchName;
		// 서비스 요청
		Page<User> userList = adminService.searchUser(name, pageable);
		int nowPage = userList.getPageable().getPageNumber() +1; // 
		int startPage = Math.max(nowPage -2, 1);
		int endPage = Math.min(nowPage + 2, userList.getTotalPages()); //1
		
		System.out.println("nowPage : " + nowPage);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);
		
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for(int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}
		System.out.println("pageNumbers : " + pageNumbers);
		model.addAttribute("userList", userList);
		model.addAttribute("pageNumbers", pageNumbers);
		System.out.println("userList : " + userList);
		return "admin/admin_delete_user";
	}

// ===================================================================== 수정
	@PostMapping("/api/admin/hotplace/update/{id}")// 수정하기
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
	@GetMapping("/admin/report_management_form")
	public String reportManagementForm() {
			return "/admin/admin_reportmanagement_form";
	}
	
// ===================================================================== 수정	 끝
}
