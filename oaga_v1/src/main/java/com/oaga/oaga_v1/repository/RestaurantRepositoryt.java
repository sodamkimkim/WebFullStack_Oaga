package com.oaga.oaga_v1.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.Restaurant;

public interface RestaurantRepositoryt extends JpaRepository<Restaurant, Integer> {

	// area에 속해있는 모든 식당/카페
	@Query(value = "SELECT * FROM restaurant AS r INNER JOIN areaGu AS a ON r.areaGu = a.id WHERE a.area = ?", nativeQuery = true)
	List<Restaurant> mFindByGuInfoId(int areaGu_areaId);

	// 선택한 식당 정보 보여주기
	@Query(value = "SELECT * FROM restaurant WHERE id = ?", nativeQuery = true)
	List<Restaurant> mFindByRestaurant(int id);

	// 선택한 id를 제외하고 나머지
	@Query(value = "SELECT * FROM restaurant WHERE areaGu = ? and not id = ?", nativeQuery = true)
	List<Restaurant> mRemainderRestaurant(int areaGu, int id);

	// areaGu에 속해있는 식당/카페
	@Query(value = "SELECT * FROM restaurant WHERE areaGu = ?", nativeQuery = true)
	List<Restaurant> mRestaurantGroupByGuInfoId(int areaGuId);

	// restaurant name 검색하기
	@Query(value = "select * from restaurant where name like %?% ", nativeQuery = true)
	Page<Restaurant> findAllByNameContaining(String searchTitle, Pageable pageable);

	
}
