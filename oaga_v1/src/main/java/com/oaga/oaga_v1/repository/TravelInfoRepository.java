package com.oaga.oaga_v1.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.placeModel.AreaGu;
public interface TravelInfoRepository extends JpaRepository<AreaGu, Integer>{
	
	// 네이티브 쿼리로 통일
//	 select * from areagu where areaId = ?;
	List<AreaGu> findByAreaId(int areaId);
	
	

}