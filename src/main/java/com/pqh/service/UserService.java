package com.pqh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pqh.mapper.UserMapper;
import com.pqh.pojo.User;
import com.pqh.vo.Result;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	//查询用户密码是否正确
	public Result findUserByUserName(String username,String password ) {
		Result result=new Result();
		User user = userMapper.findUserByUserName(username);
		if (password.equals(user.getPassword())) {
			result.setStatus(1);
			result.setMessage("登录成功!");
		}else {
			result.setStatus(0);
			result.setMessage("用户名或密码错误!");
		}
		return result;
	}
	//查询用户是否存在
	public User checkUserByUserName(String username) {
		User user=userMapper.findUserByUserName(username);
		
		return user;
	}
	//添加注册用户信息
	public void saveUser(User user) {
		userMapper.saveUser(user);
		
	}

}
