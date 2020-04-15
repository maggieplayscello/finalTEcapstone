package com.techelevator.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Course.Course;
import com.techelevator.model.Course.courseDAO;
import com.techelevator.model.League.League;
import com.techelevator.model.League.LeagueDAO;
import com.techelevator.model.Score.Score;
import com.techelevator.model.Score.ScoreDAO;
import com.techelevator.model.Team.Team;
import com.techelevator.model.Team.TeamDAO;
import com.techelevator.model.TeeTime.TeeTime;
import com.techelevator.model.TeeTime.TeeTimeDAO;
import com.techelevator.model.User.UserDAO;

@Controller
public class DashboardController {
	
	@Autowired
	private courseDAO courseDao;
	
	@Autowired
	private ScoreDAO scoreDao;
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private TeeTimeDAO teeTimeDao;
	
	@Autowired
	private LeagueDAO leagueDao;
	
	@Autowired
	private TeamDAO teamDao;
	
	
	@RequestMapping(path="/users/{currentUser}/dashboard")
	public String displayDashboard(@PathVariable("currentUser") String currentUser, ModelMap map) {
		List<League> league = leagueDao.getAllLeaguesByUserId(userDao.getIdByUserName(currentUser));
		List<Team> team = teamDao.getTeamsByUserId(userDao.getIdByUserName(currentUser));
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
		map.put("leagues", league);
		map.put("teams", team);
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

	
	@RequestMapping(path = "/users/{currentUser}/scheduleTeeTime", method = RequestMethod.GET)
	public String scheduleTeetime(@PathVariable("currentUser") String currentUser, ModelMap map) {
		LocalTime now = LocalTime.now();
		LocalDate today = LocalDate.now();
		if (now.isAfter(LocalTime.of(17, 0))) {
			today = today.plusDays(1);
		}
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
			@RequestParam int course, @RequestParam String date, HttpSession session) {
		List <LocalDateTime> availableTimes = teeTimeDao.getTeeTimesByCourse(course, date);
		session.setAttribute("availableTimes", availableTimes);
		session.setAttribute("course", course);
		session.setAttribute("date", date);
		return "redirect:/users/{currentUser}/teeTimeSheet";
	}
	
	
	@RequestMapping (path = "/users/{currentUser}/teeTimeSheet", method = RequestMethod.GET)
	public String displayTeeTimeSheet(@PathVariable("currentUser") String currentUser, HttpSession session, ModelMap map){
		session.getAttribute("availableTimes");
		session.getAttribute("course");
		session.getAttribute("date");
		int playerId = userDao.getIdByUserName(currentUser);
		List <TeeTime> userBookings = teeTimeDao.getTeeTimesByGolferIdPastToday(playerId);
		List <String> bookings = new ArrayList<>();
		for (int x=0; x<userBookings.size();x++) {
			bookings.add(userBookings.get(x).getTime().toLocalDate().toString());
		}
		map.put("bookings", bookings);
		
		
		return "teeTimeSheet";
	}
	
	@RequestMapping (path = "/users/{currentUser}/teeTimeSheet", method = RequestMethod.POST)
	public String submitTeeTimeSheet(@PathVariable("currentUser") String currentUser, 
			@RequestParam String times, @RequestParam int golfers, @RequestParam int course) {
		
		int playerId = userDao.getIdByUserName(currentUser);
		TeeTime booking = new TeeTime();
		booking.setCourseId(course);
		booking.setNumGolfers(golfers);
		LocalDate date = teeTimeDao.getDateFromString(times);
		LocalTime time = teeTimeDao.getTimeFromString(times);
		LocalDateTime dateTime = LocalDateTime.of(date, time);
		booking.setTime(dateTime);
		
		teeTimeDao.saveTeeTime(booking, playerId);
		return "redirect:/users/{currentUser}/teeTimeConfirmation";
	}

	@RequestMapping (path = "/users/{currentUser}/teeTimeConfirmation", method = RequestMethod.GET)
	public String displayTeeTimeConfirmation( @PathVariable("currentUser") String currentUser) {
		return "teeTimeConfirmation";
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
			LocalDateTime theDate = LocalDateTime.of(myDate, LocalTime.of(0, 0));
			myTeeTime.setTime(theDate);
			myTeeTime.setNumGolfers(1);
			myTeeTime.setCourseId(courseId);
			teeTimeDao.saveTeeTime(myTeeTime, playerId);
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

}
