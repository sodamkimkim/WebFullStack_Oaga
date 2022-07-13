package com.oaga.oaga_v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.repository.TravelInfoRepository;

public class TravelDummyTest {

	@Autowired
	private TravelInfoRepository infoRepository;
	
	
	
	@GetMapping("/dummy/travel/{areaid}")
	@ResponseBody
	public Page<AreaGu> dummy(@PathVariable int areaid,Pageable pageable) {
		return infoRepository.findByAreaId(areaid, pageable);
		}
	
}
