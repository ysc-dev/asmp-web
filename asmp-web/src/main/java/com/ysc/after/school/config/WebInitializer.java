package com.ysc.after.school.config;

import javax.servlet.Filter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.ysc.after.school.provider.CustomHttpSessionListener;

//public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
//	
//	@Override
//	public Filter[] getServletFilters() {
//		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
//		encodingFilter.setEncoding("UTF-8");
//		
//		return new Filter[]{encodingFilter};
//	}
//
//	@Override
//	protected Class<?>[] getRootConfigClasses() {
//		return new Class[] { AppConfig.class };
//	}
//
//	@Override
//	protected Class<?>[] getServletConfigClasses() {
//		return new Class[] { WebConfig.class };
//	}
//
//	@Override
//	protected String[] getServletMappings() {
//		return new String[]{"/"};
//	}
//	
//	@Override
//	public void onStartup(ServletContext servletContext) throws ServletException {
//		servletContext
//        .addFilter("springSecurityFilterChain", new DelegatingFilterProxy("springSecurityFilterChain"))
//        .addMappingForUrlPatterns(null, false, "/*");
//		
//		servletContext.addListener(new CustomHttpSessionListener());
//		
//		super.onStartup(servletContext);
//	}
//}
public class WebInitializer {
}
