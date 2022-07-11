package com.oaga.oaga_v1.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.placeModel.Area;
public interface TravelInfoRepository extends JpaRepository<Area, Integer>{
	
//	Page<TravelInfo> findByArea(String area);
	
}