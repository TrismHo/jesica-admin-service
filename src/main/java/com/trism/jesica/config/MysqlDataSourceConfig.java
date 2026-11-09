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
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.SharedEntityManagerCreator;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

@Slf4j
@Configuration
@AllArgsConstructor
@EnableJpaAuditing
@EntityScan("com.trism.jesica.persistence.mysql.Entity")
@EnableJpaRepositories(
        basePackages = "com.trism.jesica.persistence.mysql",
        entityManagerFactoryRef = "mysqlEntityManagerFactory",
        transactionManagerRef = "mysqlTransactionManager"
)
public class MysqlDataSourceConfig {

    private final Environment env;

    /**
     * MySQL DataSource
     *
     * 기본 DB이기 때문에 Primary
     */
    @Primary
    @Bean(name = "mysqlDataSource")
    @ConfigurationProperties(
            prefix = "spring.service-pick.datasource.hikari"
    )
    public DataSource mysqlDataSource() {

        return DataSourceBuilder
                .create()
                .type(HikariDataSource.class)
                .build();
    }


    /**
     * MySQL EntityManagerFactory
     *
     * 기본 EntityManagerFactory
     */
    @Primary
    @Bean(name = "mysqlEntityManagerFactory")
    public LocalContainerEntityManagerFactoryBean mysqlEntityManagerFactory(
            @Qualifier("mysqlDataSource")
            DataSource dataSource
    ) {

        LocalContainerEntityManagerFactoryBean emf =
                new LocalContainerEntityManagerFactoryBean();

        emf.setDataSource(dataSource);

        emf.setPackagesToScan(
                "com.trism.jesica.persistence.mysql"
        );

        emf.setJpaVendorAdapter(
                new HibernateJpaVendorAdapter()
        );

        emf.setPersistenceUnitName("mysql");

        return emf;
    }


    /**
     * ★ 중요
     *
     * EntityManager를 직접 주입하는 기존 RepositoryImpl에서
     * 아무 Qualifier가 없으면 MySQL을 사용하도록 함.
     */
    @Primary
    @Bean(name = "mysqlEntityManager")
    public EntityManager mysqlEntityManager(
            @Qualifier("mysqlEntityManagerFactory")
            EntityManagerFactory entityManagerFactory
    ) {

        return SharedEntityManagerCreator
                .createSharedEntityManager(
                        entityManagerFactory
                );
    }


    /**
     * MySQL TransactionManager
     *
     * @Transactional 에 transactionManager가 지정되지 않으면
     * MySQL 사용
     */
    @Primary
    @Bean(name = "mysqlTransactionManager")
    public PlatformTransactionManager mysqlTransactionManager(
            @Qualifier("mysqlEntityManagerFactory")
            EntityManagerFactory entityManagerFactory
    ) {

        return new JpaTransactionManager(
                entityManagerFactory
        );
    }
}
