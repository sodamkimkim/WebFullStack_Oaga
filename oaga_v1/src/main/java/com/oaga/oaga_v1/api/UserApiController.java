package com.oaga.oaga_v1.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.User;

@RestController
public class UserApiController {
	@Autowired
	private UserService userService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@PutMapping("/api/myinfoupdate")
	public ResponseDto<Integer> updateUserInfo(@RequestBody User user) {
		userService.updateUserInfo(user);
		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return new ResponseDto<Integer>(HttpStatus.OK, 1);
	}

	@PutMapping("/api/userprofileupdate")
	public ResponseDto<Integer> updateMyProfile(@AuthenticationPrincipal PrincipalDetail detail,
			@RequestBody MultipartFile file) {
		userService.updateUserProfile(detail.getUser().getId(), file);
//		User userEntity = userService.searchUserById(detail.getUser().getId());
//		Authentication authentication = authenticationManager
//				.authenticate(new UsernamePasswordAuthenticationToken(userEntity.getUsername(), userEntity.getPassword()));
//		SecurityContextHolder.getContext().setAuthentication(authentication);
		return new ResponseDto<Integer>(HttpStatus.OK, 1);

	}

}
