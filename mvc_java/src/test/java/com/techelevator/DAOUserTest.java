package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.techelevator.model.User.JDBCUserDAO;
import com.techelevator.model.User.User;
import com.techelevator.security.PasswordHasher;

public class DAOUserTest {

	
	/* Using this particular implementation of DataSource so that
	 * every database interaction is part of the same database
	 * session and hence the same database transaction */
	private static SingleConnectionDataSource dataSource;
	private JDBCUserDAO userdao;
	private PasswordHasher hash;
	
	private final int USER_ID = 10000;
	private final String USER_NAME = "testuser";
	private final String USER_PASSWORD = "KQfZkVIlXcGOeKzFnmmLTw==";
	private final String USER_SALT = "5SfhtBdlFRkFTtUMXnPMHL1eRt0qBATjWi9bvMRxPlhs1Qs0R+taaQvdiSq24QWmJUOYwx+QVPH7DfXcsVnoBYyRZM+W6FrQIEsMyh19EKh3z1nUEvHUjRoGGaQP9cnInpf/t+xtBfpg1pwkHk0VVrwNDWcafxjt98DoT0WwFAo=";
	private final String USER_ROLE = "Golfer";
	
	/* Before any tests are run, this method initializes the datasource for testing. */
	@BeforeClass
	public static void setupDataSource() {
		dataSource = new SingleConnectionDataSource();
		dataSource.setUrl("jdbc:postgresql://localhost:5432/capstone");
		dataSource.setUsername("capstone_appuser");
		dataSource.setPassword("capstone_appuser1");
		/* The following line disables autocommit for connections 
		 * returned by this DataSource. This allows us to rollback
		 * any changes after each test */
		dataSource.setAutoCommit(false);
	}
	
	/* After all tests have finished running, this method will close the DataSource */
	@AfterClass
	public static void closeDataSource() throws SQLException {
		dataSource.destroy();
	}

	/* After each test, we rollback any changes that were made to the database so that
	 * everything is clean for the next test */
	@After
	public void rollback() throws SQLException {
		dataSource.getConnection().rollback();
	}
	
	/* This method provides access to the DataSource for subclasses so that 
	 * they can instantiate a DAO for testing */
	protected DataSource getDataSource() {
		return dataSource;
	}
	
	@Before
	public void setup() {
		
		userdao = new JDBCUserDAO(dataSource, hash);
		
		String sqlInsertUser = "INSERT INTO app_user (id, user_name, password, salt, role) VALUES (?, ?, ?, ?, ?)";
		JdbcTemplate jdbctemplate = new JdbcTemplate (dataSource);
		jdbctemplate.update(sqlInsertUser, USER_ID, USER_NAME, USER_PASSWORD, USER_SALT, USER_ROLE);
		
	}
	
	@Test
	public void testUserIsInDatabase() {
		boolean actual = userdao.verifyUserIsntInDatabase(USER_NAME);
		assertFalse(actual);
	}
	
//	@Test
//	public void testSearchUserNameAndPassword() {
//		boolean actual = userdao.searchForUsernameAndPassword(USER_NAME, USER_PASSWORD);
//		assertTrue(actual);
//	}
	
	@Test
	public void testGetUserByUsername() {
		User expectedUser = new User ();
		expectedUser.setUserName(USER_NAME);
		
		User actualUser = (User) userdao.getUserByUserName(USER_NAME);
		
		assertEquals (expectedUser.getUserName(), actualUser.getUserName());
	}
	
	@Test
	public void testRoleByUsername() {
		
		String actual = userdao.getRoleByUserName(USER_NAME);
		assertEquals (USER_ROLE, actual);
	}
}