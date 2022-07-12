package com.oaga.oaga_v1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.User;

@Controller
public class UserController {
	
	@Value("${oaga.key}")
	private String oagaKey;
	
	@Autowired
	AuthenticationManager authenticationManager;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}
	
	@GetMapping("/auth/join_form")
	public String joinForm() {
		return "user/join_form";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
			
		}
		return "redirect:/";
	}
	
	// TODO update_form 만들어줄 것
	@GetMapping("/user/update_form")
	public String updateForm() {
		return "user/update_form";
	}
	
	@PostMapping("/auth/joinProc")
	public String save(User user) {
		System.out.println("save 들어옴");
		int result = userService.saveUser(user);
		return "redirect:/";
	}
	
	//TODO 소셜로그인
}
