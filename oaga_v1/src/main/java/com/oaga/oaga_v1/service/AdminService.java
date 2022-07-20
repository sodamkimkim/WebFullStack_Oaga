package com.oaga.oaga_v1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.repository.AreaRepository;
import com.oaga.oaga_v1.repository.TravelInfoRepository;

@Service
public class AdminService {
	@Autowired
	private AreaRepository areaRepository;
	@Autowired
	private TravelInfoRepository travelInfoRepository;
	
	@Transactional
	public List<Area> areaAll(){
		return areaRepository.findAll();
	}
	
	public List<AreaGu> areaGuAll(int area){
		return travelInfoRepository.mAreaIdList(area);
	}
	
}
