package com.oaga.oaga_v1.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
public interface TravelInfoRepository extends JpaRepository<AreaGu, Integer>{
	
//	Page<TravelInfo> findByArea(String area);
	
}