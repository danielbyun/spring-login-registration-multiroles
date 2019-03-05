package com.danielbyun.loginRegistrationMultiroles.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.DriverManagerDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;
import java.util.logging.Logger;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.danielbyun.loginRegistrationMultiroles.*")
@PropertySource("classpath:persistence-mysql.properties")
public class AppConfig implements WebMvcConfigurer {
    @Autowired
    private Environment environment;

    // logger for diagnostic stuff
    private Logger logger = Logger.getLogger(getClass().getName());

    // view resolver
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();

        internalResourceViewResolver.setPrefix("/WEB-INF/view/");
        internalResourceViewResolver.setSuffix(".jsp");

        return internalResourceViewResolver;
    }

    // resource handler
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry resourceHandlerRegistry) {
        resourceHandlerRegistry
                .addResourceHandler("/resource/**")
                .addResourceLocations("/resource/");
    }

    // define bean for datasource
//    @Bean
//    public DataSource dataSource() {
//        // create connection pool
//        ComboPooledDataSource dataSource = new ComboPooledDataSource();
//
//        // set the jdbc driver class
//        try {
//            // read db configs from the resource file
//            dataSource.setDriverClass(environment.getProperty("jdbc.driverClass"));
//        } catch (PropertyVetoException exc) {
//            throw new RuntimeException(exc);
//        }
//
//        // log the connection props
//        // check if we're reading the correct data from the properties file
//        logger.info(">> jdbc.url = " + environment.getProperty("jdbc.url"));
//        logger.info(">> jdbc.user = " + environment.getProperty("jdbc.user"));
//
//        // set database connection props
//        dataSource.setJdbcUrl(environment.getProperty("jdbc.url"));
//        dataSource.setUser(environment.getProperty("jdbc.user"));
//        dataSource.setPassword(environment.getProperty("jdbc.password"));
//
//        // set connection pool props
//        dataSource.setInitialPoolSize(getIntProperties("connection.pool.initialPoolSize"));
//        dataSource.setMinPoolSize(getIntProperties("connection.pool.minPoolSize"));
//        dataSource.setMaxPoolSize(getIntProperties("connection.pool.maxPoolSize"));
//        dataSource.setMaxIdleTime(getIntProperties("connection.pool.maxIdleTime"));
//
//        return dataSource;
//    }

    // datasource bean for heroku
    @Bean
    public DataSource dataSource() throws URISyntaxException {
        URI dbUri = new URI(System.getenv("CLEARDB_DATABASE_URL"));

        String username = dbUri.getUserInfo().split(":")[0];
        String password = dbUri.getUserInfo().split(":")[1];
        String dbUrl = "jdbc:mysql://" + dbUri.getHost() + dbUri.getPath();

        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setJdbcUrl(dbUrl);
        dataSource.setUser(username);
        dataSource.setPassword(password);

        return dataSource;
    }

    private int getIntProperties(String propName) {
        String propVal = environment.getProperty(propName);

        // now convert string into int
        int intPropVal = Integer.parseInt(propVal);

        return intPropVal;
    }

    // get hibernate properties from .properties file
    private Properties getHibernateProperties() {
        // set hibernate properties
        Properties props = new Properties();

        props.setProperty("hibernate.dialect", environment.getProperty("hibernate.dialect"));
        props.setProperty("hibernate.show_sql", environment.getProperty("hibernate.show_sql"));

        return props;
    }
}
