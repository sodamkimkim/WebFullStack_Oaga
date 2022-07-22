package com.oaga.oaga_v1.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.GuInfo;
import com.oaga.oaga_v1.repository.GuInfoRepository;
import com.oaga.oaga_v1.service.AdminService;

@RestController
public class AdminApiController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private GuInfoRepository guInfoRepository;
	
	
	@GetMapping("/api/admin/areaId/{id}")
	public ResponseDto<List<AreaGu>> areaListAll(Model model,  @PathVariable int id) {
		List<AreaGu> areaGu = adminService.areaGuAll(id);
		System.out.println(areaGu.get(0).getGuname()+ "!!!");
		System.out.println(id + "$$$$@@@@");
		model.addAttribute("areaGuList",areaGu);
			
		
		return new ResponseDto<>(HttpStatus.OK, areaGu);
	}
	
	
	@PostMapping("/api/damin/infoSave")
	public ResponseDto<Integer> restaurantSave(@RequestBody GuInfo guInfo){
		System.out.println("infoSaveinfoSave");
		guInfoRepository.save(guInfo);
		return new ResponseDto<>(HttpStatus.OK,1);
	}
	
	

	@GetMapping("/api/admin/areaIdGu/{id}")
	public ResponseDto<Integer> restaurantSave(@PathVariable int id){
		System.out.println(id + "em doasdmasdmawodmaspodmasdmas@@@@");
		
		return new ResponseDto<>(HttpStatus.OK,1);
	}
	
	
}
