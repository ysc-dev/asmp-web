package com.ysc.after.school.service;

import com.ysc.after.school.domain.db.User;

public interface UserService extends CRUDService<User> {

	public User login(String userId, String password);
}
