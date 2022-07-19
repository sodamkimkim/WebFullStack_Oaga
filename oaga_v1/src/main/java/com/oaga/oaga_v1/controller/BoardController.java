package com.oaga.oaga_v1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller // 페이지 리턴
public class BoardController {

	@GetMapping({"/oaga/index"})
	public String index() {
		return "index";
	}

}
