package com.oaga.oaga_v1.config;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class WebMvcConfigurer {
 private final ObjectMapper objectMapper;
}
