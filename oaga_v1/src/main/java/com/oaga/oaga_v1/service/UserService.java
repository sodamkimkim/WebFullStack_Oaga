package com.oaga.oaga_v1.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.dto.RequestReviewFileDto;
import com.oaga.oaga_v1.dto.RequestUserProfileDto;
import com.oaga.oaga_v1.repository.UserRepository;
import com.oaga.oaga_v1.userModel.RoleType;
import com.oaga.oaga_v1.userModel.User;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Value("${file.path}")
	private String uploadFolder;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	// 확장자 추출
	private String extracktExt(String originalFileName) {
		int pos = originalFileName.lastIndexOf(".");
		return originalFileName.substring(pos + 1);
	}
	
	
	@Transactional
	public int saveUser(RequestUserProfileDto dto) {
		try {

			String rawPassword = dto.getPassword();
			String encPassword = encoder.encode(rawPassword);
			dto.setPassword(encPassword);
			dto.setRole(RoleType.USER);
			UUID uuid = UUID.randomUUID();
			String imageFileName = uuid.toString() + "." +extracktExt(dto.getFile().getOriginalFilename());
			String newFileName = (imageFileName.trim()).replaceAll("\\s", "");//공백(\\s)없애기.
			System.out.println("파일 명: " + newFileName);
			
			//서버컴퓨터 path가져오기
			Path userProfileFilePath = Paths.get(uploadFolder + newFileName);
			System.out.println("전체 파일 경로 + 파일 명 : " + userProfileFilePath);
			
			try {
				Files.write(userProfileFilePath, dto.getFile().getBytes());
				userRepository.save(dto.toEntity(newFileName));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}

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
			userEntity.setUserNickName(user.getUserNickName());
		}
	}
	@Transactional(readOnly = true)
	public User searchUser(String username) {
		User userEntity = userRepository.findByUsername(username).orElseGet(()->{
			return new User();
		});

		return userEntity;
	}
	
	// 베스트 리뷰어
	public List<User> bestUser() {
		return userRepository.bestUser();
	}
}
