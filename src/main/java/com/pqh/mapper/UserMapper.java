package com.pqh.mapper;

import com.pqh.pojo.User;

public interface UserMapper {

	User findUserByUserName(String username);

	void saveUser(User user);

}
