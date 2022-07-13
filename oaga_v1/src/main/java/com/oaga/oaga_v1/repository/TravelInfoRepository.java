package com.oaga.oaga_v1.repository;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.AreaGu;


public interface TravelInfoRepository extends JpaRepository<AreaGu, Integer>{




	
	// 네이티브 쿼리로 통일
//	 select * from areagu where areaId = ?;
	@Query(value = "SELECT * FROM areagu WHERE areaid = :areaid", nativeQuery = true)
	Optional<AreaGu> mFindByAreaid(int areaid);
	
	// page obejct를 리턴 받기 위해서는 매개 변수 pageble를 넣어야 오류가 안남!!! 
//	Page<AreaGu> findByAreaId(int areaid, Pageable pageable);
	
	@Query(value = "SELECT * FROM areagu WHERE areaid = 1", nativeQuery = true)
	List<AreaGu> seoul();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 2", nativeQuery = true)
	List<AreaGu> busan();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 3", nativeQuery = true)
	List<AreaGu> deagu();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 4", nativeQuery = true)
	List<AreaGu> jeju();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 5", nativeQuery = true)
	List<AreaGu> inchun();
	
	
	@Query(value = "SELECT * FROM areagu WHERE areaid = 6", nativeQuery = true)
	List<AreaGu> 광주();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 7", nativeQuery = true)
	List<AreaGu> 경기();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 8", nativeQuery = true)
	List<AreaGu> 강원();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 9", nativeQuery = true)
	List<AreaGu> 경남();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 10", nativeQuery = true)
	List<AreaGu> 경북();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 11", nativeQuery = true)
	List<AreaGu> 전남();
	@Query(value = "SELECT * FROM areagu WHERE areaid = 3", nativeQuery = true)
	List<AreaGu> 전북();
	
	
	
	

	
	

}