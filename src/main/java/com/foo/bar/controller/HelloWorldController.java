package com.foo.bar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorldController {
	String message = "Welcome to Spring MVC!";
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {

		model.addAttribute("message", "Spring MVC Hello World");
		return "hello";

	}
	
	@RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
	public ModelAndView hello(@PathVariable("name") String name) {

		ModelAndView model = new ModelAndView();
		model.setViewName("hello");
		model.addObject("msg", name);
		return model;
	}

	
//	@RequestMapping("/hello")
//	public ModelAndView showMessage(
//			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
//		System.out.println("in controller");
// 
//		ModelAndView mv = new ModelAndView("helloworld");
//		mv.addObject("message", message);
//		mv.addObject("name", name);
//		return mv;
//	}
}
