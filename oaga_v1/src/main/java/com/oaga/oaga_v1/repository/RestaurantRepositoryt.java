package com.oaga.oaga_v1.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.Restaurant;

public interface RestaurantRepositoryt extends JpaRepository<Restaurant, Integer>{
	
	
	
	// guInfo 페이지에 필요한 레스토랑 리스트(controller / guInfoList)
//	@Query(value = "SELECT * FROM restaurant AS r INNER JOIN guInfo AS g ON r.guInfoId = g.id WHERE r.guInfoId = ?", nativeQuery = true)
//	List<Restaurant> mFindByGuInfoId(int guInfoId);
	
	
	
	// 식당 정보 보여주기
	@Query(value = "SELECT * FROM restaurant WHERE id = ?", nativeQuery = true)
	List<Restaurant> mFindByRestaurant(int id);

	// 선택한 id를 제외하고 나머지 
//	@Query(value = "SELECT * FROM restaurant WHERE guInfoId = 1 and not id = 1", nativeQuery = true)
//	List<Restaurant> mRemainderRestaurant();
	
	
	@Query(value = "SELECT * FROM restaurant WHERE areaGu = ?", nativeQuery = true)
	List<Restaurant> mRestaurantGroupByGuInfoId(int areaGuId);
	
}
