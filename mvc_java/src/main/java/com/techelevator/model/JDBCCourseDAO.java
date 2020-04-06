package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCCourseDAO implements courseDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCCourseDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Course> getAllCourses() {
		List <Course> courses = new ArrayList<>();
		
		String sqlSelectAllCourses = "SELECT * FROM courses";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllCourses);
		while (results.next()) {
			courses.add(mapRowToCourse(results));
		}
		return courses;
	}

	private Course mapRowToCourse(SqlRowSet results) {
		// TODO Auto-generated method stub
		return null;
	}

}
