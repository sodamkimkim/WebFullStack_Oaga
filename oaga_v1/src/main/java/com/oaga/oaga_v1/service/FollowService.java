package com.oaga.oaga_v1.service;

import javax.transaction.Transactional;

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
	@Transactional
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
	
	
	// 팔로우 정보를 찾아보고 존재하면 정보 삭제
	@Transactional
	public int checkFollowInfo(int followingUserId, int followedUserId) {
		User followingUser = userRepository.findById(followingUserId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 사용자는 찾을 수 없습니다.");
		});
		
		User followedUser = userRepository.findById(followedUserId).orElseThrow(() -> {
			return new IllegalArgumentException("해당 사용자는 찾을 수 없습니다.");
		});
		
		Follow follow = followRepository.findByFollowedUserAndFollowingUser(followedUser, followingUser).orElse(null);
		
		if(follow != null) {
			return follow.getId();
		} else {
			return -1;
		}
	}
	
	// 팔로우 취소 
	public void unFollow() {
		
	}
	
	
}