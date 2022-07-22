package com.oaga.oaga_v1.test;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.repository.UserRepository;
import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.service.ReviewService;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.User;

@RestController
public class UserControllerTest {
	@Autowired
	UserService userService;

	@Autowired
	ReviewService reviewService;

	@Autowired
	UserRepository userRepository;

	@GetMapping("/test/myPage_form")
	public Page<Review> userInfo(
			@PageableDefault(size = 6, sort = "createDate", direction = Direction.DESC) Pageable pageable, Model model,
			@AuthenticationPrincipal PrincipalDetail detail) {
		User myInfo = userService.searchUser(detail.getUsername());
		Page<Review> myReviews = reviewService.getMyReviews(pageable, detail.getUser().getId());
		System.out.println("in UserController, session의 myInfo찍어봄." + myInfo.toString());
		System.out.println("in UserController, myReviews: " + myReviews.toString());
		int nowPage = myReviews.getPageable().getPageNumber() + 1;
		int startPage = Math.max(nowPage - 2, 1);
		int endPage = Math.min(nowPage + 2, myReviews.getTotalPages());
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPage; i <= endPage; i++) {
			pageNumbers.add(i);
		}
		model.addAttribute("myinfo", myInfo);
		model.addAttribute("myReviews", myReviews);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageNumbers", pageNumbers);
		return myReviews;
	}

	@GetMapping("/test/userpage_form/{userId}")
	public Page<Review> getUserPage(@PathVariable int userId,
			@PageableDefault(size = 6, sort = "createDate", direction = Direction.DESC) Pageable pageable,
			Model model) {
		User user = userService.searchUserById(userId);
		Page<Review> userReviews = reviewService.getMyReviews(pageable, userId);
		model.addAttribute("user", user);
		model.addAttribute("userReviews", userReviews);
		return userReviews;
	}

	@GetMapping("/test/user/{userId}")
	public User getUserInfo(@PathVariable int userId,
			@PageableDefault(size = 6, sort = "createDate", direction = Direction.DESC) Pageable pageable,
			Model model) {
		User user = userService.searchUserById(userId);
		model.addAttribute("user", user);

		return user;
	}



}