package com.techelevator.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Course.Course;
import com.techelevator.model.Course.courseDAO;
import com.techelevator.model.Score.Score;
import com.techelevator.model.Score.ScoreDAO;
import com.techelevator.model.User.UserDAO;



@Controller
public class HomeController {
	
	@Autowired
	private courseDAO courseDao;
	
	@Autowired
	private ScoreDAO scoreDao;
	
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path="/")
	public String displayHomePage() {
		return "home";
	}
	
	@RequestMapping(path="/users/{currentUser}/")
	public String displayHomePageUserLoggedIn() {
		return "home";
	}
	
	@RequestMapping(path="/users/{currentUser}/dashboard")
	public String displayDashboard(@PathVariable("currentUser") String currentUser, ModelMap map) {
		if (!map.containsAttribute("score")) {
			map.put("score", new Score());
		}
		
		List <Score> scores = scoreDao.getAllScoresByUserId(userDao.getIdByUserName(currentUser));
		for(int x = 0; x < scores.size(); x++) {
			String courseName = courseDao.getCourseNameByCourseId(scores.get(x).getCourseId());
			scores.get(x).setCourseName(courseName);
		}
		map.put("scores", scores);
		return "dashboard";
	}
	
	@RequestMapping(path="/users/{currentUser}/addScore", method=RequestMethod.GET)
	public String displayAddScore(@PathVariable("currentUser") String currentUser){
		return "addScore";
	}
	
	
	@RequestMapping (path = "/users/{currentUser}/dashboard", method = RequestMethod.POST)
	public String submitScore(@Valid @ModelAttribute Score score, @PathVariable("currentUser") String currentUser, BindingResult result, RedirectAttributes flash) {
		
		flash.addFlashAttribute("score", score);
		
		if (result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "score", result);
			return "redirect:/dashboard";
		}
		scoreDao.saveScore(score);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(path= {"/courseSearch", "/users/{currentUser}/courseSearch"})
	public String displayCourse(@PathVariable(required = false) String currentUser, ModelMap map) {
		List<Course> course = courseDao.getAllCourses();
		map.put("allCourses", course);
		return "courseSearch";
	}
	
	
	@RequestMapping(path="/courseSearchResults")
	public String displayCourseSearch(@RequestParam(required = false) String searchName, @RequestParam(required = false) String searchCity, ModelMap map) {
		List<Course> course = courseDao.searchCourses(searchName, searchCity, map);
		map.put("allCourses", course);
		return "courseSearch";
	}
		
	@RequestMapping(path="/users/{currentUser}/addCourse", method = RequestMethod.GET)
	public String displayAddCourse(@PathVariable("currentUser") String currentUser, ModelMap map) {
		if (!map.containsAttribute("course")) {
			map.put("course", new Course());
		}
		return "addCourse";
	}
	
	@RequestMapping (path = "/users/{currentUser}/addCourse", method = RequestMethod.POST)
	public String submitCourse(@Valid @ModelAttribute Course course, @PathVariable("currentUser") String currentUser, BindingResult result, RedirectAttributes flash) {
		
		flash.addFlashAttribute("course", course);
		
		if (result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "course", result);
			return "redirect:/addCourse";
		}
		courseDao.addCourseToDatabase(course);
		return "redirect:/users/{currentUser}/addCourseConfirmation";
	}
	
	@RequestMapping (path = "/users/{currentUser}/addCourseConfirmation", method = RequestMethod.GET)
	public String courseConfirmation( @PathVariable("currentUser") String currentUser){
		return "addCourseConfirmation";
	}
	
	
	
}
	