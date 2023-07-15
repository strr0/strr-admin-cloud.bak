package com.strr.config;

import com.strr.admin.mapper.SysUserMapper;
import com.strr.admin.model.SysUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import java.util.List;

@Configuration
public class WebSecurityConfig {
    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * A Spring Security filter chain for authentication.
     */
    @Bean
    @Order(2)
    public SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                // 禁用csrf
                .and()
                .csrf().disable()
                .exceptionHandling();
        return http.build();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return username -> {
            List<SysUserDetails> userDetailsList = sysUserMapper.getByUsername(username);
            if (!userDetailsList.isEmpty()) {
                return userDetailsList.get(0);
            }
            throw new UsernameNotFoundException(String.format("User '%s' not found.", username));
        };
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
