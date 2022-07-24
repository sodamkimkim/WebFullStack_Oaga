
package com.oaga.oaga_v1.placeModel;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Restaurant {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false,length = 30)
    private String name;

    @Lob
    private String content;
    @Column(nullable = false, length = 100)
    private String address;
    @Column(nullable = false)
    private String image;
    
    @Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private CategoryType categoryType;
    
    private String originImageUrl;
    
    @ManyToOne
    @JoinColumn(name = "areaGu")
    private AreaGu areaGu;
    
    
    @CreationTimestamp
    private Timestamp createDate;

}