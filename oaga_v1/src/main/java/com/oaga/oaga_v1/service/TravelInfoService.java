package com.oaga.oaga_v1.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.repository.TravelInfoRepository;

@Service
public class TravelInfoService {
	@Autowired
	private TravelInfoRepository travelInfoRepository;
	


	

	public Page<AreaGu> getImageList(Pageable pageable){
		System.out.println("레파지토리에있는 리스트 라이즈 : " + travelInfoRepository.findAll().size());
		return travelInfoRepository.findAll(pageable);

	}
	
	
}