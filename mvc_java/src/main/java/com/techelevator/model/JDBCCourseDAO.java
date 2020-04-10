package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class JDBCCourseDAO implements courseDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCCourseDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Course> getAllCourses() {
		List <Course> courses = new ArrayList<>();
		
		String sqlSelectAllCourses = "SELECT * FROM courses ORDER BY name";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllCourses);
		while (results.next()) {
			courses.add(mapRowToCourse(results));
		}
		return courses;
	}
	
	@Override
	public List<Course> searchCourses(@RequestParam(required = false) String searchName, @RequestParam(required = false) String searchCity, ModelMap map) {
		List<Course> courses = new ArrayList<>();
		if (searchName == "" && searchCity != "") {
			searchName = "LKJDLKJDLKJDLKJDF";
		}
		if(searchCity == "" && searchName != "") {
			searchCity = "LDKJDLKFJSDF";
		}
		
		String sql = "SELECT * FROM courses WHERE UPPER(name) LIKE ? OR UPPER(city) LIKE ? ORDER BY name";
		if (searchName != "LKJDLKJDLKJDLKJDF" && searchCity != "LDKJDLKFJSDF") {
			sql = "SELECT * FROM courses WHERE UPPER(name) LIKE ? AND UPPER(city) LIKE ? ORDER BY name";
		}
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, searchName.toUpperCase() + "%", searchCity.toUpperCase() + "%");
		while (results.next()) {
			courses.add(mapRowToCourse(results));
		}
		return courses;
	}

	private Course mapRowToCourse(SqlRowSet results) {
		Course theCourse = new Course();
		
		theCourse.setName(results.getString("name"));
		theCourse.setRating(results.getDouble("rating"));
		theCourse.setSlope(results.getInt("slope"));
		theCourse.setPar(results.getInt("par"));
		theCourse.setAddress(results.getString("address"));
		theCourse.setCity(results.getString("city"));
		theCourse.setState(results.getString("state"));
		theCourse.setZip(results.getInt("zip"));
		return theCourse;
	}

	@Override
	public void addCourseToDatabase(Course theCourse) {
		String sqlAddCourse = "INSERT INTO courses (name, rating, slope, par, address, city, state, zip) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddCourse, theCourse.getName(), theCourse.getRating(), theCourse.getSlope(), theCourse.getPar(), theCourse.getAddress(), theCourse.getCity(), theCourse.getState(), theCourse.getZip());		
	}

}
