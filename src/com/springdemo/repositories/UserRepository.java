package com.springdemo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.springdemo.models.UserDetails;

@Repository
public interface UserRepository extends JpaRepository<UserDetails, Long>{
	@Modifying
	@Query("update UserDetails u set u.userName = ?1, u.phoneNumber = ?2 where u.userId = ?3")
	void updateUserData(String userName, String phoneNumber, Long userId);
}
