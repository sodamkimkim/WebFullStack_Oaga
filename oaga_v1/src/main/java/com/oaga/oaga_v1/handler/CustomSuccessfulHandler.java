package com.oaga.oaga_v1.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomSuccessfulHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		List<String> role = new ArrayList<>();
		authentication.getAuthorities().forEach(authority -> {
			System.out.println("사용자 권한 체크 : " + authority.getAuthority());
			role.add(authority.getAuthority());
		});
		if(role.contains("ROLE_ADMIN")) {
			response.sendRedirect("/oaga/admin/admin_mainpage");
			return;
		}
		if(role.contains("ROLE_USER")) {
			response.sendRedirect("/oaga");
			return;
		}
		response.sendRedirect("/oaga");
	}

}
