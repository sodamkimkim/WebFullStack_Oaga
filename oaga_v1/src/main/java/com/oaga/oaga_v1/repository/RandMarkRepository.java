package com.oaga.oaga_v1.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.placeModel.GuInfo;

public interface RandMarkRepository extends JpaRepository<GuInfo, Integer>{

//	@Query(value = "SELECT * FROM randmark WHERE areaGu =?", nativeQuery = true)
//	List<GuInfo> mFindByAreaGu(int areaGu);
//	
//	
	
}
