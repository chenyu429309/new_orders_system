package com.felix.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.felix.entity.User;
import com.felix.mapper.UserMapper;

@Service(value="userService")
public class UserService {
	@Autowired
	private UserMapper userMapper;

	public User getUserByid(int id) {
		return userMapper.findUserById(id);
	}

}
