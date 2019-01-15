package com.ysc.after.school.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@EnableCaching
@EnableScheduling
@ComponentScan(basePackages = {"com.ysc.after.school.service"})
@Import(value = { JpaConfig.class })
@PropertySource("classpath:application.properties")
public class AppConfig {

	@Bean
	public CacheManager cacheManager() {
		return new ConcurrentMapCacheManager();
	}
}
