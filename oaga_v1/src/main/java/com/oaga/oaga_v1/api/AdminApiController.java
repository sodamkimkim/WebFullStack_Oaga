package com.oaga.oaga_v1.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.repository.GuInfoRepository;
import com.oaga.oaga_v1.service.AdminService;

@RestController
public class AdminApiController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private GuInfoRepository guInfoRepository;

	@GetMapping("/api/admin/areaId/{id}")
	public ResponseDto<List<AreaGu>> areaListAll(Model model, @PathVariable int id) {
		List<AreaGu> areaGu = adminService.areaGuAll(id);

		model.addAttribute("areaGuList", areaGu);

		return new ResponseDto<>(HttpStatus.OK, areaGu);
	}

	@GetMapping("/api/admin/areaIdGu/{id}")
	public ResponseDto<List<AreaGu>> restaurantSave(@PathVariable int id, Model model) {

		List<AreaGu> areaGuList = adminService.areaGuNmae(id);
		model.addAttribute("areaGuName", areaGuList);

		return new ResponseDto<>(HttpStatus.OK, areaGuList);
	}

	@DeleteMapping("/admin/deleterestaurant/{id}")
	public ResponseDto<Integer> deleteRestaurantById(@PathVariable int id) {
		System.out.println("응 아라쪙");
		adminService.deleteRestaurantById(id);
		return new ResponseDto<Integer>(HttpStatus.OK, 1);
	}

// ==========================================================

}
