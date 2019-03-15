package com.ysc.after.school.repository;

import com.ysc.after.school.domain.db.User;

public interface UserRepository extends DefaultRepository<User, Integer> {

	User findByUserIdAndPassword(String userId, String password);

}
