package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oaga.oaga_v1.dto.RequestTravelDto;
import com.oaga.oaga_v1.dto.RequestUserProfileDto;
import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.CategoryType;
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
		model.addAttribute("areaList",area);
		
		
		
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
	public String restaurantSave(RequestTravelDto dto){
		dto.setCategoryType(CategoryType.GUINFO);
		System.out.println("가나다");
		adminService.saveGuInfo(dto);
		return "redirect:/";
	
	}
	
	


	@GetMapping("/admin/deletepage")
	public String adminDeletepage() {
		return "admin/admin_delete_form";
	}
	


	
	
	
	
	
}
