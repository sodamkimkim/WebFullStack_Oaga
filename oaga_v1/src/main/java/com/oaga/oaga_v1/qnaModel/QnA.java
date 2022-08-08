package com.oaga.oaga_v1.qnaModel;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.JoinColumnOrFormula;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.oaga.oaga_v1.userModel.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class QnA {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(nullable = false, length = 30)
	private String title;
	
	@Lob
	@Column(nullable = false)
	private String content;
	
	@Column(length = 5)
	private String password;
	
	@ManyToOne(optional = false)
	@JoinColumn(name = "userId")
	private User user;
	
	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private QnAType qnaType;

	@Column(nullable = true)
	@OneToMany(mappedBy = "qna", fetch =  FetchType.EAGER, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"user","qna"})
	private List<QnAReply> qnareplies;
	
	
	@CreationTimestamp
	private Timestamp createDate;
}
