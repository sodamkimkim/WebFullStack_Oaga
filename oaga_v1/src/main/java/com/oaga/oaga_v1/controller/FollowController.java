package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.service.FollowService;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.Follow;
import com.oaga.oaga_v1.userModel.User;

@Controller
public class FollowController {
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private FollowService followService;
	
	@GetMapping("/mytraveler")
	private String myTraveler(Model model, @AuthenticationPrincipal PrincipalDetail detail) {
		// 이번 달 좋아요 많이 받은 순서대로 조회
		List<User> bestUser = UserService.bestUser();
		// 내가 좋아요한 회원 조회
		List<Follow> followingList = followService.findByFollowingUser(detail.getUser());
		
		model.addAttribute("bestUserList", bestUser);
		model.addAttribute("followingList", followingList);
		return "mytraveler";
	}
	

}
