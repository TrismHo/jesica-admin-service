package com.trism.jesica.config;

import com.zaxxer.hikari.HikariDataSource;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Slf4j
@Configuration
@EnableJpaRepositories(basePackages = "com.trism.jesica.persistence")
@EnableTransactionManagement
@EnableJpaAuditing // jpa 에서 created_date modified_date 등을 자동으로 넣어주기 위해 사용.
@AllArgsConstructor
public class DataSourceConfig {

    private final Environment env;

    /**
     * JDBC Datasource
     * @return
     */
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.hikari")
    public DataSource dataSource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }

    /**
     * @return
     */
   /* @Bean
    @ConditionalOnClass(HibernateJpaAutoConfiguration.class)
    public LocalContainerEntityManagerFactoryBean entityManagerFactoryBean() {
        LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
        JpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
        emf.setDataSource(dataSource());
        emf.setPackagesToScan("com.trism.manna.persistence");
        emf.setPersistenceUnitName("petview");
        emf.setJpaDialect(new HibernateJpaDialect());
        emf.setPersistenceProviderClass(HibernatePersistenceProvider.class);
        emf.setJpaVendorAdapter(jpaVendorAdapter);


        Properties properties = new Properties();
        properties.setProperty("spring.jpa.properties.hibernate.show_sql", env.getProperty("spring.jpa.properties.hibernate.show_sql"));
        properties.setProperty("spring.jpa.properties.hibernate.format_sql", env.getProperty("spring.jpa.properties.hibernate.format_sql"));
        properties.setProperty("spring.jpa.properties.hibernate.use_sql_comments", env.getProperty("spring.jpa.properties.hibernate.use_sql_comments"));
        *//*properties.setProperty("spring.jpa.properties.hibernate.generate_statistics", env.getProperty("spring.jpa.properties.hibernate.generate_statistics"));
        properties.setProperty("spring.jpa.properties.hibernate.enable_lazy_load_no_trans", env.getProperty("spring.jpa.properties.hibernate.enable_lazy_load_no_trans"));
        properties.setProperty("spring.jpa.properties.hibernate.cache.use_second_level_cache", env.getProperty("spring.jpa.properties.hibernate.cache.use_query_cache"));
        properties.setProperty("spring.jpa.properties.hibernate.cache.region.factory_class", env.getProperty("spring.jpa.properties.hibernate.cache.region.factory_class"));*//*
        emf.afterPropertiesSet();
        log.debug("SSADFDSAF>>>>{}", emf.getJpaPropertyMap());
        return emf;
    }*/

    /*emf.setJpaProperties(properties);*//*
        emf.afterPropertiesSet();
        log.debug("SSADFDSAF>>>>{}", emf.getJpaPropertyMap());
        return emf;
    }


    /**
     * JPA Transaction Manager
     *
     * @param emf
     * @return
     */
//    @Bean
//    public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
//        JpaTransactionManager jtm = new JpaTransactionManager();
//        jtm.setEntityManagerFactory(emf);
//        return jtm;
//    }

}
