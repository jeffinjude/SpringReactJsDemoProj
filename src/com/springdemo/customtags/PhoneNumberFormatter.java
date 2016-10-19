package com.springdemo.customtags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PhoneNumberFormatter extends SimpleTagSupport{
	private String phoneNumber;

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		String formattedNumber = "+91-" + phoneNumber;
		getJspContext().getOut().write(formattedNumber);
	}
}
