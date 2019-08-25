package me.hyuck.hyuckweb.config.db;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
@MapperScan(value = {"me.hyuck.hyuckweb.mapper.mariadb"}, sqlSessionFactoryRef = "mariadbSqlSessionFactory")
public class MariaDBConfig {

    @Value("${mariadb.datasource.driverClassName:org.mariadb.jdbc.Driver}")
    private String driverClassName;

    @Value("${mariadb.datasource.url:jdbc:mariadb://58.229.105.141:3307/scms}")
    private String url;

    @Value("${mariadb.datasource.username:scms}")
    private String username;

    @Value("${mariadb.datasource.password:nex147200}")
    private String password;

    @Bean
    @Primary
    public DataSource mariadbDataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.setValidationQuery("/* ping */ SELECT 1");
        dataSource.setTestOnBorrow(true);
        return dataSource;
    }

    @Bean
    @Primary
    public SqlSessionFactoryBean mariadbSqlSessionFactory(@Qualifier("mariadbDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();

        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        configuration.setMapUnderscoreToCamelCase(true);

        sessionFactory.setDataSource(dataSource);
        sessionFactory.setConfiguration(configuration);
        sessionFactory.setTypeAliasesPackage("me.hyuck.hyuckweb.domain");
        sessionFactory.setMapperLocations(
                new PathMatchingResourcePatternResolver().getResources(
                        "classpath*:mapper/mariadb/*.xml"
                )
        );
        return sessionFactory;
    }

    @Bean
    @Primary
    public SqlSessionTemplate mariadbSessionTemplate(@Qualifier("mariadbSqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
