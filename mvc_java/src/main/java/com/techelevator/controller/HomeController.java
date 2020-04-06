package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techelevator.model.Course;
import com.techelevator.model.courseDAO;


@Controller
public class HomeController {
	
	@Autowired
	private courseDAO courseDao;

	@RequestMapping(path="/")
	public String displayHomePage() {
		return "Home";
	}
	
	@RequestMapping(path="/addCourse")
	public String displayAddCourse(ModelMap map) {
		if (!map.containsAttribute("course")) {
			map.put("course", new Course());
		}
		List<Course> courses = courseDao.getAllCourses();
		
		map.addAttribute("courses", courses);
		return "addCourse";
	}
	
	
}
	