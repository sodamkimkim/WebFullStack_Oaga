package com.oaga.oaga_v1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
		
	@GetMapping("/admin/index")
	public String adminPage() {
		return "/admin/admin_index";
	}
}
