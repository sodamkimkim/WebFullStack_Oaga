package com.oaga.oaga_v1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.repository.FollowRepository;
import com.oaga.oaga_v1.repository.UserRepository;
import com.oaga.oaga_v1.userModel.Follow;
import com.oaga.oaga_v1.userModel.User;

@Service
public class FollowService {
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private FollowRepository followRepository;
	
	// 팔로우 정보를 저장
	public Follow saveFollow(int followingUserId, int followedUserId) {
		
		User toUser = userRepository.findById(followingUserId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 사용자는 찾을 수 없습니다.");
		});
		
		User fromUser = userRepository.findById(followedUserId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 사용자는 찾을 수 없습니다.");
		}); 
		
		Follow follow = followRepository.save(Follow.builder().followingUser(toUser).followedUser(fromUser).build());
		return follow;
	}
	
	// 팔로우 취소 
	// 팔로우 정보를 찾아보고 존재하면 정보 삭제
	public int checkFollowInfo(int followingUserId, int followedUserId) {
		User followingUser = userRepository.findById(followingUserId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 사용자는 찾을 수 없습니다.");
		});
		
		User followedUser = userRepository.findById(followedUserId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 사용자는 찾을 수 없습니다.");
		});
		
		Follow follow = followRepository.findByFollowedUserIdAndFollowingUserId(followedUser, followingUser);
		
		if(follow != null) {
			return 1;
		} else {
			return -1;
		}
	}
	
	
}
