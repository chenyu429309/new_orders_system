package com.ordersystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ordersystem.entity.User;
import com.ordersystem.mapper.UserMapper;

@Service(value = "userService")
public class UserService {
	@Autowired
	private UserMapper userMapper;

	public User getUserByid(int id) {
		return userMapper.findUserById(id);
	}

}
