package com.foo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	
	static final Logger LOGGER = LoggerFactory.getLogger(HelloController.class);

	@RequestMapping(value ="/greeting")
	public String sayHello (Model model) {
		
		LOGGER.debug("HUH HUH");
		model.addAttribute("greeting", "Hello World");
		
		return "hello";
	}
	
}
