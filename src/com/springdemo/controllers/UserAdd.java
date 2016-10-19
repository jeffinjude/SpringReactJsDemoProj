package com.springdemo.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springdemo.dao.UserDetailsDao;
import com.springdemo.models.UserDetails;

@Controller
public class UserAdd  implements ApplicationContextAware{
	private UserDetailsDao userDetailsDao;
	private static ApplicationContext context;
	
	@RequestMapping("/UserAdd")
	protected ModelAndView userAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView("UserPages/UserAddEdit");
		
		userDetailsDao = (UserDetailsDao)context.getBean("userDetailsDao");
		if(request.getParameter("userId") != null)
		{
			UserDetails userObj = userDetailsDao.getData(Long.parseLong(request.getParameter("userId")));
			modelAndView.addObject("userDetails", userObj);
		}
		
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
