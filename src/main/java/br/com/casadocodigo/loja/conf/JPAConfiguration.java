package br.com.casadocodigo.loja.conf;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;


import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;


//Aqui o spring ativa o gerenciamento de transações e já reconhece o TransactionManager
@EnableTransactionManagement
public class JPAConfiguration {

  @Bean//metodo gerenciados pelo spring
  public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
      LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();

      JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
      factoryBean.setJpaVendorAdapter(vendorAdapter);
      System.out.println("Conectando...");
      DriverManagerDataSource dataSource = new DriverManagerDataSource();
      dataSource.setUsername("eduardo");
      dataSource.setPassword("");
      dataSource.setUrl("jdbc:postgresql://localhost:5432/casadocodigo?autoReconnect=true&useSSL=false");
      dataSource.setDriverClassName("org.postgresql.Driver");


      factoryBean.setDataSource(dataSource);

      Properties properties = new Properties();
      properties.setProperty("database-platform", "org.hibernate.dialect.PostgreSQLDialect");
      properties.setProperty("hibernate.show_sql", "true");          
      properties.setProperty("hibernate.format_sql","false");     		  
     // properties.setProperty("hibernate.hbm2ddl.auto", "create");
      properties.setProperty("hibernate.hbm2ddl.auto", "update");
      //properties.put("hibernate.default_schema", "tb_produto");

      factoryBean.setJpaProperties(properties);

      factoryBean.setPackagesToScan("br.com.casadocodigo.loja.models");
      System.out.println("Conectado...");
      return factoryBean;

  }

  @Bean
  public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
      return new JpaTransactionManager(emf);

  }


}
