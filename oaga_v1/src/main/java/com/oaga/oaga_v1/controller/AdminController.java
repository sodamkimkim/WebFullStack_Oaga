package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.oaga.oaga_v1.dto.RequestUserProfileDto;
import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
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
		System.out.println(area + "@@@@@@@@@@@@@");
		
		
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
	
	
	
	
	@PostMapping("/api/admin/areaId/{id}")
	public String areaListAll(Model model,  @PathVariable int id) {
		List<AreaGu> areaGu = adminService.areaGuAll(id);
		model.addAttribute("areaGuList",areaGu);
			
		return "";
	}
	
	
	
	
	
}
