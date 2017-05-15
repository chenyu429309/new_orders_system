package com.felix.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.felix.entity.User;
import com.felix.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping(value="/login",method=RequestMethod.GET)
	@ResponseBody
	public User getUserByid(){
		return userService.getUserByid(1);
	}
	@RequestMapping(value="/toindex")
	public String tondex(){
		return "index";
	}
	@RequestMapping(value="/test")
	public String test(){
		return "WEB-INF/page/t1";
	}
	@RequestMapping(value="/test2")
	public String test2(){
		return "WEB-INF/page/t2";
	}
}
