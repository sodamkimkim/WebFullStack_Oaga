package com.oaga.oaga_v1.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.userModel.Follow;
import com.oaga.oaga_v1.userModel.User;

public interface FollowRepository extends JpaRepository<Follow, Integer>{
	
	Optional<Follow> findByFollowedUserAndFollowingUser(User FollowedUser, User FollowingUser);
	
}
