package com.oaga.oaga_v1.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.placeModel.Place;

public interface TravelInfoRepository extends JpaRepository<Place, Integer>{

	
//	Page<TravelInfo> findByArea(String area);
	
}
