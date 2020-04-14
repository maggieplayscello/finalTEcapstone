package com.techelevator.controller;

import java.time.LocalDate;
import java.util.ArrayList;
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
import com.techelevator.model.TeeTime.TeeTime;
import com.techelevator.model.TeeTime.TeeTimeDAO;
import com.techelevator.model.User.UserDAO;



@Controller
public class HomeController {
	
	@Autowired
	private courseDAO courseDao;
	
	@Autowired
	private ScoreDAO scoreDao;
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private TeeTimeDAO teeTimeDao;

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
		
		List <Score> scores = scoreDao.getAllScoresByUserId(userDao.getIdByUserName(currentUser));
		for(int x = 0; x < scores.size(); x++) {
			String courseName = courseDao.getCourseNameByCourseId(scores.get(x).getCourseId());
			scores.get(x).setCourseName(courseName);
			String dateString = scoreDao.getDateFromScoreId(scores.get(x).getScoreId());
			int year = Integer.parseInt(dateString.substring(0, 4));
			int month = Integer.parseInt(dateString.substring(5, 7));
			int day = Integer.parseInt(dateString.substring(8, 10));
			LocalDate myDate = LocalDate.of(year, month, day);
			scores.get(x).setDate(myDate);
			scores.get(x).setDateString(turnDateIntoString(scores.get(x).getDate()));
		}
		LocalDate today = LocalDate.now();
		String todayString = turnDateIntoString(today);
		
		List<TeeTime> teeTimes = teeTimeDao.getTeeTimesByGolferIdPastToday(userDao.getIdByUserName(currentUser));
		
		map.put("teeTimes", teeTimes);
		map.put("date", todayString);
		map.put("scores", scores);
		return "dashboard";
	}
	
	private String turnDateIntoString(LocalDate date) {
		String todayString = date.toString();
		String buildString = "";
	
		if (todayString.substring(5, 7).contentEquals("01")) {
			buildString = buildString + "January";
		}else if (todayString.substring(5, 7).contentEquals("02")) {
			buildString = buildString + "February";
		}else if (todayString.substring(5, 7).contentEquals("03")) {
			buildString = buildString + "March";
		}else if (todayString.substring(5, 7).contentEquals("04")) {
			buildString = buildString + "April";
		}else if (todayString.substring(5, 7).contentEquals("05")) {
			buildString = buildString + "May";
		}else if (todayString.substring(5, 7).contentEquals("06")) {
			buildString = buildString + "June";
		}else if (todayString.substring(5, 7).contentEquals("07")) {
			buildString = buildString + "July";
		}else if (todayString.substring(5, 7).contentEquals("08")) {
			buildString = buildString + "August";
		}else if (todayString.substring(5, 7).contentEquals("09")) {
			buildString = buildString + "September";
		}else if (todayString.substring(5, 7).contentEquals("10")) {
			buildString = buildString + "October";
		}else if (todayString.substring(5, 7).contentEquals("11")) {
			buildString = buildString + "November";
		}else if (todayString.substring(5, 7).contentEquals("12")) {
			buildString = buildString + "December";
		}
		buildString = buildString + " " + todayString.substring(8, 10) + ", " + todayString.substring(0, 4);
		
		return buildString;
	}

	@RequestMapping(path="/users/{currentUser}/addScore", method=RequestMethod.GET)
	public String displayAddScore(@PathVariable("currentUser") String currentUser, ModelMap map){
		List<Course> course = courseDao.getAllCourses();
		map.put("allCourses", course);		
		return "addScore";
	}	
	
	@RequestMapping (path = "/users/{currentUser}/addScore", method = RequestMethod.POST)
	public String submitScore(@PathVariable("currentUser") String currentUser, 
			@RequestParam String name, @RequestParam int score, @RequestParam(required = false) String date) {
		Score myScore = new Score();
		TeeTime myTeeTime = new TeeTime();
		int courseId = courseDao.getCourseIdByCourseName(name);
		int playerId = userDao.getIdByUserName(currentUser);
		
		if(date != "") {
			int month = Integer.parseInt(date.substring(0, 2));
			int day = Integer.parseInt(date.substring(3, 5));
			int year = Integer.parseInt(date.substring(6, 10));
			LocalDate myDate = LocalDate.of(year, month, day);
			myTeeTime.setTime(myDate);
			myTeeTime.setNumGolfers(1);
			myTeeTime.setCourseId(courseId);
			teeTimeDao.saveTeeTime(myTeeTime);
			int teeTimeId = teeTimeDao.getLastTeeTimeId();
			myScore.setTeeTimeId(teeTimeId);
		}else {
			//this is where we will pull data from tee times table
			myScore.setTeeTimeId(1);
		}
		
		myScore.setCourseId(courseId);
		myScore.setId(playerId);
		myScore.setScore(score);
		scoreDao.saveScore(myScore);
		
		return "redirect:/users/{currentUser}/dashboard";
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
	
	@RequestMapping(path = "/users/{currentUser}/scheduleTeeTime", method = RequestMethod.GET)
	public String scheduleTeetime(@PathVariable("currentUser") String currentUser, ModelMap map) {
		LocalDate today = LocalDate.now();
		List<LocalDate> threeWeeks = new ArrayList <> ();
		for (int x = 0; x <= 21; x++) {
			threeWeeks.add(today);
			today = today.plusDays(1);
		}
		List<Course> course = courseDao.getAllCourses();
		map.put("dates", threeWeeks);
		map.put("allCourses", course);
		return "scheduleTeeTime";
		
	}

	@RequestMapping (path = "/users/{currentUser}/scheduleTeeTime", method = RequestMethod.POST)
	public String submitTeeTimeDateAndCourse(@PathVariable("currentUser") String currentUser, 
			@RequestParam String course, @RequestParam String date) {
		System.out.println(course + " " + date);
		return "redirect:/users/{currentUser}/teeTimeSheet";
	}
	@RequestMapping (path = "/users/{currentUser}/teeTimeSheet", method = RequestMethod.GET)
	public String displayTeeTimeSheet(@PathVariable("currentUser") String currentUser){

		return "teeTimeSheet";
	}
	
}
	