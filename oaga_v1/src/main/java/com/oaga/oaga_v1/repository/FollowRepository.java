package com.oaga.oaga_v1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.userModel.Follow;
import com.oaga.oaga_v1.userModel.User;

public interface FollowRepository extends JpaRepository<Follow, Integer>{
	
	Optional<Follow> findByFollowedUserAndFollowingUser(User FollowedUser, User FollowingUser);
	
	Optional<List<Follow>> findByFollowedUser(User followedUser);
	
	Optional<List<Follow>> findByFollowingUser(User followingUser);
	
}
