package com.oaga.oaga_v1.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;


// JPA 영속성 컨텍스트 : AreaGu <----------- 반환 , 기본 데이터 타입 

public interface AreaGuRepository extends JpaRepository<AreaGu, Integer>{

	// 네이티브 쿼리로 통일
	
//	@Query(value = "SELECT * FROM areagu WHERE areaid IN(1,2,3,4,5) order by areaId", nativeQuery = true)
//	List<AreaGu> areaList();
	
	@Query(value =  "SELECT * FROM areagu WHERE area =?", nativeQuery = true)
	List<AreaGu> mAreaIdList(int area);
	
	@Query(value =  "SELECT * FROM areagu WHERE id =?", nativeQuery = true)
	List<AreaGu> mAreaGuId(int area);

	
	
	

	
	

}