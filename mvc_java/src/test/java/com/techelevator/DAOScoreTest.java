package com.techelevator;

import static org.junit.Assert.fail;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.techelevator.model.Score.JDBCScoreDAO;
import com.techelevator.model.TeeTime.JDBCTeeTimeDAO;

public class DAOScoreTest {
	
	private static SingleConnectionDataSource dataSource;
	private JDBCScoreDAO scoredao;

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
		
		scoredao = new JDBCScoreDAO(dataSource);
		
		String sqlInsertScore = "INSERT INTO score (teetimeid, time, leagueid, numgolfers, courseid) VALUES (?, ?, ?, ?, ?)";
		JdbcTemplate jdbctemplate = new JdbcTemplate(dataSource);
		jdbctemplate.update(sqlInsertScore, );
	}

}
