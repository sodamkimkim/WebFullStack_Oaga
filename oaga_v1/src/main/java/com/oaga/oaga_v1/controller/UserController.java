package com.oaga.oaga_v1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/login_form")
	public String loginForm() {
		return "user/login_form";
	}
}
