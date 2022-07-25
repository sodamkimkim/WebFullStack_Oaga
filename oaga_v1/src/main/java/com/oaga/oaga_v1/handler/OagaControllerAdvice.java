package com.oaga.oaga_v1.handler;

import org.hibernate.PropertyValueException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class OagaControllerAdvice {
	
	@ExceptionHandler(PropertyValueException.class)
	public String propertyValueException(PropertyValueException e) {
		System.out.println(e.getStackTrace());
		return "error";
	}
	
	@ExceptionHandler(DataIntegrityViolationException.class)
	public String dataIntegrityViolationException(DataIntegrityViolationException e) {
		System.out.println(e.getStackTrace());
		return "error";
	}
	
	
}
