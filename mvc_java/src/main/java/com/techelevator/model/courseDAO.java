package com.techelevator.model;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.techelevator.model.Course;

public interface courseDAO {

	List<Course> getAllCourses();
	
	List<Course> searchCourses(String searchName, String searchCity, ModelMap map);

	void addCourseToDatabase(Course theCourse);


}
