package com.oaga.oaga_v1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnAController {

	@GetMapping("/qna/qna_home")
	public String qnaForm() {
		return "qna/qnahome";
	}
	@GetMapping("/qna/detailform")
	public String qnaDetailForm() {
		System.out.println("??");
		return "qna/qnadetail_form";
	}
	

}
