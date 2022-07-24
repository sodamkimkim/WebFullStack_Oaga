package com.oaga.oaga_v1.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.oaga.oaga_v1.dto.RequestTravelDto;
import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.CategoryType;
import com.oaga.oaga_v1.placeModel.GuInfo;
import com.oaga.oaga_v1.repository.GuInfoRepository;
import com.oaga.oaga_v1.service.AdminService;
import com.oaga.oaga_v1.userModel.RoleType;
import com.oaga.oaga_v1.userModel.User;

@RestController
public class AdminApiController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private GuInfoRepository guInfoRepository;
	
	
	@GetMapping("/api/admin/areaId/{id}")
	public ResponseDto<List<AreaGu>> areaListAll(Model model,  @PathVariable int id) {
		List<AreaGu> areaGu = adminService.areaGuAll(id);
	
		model.addAttribute("areaGuList",areaGu);
			
		
		return new ResponseDto<>(HttpStatus.OK, areaGu);
	}
	

	@GetMapping("/api/admin/areaIdGu/{id}")
	public ResponseDto<List<AreaGu>> restaurantSave(@PathVariable int id, Model model){
		
		List<AreaGu> areaGuList = adminService.areaGuNmae(id);
		System.out.println(areaGuList + " areaGuListareaGuList");
		model.addAttribute("areaGuName",areaGuList);
		
		return new ResponseDto<>(HttpStatus.OK, areaGuList);
	}
	
	
	@GetMapping("/api/admin/guinfoupdate/{areaguid}")
	public ResponseDto<List<GuInfo>> guinfoUpdateList(@PathVariable int areaguid, Model model){
		System.out.println(areaguid + "@#@@@");
		List<GuInfo> guinfoList = adminService.findAreaGuId(areaguid);
		System.out.println(guinfoList + "guinfoListguinfoList");
		model.addAttribute("guinfoList",guinfoList);
		
		return new ResponseDto<>(HttpStatus.OK, guinfoList);
	}
	
	
	@GetMapping("/api/admin/guinfo_info/{guinfo}") // 구인포리스트 클릭했을때 어펜드 하기 위해
	public ResponseDto<List<GuInfo>> guinfoupdatefindid(@PathVariable int guinfo, Model model){
		
		List<GuInfo> guinfo_info = adminService.findGuinfoId(guinfo);
		System.out.println(guinfo_info + " guinfo_infoguinfo_info");
		model.addAttribute("guinfo_info",guinfo_info);
		
		return new ResponseDto<>(HttpStatus.OK, guinfo_info);
	}
	
	
	 
	@PutMapping("/api/admin/guinfo/update/{id}")// 수정하기
	public ResponseDto<Integer> updateUserInfo(@RequestBody GuInfo guInfo, @PathVariable int id) {
		
		System.out.println(guInfo);
		adminService.updateGuInfo(guInfo, id);
		
		return new ResponseDto<Integer>(HttpStatus.OK, 1);
	}
	
	
// ==========================================================
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
