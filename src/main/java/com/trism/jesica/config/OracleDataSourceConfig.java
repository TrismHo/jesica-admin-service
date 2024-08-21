package com.trism.jesica.config;

import com.zaxxer.hikari.HikariDataSource;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;

import javax.sql.DataSource;

@Slf4j
@Configuration

@EnableJpaRepositories(
        basePackages = "com.trism.jesica.persistence.oracle",
        entityManagerFactoryRef = "oracleEntityManagerFactory",
        transactionManagerRef = "oracleTransactionManager"
)
//@EnableTransactionManagement
@EnableJpaAuditing // jpa 에서 created_date modified_date 등을 자동으로 넣어주기 위해 사용.
@AllArgsConstructor
@EntityScan("com.trism.jesica.persistence.oracle.Entity")
public class OracleDataSourceConfig {


    @Bean
    @ConfigurationProperties(prefix = "spring.service-manna.datasource.hikari")
    public DataSource oracleDataSource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }

    @Bean(name = "oracleEntityManagerFactory")
    public LocalContainerEntityManagerFactoryBean oracleEntityManagerFactory(@Qualifier("oracleDataSource") DataSource dataSource) {
        LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
        emf.setDataSource(dataSource);
        emf.setPackagesToScan("com.trism.jesica.persistence.oracle"); // Oracle 엔티티 패키지
        emf.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        return emf;
    }


    @Bean(name = "oracleTransactionManager")
    public PlatformTransactionManager oracleTransactionManager(@Qualifier("oracleEntityManagerFactory") LocalContainerEntityManagerFactoryBean emf) {
        return new JpaTransactionManager(emf.getObject());
    }

    @Bean(name = "oracleJdbcTemplateManager")
    public JdbcTemplate oracleJdbcTemplate(@Qualifier("oracleDataSource") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

    @Bean(name = "oracleSimpleJdbcCallManager")
    public SimpleJdbcCall oracleSimpleJdbcCall(@Qualifier("oracleDataSource") DataSource dataSource) {
        return new SimpleJdbcCall(dataSource);
    }

}
