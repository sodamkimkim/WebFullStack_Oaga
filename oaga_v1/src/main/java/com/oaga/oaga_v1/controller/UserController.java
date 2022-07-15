package com.oaga.oaga_v1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.oaga.oaga_v1.dto.KakaoProfile;
import com.oaga.oaga_v1.dto.KakaoProfile.KakaoAccount;
import com.oaga.oaga_v1.dto.OAuthToken;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.User;

@Controller
public class UserController {

	@Value("${oaga.key}")
	private String oagaKey;

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private UserService userService;

	@GetMapping("/auth/login_form")
	public String loginForm() {
		return "user/login_form";
	}

	@GetMapping("/auth/join_form")
	public String joinForm() {
		return "user/join_form";
	}

	@GetMapping("/auth/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return "redirect:/";
	}

	@GetMapping("/myPage_form")
	public String myPage() {
		return "user/mypage_form";
	}
	
	//TODO 마이페이지 안에서 유저인포업데이트 폼 달아주기
//	@GetMapping("/auth/user/updateUserInfo_form")
//	public String updateForm() {
//		return "user/update_form";
//	}
	

	@PostMapping("/auth/joinProc")
	public String save(User user) {
		System.out.println("save 들어옴");
		int result = userService.saveUser(user);
		return "redirect:/";
	}

	// 소셜로그인
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(@RequestParam String code) {
		/**
		 * Oaga Rest Api 키 : 31c71a748886ababf2df137e8f33a1a4 사이트 도메인 :
		 * http://localhost:9090 redirect uri:
		 * http://localhost:9090/oaga/auth/kakao/callback
		 * 
		 */

		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();

		// header
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "31c71a748886ababf2df137e8f33a1a4");
		params.add("redirect_uri", "http://localhost:9090/oaga/auth/kakao/callback");
		params.add("code", code);

		// header와 body하나의 object로 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http요청(post)
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		OAuthToken authToken = null;
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			authToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + authToken.getAccessToken());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);
		ResponseEntity<KakaoProfile> kakaoProfileResponse = rt2.exchange("https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST, kakaoProfileRequest, KakaoProfile.class);

		KakaoAccount account = kakaoProfileResponse.getBody().getKakaoAccount();
		System.out.println("카카오 아이디: " + kakaoProfileResponse.getBody().getId());
		System.out.println("카카오 이메일: " + account.getEmail());
		System.out.println("블로그에서 사용될 유저네임 : " + account.getEmail() + "_" + kakaoProfileResponse.getBody().getId());

		User kakaoUser = User.builder().username(account.getEmail() + "_" + kakaoProfileResponse.getBody().getId())
				.password(oagaKey).email(account.getEmail()).oauth("kakao").build();
		System.out.println("카카오유저 :" + kakaoUser);
		User originUser = userService.searchUser(kakaoUser.getUsername());
		if (originUser.getUsername() == null) {
			System.out.println("카카오유전데 신규라서 회원가입할거임");
			userService.saveUser(kakaoUser);
		}
		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(kakaoUser.getUsername(), oagaKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "redirect:/";
	}
}
