package com.oaga.oaga_v1.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.repository.UserRepository;
import com.oaga.oaga_v1.userModel.User;

@Service
public class PrincipalDetailService implements UserDetailsService {
	
	@Autowired
	UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		User principal = userRepository.findByUsername(username)
				.orElseThrow(() -> {
					return new UsernameNotFoundException("해당 유저아이디를 찾을 수 없습니다.");
				});
		System.out.println("principal찍어봄: "+principal.toString());
		return new PrincipalDetail(principal); // security session에 유저정보 저장.
	}
}
