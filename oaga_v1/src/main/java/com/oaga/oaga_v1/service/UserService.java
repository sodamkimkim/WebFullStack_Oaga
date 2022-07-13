package com.oaga.oaga_v1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.repository.UserRepository;
import com.oaga.oaga_v1.userModel.RoleType;
import com.oaga.oaga_v1.userModel.User;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public int saveUser(User user) {
		try {
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			user.setPassword(encPassword);
			user.setRole(RoleType.USER);
			userRepository.save(user);
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	
	@Transactional
	public void updateUser(User user) {
		// 소셜유저 수정들어오면 무시
		// 기존회원 수정들어오면 처리
		User userEntity = userRepository.findById(user.getId())
				.orElseThrow(() -> {
					return new IllegalArgumentException("회원정보가 없습니다.");
				});
		// 해시암호 처리
		if(userEntity.getOauth()==null||userEntity.getOauth()=="") {
			String rawPassword = user.getPassword();
			String hashPassword = encoder.encode(rawPassword);
			userEntity.setPassword(hashPassword);
			userEntity.setEmail(user.getEmail());
		}
	}
	@Transactional(readOnly = true)
	public User searchUser(String username) {
		User userEntity = userRepository.findByUsername(username).orElseGet(()->{
			System.out.println("유저 못찾음 여긴userservice");
			return new User();
		});
		System.out.println("여긴 userservice");

		return userEntity;
	}
}
