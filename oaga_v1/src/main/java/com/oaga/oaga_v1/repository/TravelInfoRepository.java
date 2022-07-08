package com.oaga.oaga_v1.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.model.TravelInfo;

public interface TravelInfoRepository extends JpaRepository<TravelInfo, Integer>{

	
//	Page<TravelInfo> findByArea(String area);
	
}
