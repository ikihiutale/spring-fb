package com.foo.configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
//import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@ComponentScan({ "com.foo.configuration" })
@PropertySource(value = { "classpath:application.properties" })
public class HibernateConfiguration {
	
	private final Logger LOGGER = LoggerFactory.getLogger(HibernateConfiguration.class);
	
    @Autowired
    private Environment environment;

    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        final String[] packagesToScan = {"com.foo"};
        sessionFactory.setPackagesToScan(packagesToScan);
        sessionFactory.setHibernateProperties(hibernateProperties());
        return sessionFactory;
     }
	
    @Bean
    public DataSource dataSource() {
    	
    	// BasicDataSource dataSource = new BasicDataSource();
    	DriverManagerDataSource dataSource = new DriverManagerDataSource();
    	LOGGER.debug("JDBC DRIVER: {}, URL: {}", environment.getProperty("jdbc.driverClassName"), environment.getProperty("jdbc.url"));
        dataSource.setDriverClassName(environment.getProperty("jdbc.driverClassName"));
        dataSource.setUrl(environment.getProperty("jdbc.url"));
        dataSource.setUsername(environment.getProperty("jdbc.username"));
        dataSource.setPassword(environment.getProperty("jdbc.mypassword"));
   
        return dataSource;
    }
    
    private Properties hibernateProperties() {
        Properties properties = new Properties();
    	LOGGER.debug("HIBERNATE DIALECT: {}", environment.getRequiredProperty("hibernate.dialect"));
    	
        properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
        properties.put("hibernate.connection.driver_class", environment.getRequiredProperty("hibernate.connection.driver_class"));
        properties.put("hibernate.connection.url", environment.getRequiredProperty("hibernate.connection.url"));
        properties.put("hibernate.connection.username", environment.getRequiredProperty("hibernate.connection.username"));
        properties.put("hibernate.connection.password", environment.getRequiredProperty("hibernate.connection.password"));
        properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
        properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
        properties.put("hibernate.globally_quoted_identifiers", "true");
        
        return properties;        
    }
    
	@Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
       HibernateTransactionManager txManager = new HibernateTransactionManager();
       txManager.setSessionFactory(s);
       return txManager;
    }
}
