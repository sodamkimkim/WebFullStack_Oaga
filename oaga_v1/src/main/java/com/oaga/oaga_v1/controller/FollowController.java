package com.oaga.oaga_v1.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.reviewModel.Review;
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
	private String myTraveler(Model model, @AuthenticationPrincipal PrincipalDetail detail, @PageableDefault(size = 6, sort = "createDate", direction = Direction.DESC)Pageable pageable) {
		List<User> bestUser = UserService.bestUser();
		List<Follow> followingList = followService.findByFollowingUser(detail.getUser());
		ArrayList<Integer> userIds = new ArrayList<>();
		for(int i = 0; i < followingList.size(); i++) {
			userIds.add(followingList.get(i).getFollowedUser().getId());
		}
		Page<Review> reviewList = followService.findByUserIdIn(pageable, userIds);
		model.addAttribute("bestUserList", bestUser);
		model.addAttribute("followingList", followingList);
		model.addAttribute("reviewList", reviewList);
		return "mytraveler";
	}
	

}
