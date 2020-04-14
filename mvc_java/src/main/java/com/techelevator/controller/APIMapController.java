package com.techelevator.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.Course.Course;
import com.techelevator.model.Course.courseDAO;
import com.techelevator.model.User.UserDAO;

@Controller
public class APIMapController {

@Autowired
UserDAO userDAO;

@Autowired
courseDAO courseDao;

@RequestMapping (path= "/users/map", method=RequestMethod.GET)
public String testAPI(HttpServletRequest request, ModelMap map) {

	List<Course> courseList = courseDao.getAllCourses();
	
	map.put("courses", courseList);
	
    String apiKey = "AIzaSyAU2WLjSJwad6UxAVzMZP9GGfuNRjqmF-4";
map.addAttribute("request", apiKey);
return "map";
}


}