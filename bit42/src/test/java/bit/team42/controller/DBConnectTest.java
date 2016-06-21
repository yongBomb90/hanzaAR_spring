package bit.team42.controller;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DBConnectTest {
	
	@Inject
	private DataSource data;
	
	@Inject
	private SqlSessionFactory fac;
	
	@Inject
	private SqlSession session;

	@Test
	public void test() {
		
		try {
			Connection con = data.getConnection();
			System.out.println("Connection    :   "+ con);
			System.out.println("factory  :  " + fac);
			System.out.println("session  :  "+session);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
