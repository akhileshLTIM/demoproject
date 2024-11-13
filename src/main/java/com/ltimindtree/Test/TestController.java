package com.ltimindtree.Test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class TestController {
	
	
	@GetMapping("/get")
	public String show() {
		return "Welcome to World of Java";
	}

}
