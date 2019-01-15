package com.ysc.after.school.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.support.TransactionTemplate;

import com.ysc.after.school.domain.db.User;
import com.ysc.after.school.repository.UserRepository;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(transactionManagerRef = "txManager", basePackageClasses = { UserRepository.class })
public class JpaConfig {

	@Autowired
	private Environment env;
	
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(env.getProperty("jdbc.driverClass"));
		dataSource.setUrl(env.getProperty("jdbc.url"));
		dataSource.setUsername(env.getProperty("jdbc.username"));
		dataSource.setPassword(env.getProperty("jdbc.password"));
		dataSource.setValidationQuery("select 1");

		return dataSource;
	}
	
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		HibernateJpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
		jpaVendorAdapter.setDatabase(Database.MYSQL);
		jpaVendorAdapter.setDatabasePlatform("org.hibernate.dialect.MySQLDialect");
		jpaVendorAdapter.setShowSql(true);
		jpaVendorAdapter.setGenerateDdl(true);

		LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
		factoryBean.setJpaVendorAdapter(jpaVendorAdapter);
		factoryBean.setDataSource(dataSource());
		factoryBean.setPersistenceUnitName("testPersistenceUnit");
		factoryBean.setPackagesToScan(User.class.getPackage().toString().substring(8));
		factoryBean.setPersistenceProvider(new HibernatePersistenceProvider());

		Properties props = new Properties();
		props.put("hibernate.ejb.naming_strategy", "org.hibernate.cfg.ImprovedNamingStrategy");
		props.put("hibernate.event.merge.entity_copy_observer", "allow");
		factoryBean.setJpaProperties(props);
		
		return factoryBean;
	}
	
	@Bean
	public PlatformTransactionManager txManager() {
		JpaTransactionManager txManager = new JpaTransactionManager();
		txManager.setEntityManagerFactory(entityManagerFactory().getObject());
		
		return txManager;
	}

	@Bean
	public TransactionTemplate txTemplate(){
		return new TransactionTemplate(txManager());
	}
}
