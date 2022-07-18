package com.oaga.oaga_v1.userModel;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

//localhost:9090/oaga/review

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity // mysql에 테이블 생성
public class User {
	@Id //primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) //프로젝트에 연결된 db넘버링전략 따라가기(mysql auto-increment)
	private int id;
	

	@Column(nullable = false, length = 100)
	private String username;
	
	@Column(nullable = true, length = 20)
	private String userNickName;
	
	@Column(nullable = false, length = 100)
	private String password;
	
	@Column(nullable = false, length = 100)
	private String email;
	
	@Enumerated(EnumType.STRING)//enum을 db에서는 스트링으로 알아먹어라!
	private RoleType role; //admin이냐 user이냐 구분
	
	//소셜 로그인 가입자 구분
	private String oauth;
	
//	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
//	@JsonIgnoreProperties({"user","userId"})
//	private List<Review> reviews;
	
	@CreationTimestamp // 시간 자동입력
	private Timestamp createDate;
	
	@ColumnDefault("0")
	private int likes;
	
	@ColumnDefault("0")
	private int qna;
	
	@Column(nullable = true)
	private String userProfileImgUrl;
	
	private String profileOriginImgUrl;
	
	

}
