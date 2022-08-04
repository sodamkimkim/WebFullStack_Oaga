package com.oaga.oaga_v1.dto;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartFile;

import com.oaga.oaga_v1.userModel.RoleType;
import com.oaga.oaga_v1.userModel.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Configuration
public class RequestUserProfileDto {

	
	private String username;
	private String userNickName;
	private String password;
	private String email;
	private RoleType role;
	private String oauth;
	private MultipartFile file;
	private String uuid; //고유한 파일이름


	public User toEntity(String userImgUrl) {
		return User.builder()
				.username(username)
				.userNickName(userNickName)
				.password(password)
				.email(email)
				.oauth(oauth)
				.role(role)
				.userProfileImgUrl(userImgUrl)
				.profileOriginImgUrl(file.getOriginalFilename())
				.build();
	}
}


//@Id //primary key
//@GeneratedValue(strategy = GenerationType.IDENTITY) //프로젝트에 연결된 db넘버링전략 따라가기(mysql auto-increment)
//private int id;
//
//
//@Column(nullable = false, length = 100)
//private String username;
//
//@Column(nullable = true, length = 20)
//private String userNickName;
//
//@Column(nullable = false, length = 100)
//private String password;
//
//@Column(nullable = false, length = 100)
//private String email;
//
//@Enumerated(EnumType.STRING)//enum을 db에서는 스트링으로 알아먹어라!
//private RoleType role; //admin이냐 user이냐 구분
//
////소셜 로그인 가입자 구분
//private String oauth;
//
////@OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
////@JsonIgnoreProperties({"user","userId"})
////private List<Review> reviews;
//
//@CreationTimestamp // 시간 자동입력
//private Timestamp createDate;
//
//@ColumnDefault("0")
//private int likes;
//
//@ColumnDefault("0")
//private int qna;
//
//@Column(nullable = true)
//private MultipartFile userProfileFile;