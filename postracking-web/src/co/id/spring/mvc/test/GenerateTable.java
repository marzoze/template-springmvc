package co.id.spring.mvc.test;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration; 
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GenerateTable {
	public static void main(String[] args) throws SQLException {
		AbstractApplicationContext appContext =	new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		DataSource dataSource = (DataSource) appContext.getBean("dataSource");
		Configuration cfg =	new AnnotationConfiguration().configure("hibernate.cfg.xml");		
		Connection conn = dataSource.getConnection();
		new SchemaExport(cfg, conn).create(true, true);		
		System.exit(0);
	}
}
