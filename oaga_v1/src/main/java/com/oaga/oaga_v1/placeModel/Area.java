package com.oaga.oaga_v1.placeModel;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Area {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 50)
    private String area;

    @Column(nullable = false, length = 200)
    private String content;
   

    @OneToMany(mappedBy = "area", fetch =  FetchType.EAGER, cascade = CascadeType.REMOVE)
    @JsonIgnoreProperties({"area"})
    private List<AreaGu> areaGus; 

   
}