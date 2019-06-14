package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.db.User;
import com.ysc.after.school.repository.UserRepository;
import com.ysc.after.school.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public List<User> getList() {
		return userRepository.findAll();
	}

	@Override
	public boolean regist(User user) {
		if (isNew(user)) {
			return userRepository.save(user) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(User user) {
		if (!isNew(user)) {
			return userRepository.save(user) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(User user) {
		userRepository.delete(user);
		return true;
	}

	private boolean isNew(User user) {
		return !userRepository.exists(user.getId());
	}

	@Override
	public User login(String userId, String password) {
		System.err.println("111");
		return userRepository.findByUserIdAndPassword(userId, password);
	}
}
