package com.oaga.oaga_v1.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class OAuthToken {

	private String accessToken;
    private String tokenType; 
    private String refreshToken;
    private int expiresIn;
    private String scope; 
    private String refreshTokenExpiresIn;
}
