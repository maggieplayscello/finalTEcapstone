package com.techelevator.model;

import java.util.List;

import com.techelevator.model.Course;

public interface courseDAO {

	List<Course> getAllCourses();
	void addCourseToDatabase(Course theCourse);

}
