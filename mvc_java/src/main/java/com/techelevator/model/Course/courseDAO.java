package com.techelevator.model.Course;

import java.util.List;

import org.springframework.ui.ModelMap;

public interface courseDAO {

	List<Course> getAllCourses();
	
	List<Course> searchCourses(String searchName, String searchCity, ModelMap map);

	void addCourseToDatabase(Course theCourse);

	String getCourseNameByCourseId(int id);


}
