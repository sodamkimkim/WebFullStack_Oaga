package com.oaga.oaga_v1.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.repository.FollowRepository;
import com.oaga.oaga_v1.service.FollowService;
import com.oaga.oaga_v1.userModel.Follow;

@RestController
public class FollowApiController {
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private FollowRepository followRepository;
	
	
	
	// 팔로우 정보를 저장
	@PostMapping("/api/follow/{followedUserId}")
	private Follow followUser(@PathVariable int followedUserId, @AuthenticationPrincipal PrincipalDetail detail) {
		return followService.saveFollow(detail.getUser().getId(), followedUserId);
	}
	
	
	// 팔로우 취소
	@DeleteMapping("/api/follow/{followedUserId}")
	private void unFollowUser(@PathVariable int followedUserId, @AuthenticationPrincipal PrincipalDetail detail) {
		int result = followService.checkFollowInfo(detail.getUser().getId(), followedUserId);
		followService.deleteByFollowId(result, followedUserId);
	}
	

}
