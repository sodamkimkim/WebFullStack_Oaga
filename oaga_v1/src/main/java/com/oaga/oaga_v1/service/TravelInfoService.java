package com.oaga.oaga_v1.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.repository.TravelInfoRepository;

@Service
public class TravelInfoService {
	@Autowired
	private TravelInfoRepository travelInfoRepository;
	
	@Transactional
	public Page<AreaGu> imageList(Pageable pageable){
		System.out.println("레파지토리에있는 리스트 라이즈 : " + travelInfoRepository.findAll().size());
		return travelInfoRepository.findAll(pageable);

	}
	
//	@Transactional
//	public Page<AreaGu> areaImage(Pageable pageable, int areaid){
//		return travelInfoRepository.findByAreaId(areaid, pageable);
//		
//	}
	@Transactional
	public List<AreaGu> seoul(){
		return travelInfoRepository.seoul();
	}
	@Transactional
	public List<AreaGu> busan(){
		return travelInfoRepository.busan();
	}
	@Transactional
	public List<AreaGu> jeju(){
		return travelInfoRepository.jeju();
	}
	@Transactional
	public List<AreaGu> deagu(){
		return travelInfoRepository.deagu();
	}
	@Transactional
	public List<AreaGu> inchun(){
		return travelInfoRepository.inchun();
	}
	
	
	
}