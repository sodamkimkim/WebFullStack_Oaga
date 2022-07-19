package com.oaga.oaga_v1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.userModel.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	Optional<User> findByUsername(String username);
	
	@Query(value = "SELECT * FROM user ORDER BY likes DESC LIMIT 5;", nativeQuery = true)
	List<User> bestUser();
	
}
