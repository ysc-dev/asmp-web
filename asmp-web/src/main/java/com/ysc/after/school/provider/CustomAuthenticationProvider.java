package com.ysc.after.school.provider;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.ysc.after.school.domain.db.User;
import com.ysc.after.school.service.UserService;
import com.ysc.after.school.service.util.EncryptionUtil;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private UserService userService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String userId = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
//        EncryptionUtil.sha256(password)
        User user = userService.login(userId, password);
        if (user != null) {
        	Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
        	roles.add(new SimpleGrantedAuthority("ROLE_USER"));
             
            return new UsernamePasswordAuthenticationToken(user, password, roles);   
        } else {
            throw new BadCredentialsException("Bad credentials");
        }
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
