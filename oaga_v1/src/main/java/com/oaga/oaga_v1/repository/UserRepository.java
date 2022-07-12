package com.oaga.oaga_v1.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.userModel.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	Optional<User> findByuserInputID(String userInputID);
}
