package com.oaga.oaga_v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oaga.oaga_v1.dto.RequestUserProfileDto;
import com.oaga.oaga_v1.repository.UserRepository;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.RoleType;

@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/auth/adminJoinPage")
	public String adminJoinForm() {
		return "admin/admin_Join_form";
	}
	
	
	
	@PostMapping("/auth/adminJoin")
	public String adminJoin(RequestUserProfileDto dto) {
		dto.setRole(RoleType.ADMIN);
		System.out.println(dto.getRole() + "@@@@@ROLE@@@@");
		System.out.println("여기를 안들어오나?????");
	int result = userService.adminJoin(dto);
	
	return "redirect:/";
    }
}
