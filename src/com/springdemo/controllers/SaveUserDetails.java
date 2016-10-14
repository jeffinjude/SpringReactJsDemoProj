package com.springdemo.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springdemo.dao.UserDetailsDao;
import com.springdemo.models.UserDetails;

@Controller
public class SaveUserDetails implements ApplicationContextAware{
	private UserDetailsDao userDetailsDao;
	private static ApplicationContext context;
	
	@RequestMapping("/SaveUserDetails")
	protected ModelAndView saveUserDetails(@ModelAttribute("userDetails") UserDetails userDetails) throws Exception {
		ModelAndView modelAndView = new ModelAndView("UserPages/UserList");
		
		userDetailsDao = (UserDetailsDao)context.getBean("userDetailsDao");
		userDetailsDao.insertData(userDetails.getUserName(), userDetails.getPhoneNumber());
		
		List<UserDetails> fetchedUserDetails = userDetailsDao.fetchAllUserDetails();
		modelAndView.addObject("message", "Successfully inserted the data!");
		modelAndView.addObject("userDetails", fetchedUserDetails);
		
		return modelAndView;
	}
	public UserDetailsDao getUserDetailsDao() {
		return userDetailsDao;
	}
	public void setUserDetailsDao(UserDetailsDao userDetailsDao) {
		this.userDetailsDao = userDetailsDao;
	}
	
	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
	}
}
