package com.springdemo.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SampleFilter  implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {  
		
		System.err.println("Sample filter is invoked before rendering the servlet.");
		String ipAddress = request.getRemoteAddr();
		request.setAttribute("ipAddress", ipAddress);
		
		//If connection is http forward to https connection
		HttpServletRequest httpReq = (HttpServletRequest) request;
        String redirectTarget = httpReq.getRequestURL().toString();
        redirectTarget = redirectTarget.replaceFirst("http", "https");
        redirectTarget = redirectTarget.replaceFirst(":8080", ":8443");
                  
        if(request.isSecure()) {                   
        	chain.doFilter(request, response);  
        } else {  
            ((HttpServletResponse)response).sendRedirect(redirectTarget);
        }
		
	    System.err.println("Sample filter is invoked after rendering the servlet.");  
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
