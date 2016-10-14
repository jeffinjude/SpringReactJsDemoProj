package com.springdemo.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.springdemo.models.UserDetails;
import com.springdemo.repositories.UserRepository;

@Component
public class UserDetailsDao {
	@Resource
	UserDetails userDetails;
	@Resource
	UserRepository userRepository;
	
	public UserDetails getUserDetails() {
		return userDetails;
	}
	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	public UserRepository getUserRepository() {
		return userRepository;
	}
	public void setUserRepository(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@Transactional
	public void insertData(String userName, String phoneNumber)
	{
		userDetails.setUserId(0L); //clearing out the old record's id from the object so that save method won't do an update
		userDetails.setUserName(userName);
		userDetails.setPhoneNumber(phoneNumber);
		
		userRepository.save(userDetails);
	}
	
	@Transactional
	public void updateData(Long id, String userName, String phoneNumber)
	{
		userRepository.updateUserData(userName, phoneNumber, id);
	}
	
	@Transactional
	public UserDetails getData(Long id)
	{
		return userRepository.findOne(id);
	}
	
	@Transactional
	public void deleteData(Long id)
	{
		userRepository.delete(id);
	}
	
	public List<UserDetails> fetchAllUserDetails()
	{
		return userRepository.findAll();
	}
	
	public void testMethod()
	{
		System.out.println("Inside Test");
	}
}
