package com.oaga.oaga_v1.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.AreaGu;


// JPA 영속성 컨텍스트 : AreaGu <----------- 반환 , 기본 데이터 타입 

public interface TravelInfoRepository extends JpaRepository<AreaGu, Integer>{

	// 네이티브 쿼리로 통일
	
//	@Query(value = "SELECT * FROM areagu WHERE areaid IN(1,2,3,4,5) order by areaId", nativeQuery = true)
//	List<AreaGu> areaList();
	
	@Query(value =  "SELECT * FROM areagu WHERE area =?", nativeQuery = true)
	List<AreaGu> mAreaIdList(int area);
	
	
	
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 1", nativeQuery = true)
//	List<AreaGu> seoul();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 2", nativeQuery = true)
//	List<AreaGu> busan();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 3", nativeQuery = true)
//	List<AreaGu> deagu();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 4", nativeQuery = true)
//	List<AreaGu> jeju();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 5", nativeQuery = true)
//	List<AreaGu> inchun();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 6", nativeQuery = true)
//	List<AreaGu> 광주();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 7", nativeQuery = true)
//	List<AreaGu> 경기();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 8", nativeQuery = true)
//	List<AreaGu> 강원();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 9", nativeQuery = true)
//	List<AreaGu> 경남();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 10", nativeQuery = true)
//	List<AreaGu> 경북();
//	@Query(value = "SELECT * FROM areagu WHERE areaid = 11", nativeQuery = true)
//	List<AreaGu> 전남();
//	
	
	
	

	
	

}