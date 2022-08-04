package com.oaga.oaga_v1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.userModel.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	Optional<User> findByUsername(String username);
	
	@Query(value = "SELECT * FROM user ORDER BY likes DESC LIMIT 5;", nativeQuery = true)
	List<User> bestUser();
	
	@Query(value = "select * from user where username = ?;", nativeQuery = true)
	List<User> mFindUsername(String username);
	
	Page<User> findByUserNickNameContaining(Pageable pageable, String NickName);
	
	@Query(value = "SELECT * FROM user WHERE userNickName LIKE %?% AND role = 'USER' ", nativeQuery = true)
	Page<User> findByUserNickName(Pageable pageable, String userNickName);
	
	Page<User> findByOauth(Pageable pageable, String oauth);
	
}
