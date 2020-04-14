package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.Course.Course;
import com.techelevator.model.Course.courseDAO;
import com.techelevator.model.League.League;
import com.techelevator.model.League.LeagueDAO;
import com.techelevator.model.Score.ScoreDAO;
import com.techelevator.model.TeeTime.TeeTime;
import com.techelevator.model.TeeTime.TeeTimeDAO;
import com.techelevator.model.User.User;
import com.techelevator.model.User.UserDAO;

@Controller
public class MyLeaguesController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private courseDAO courseDao;
	
	@Autowired
	private ScoreDAO scoreDao;
	
	@Autowired
	private TeeTimeDAO teeTimeDao;
	
	@Autowired
	private LeagueDAO leagueDao;
	
	
	@RequestMapping(path="/users/{currentUser}/myLeagues", method=RequestMethod.GET)
	public String loadMyLeaguesPage(@PathVariable("currentUser") String currentUser, ModelMap map){
		List<Course> course = courseDao.getAllCourses();
		map.put("allCourses", course);
		List<League> league = leagueDao.getAllLeagues();
		map.put("allLeagues", league);
		List<User> user = userDao.getAllUsers();
		map.put("allUsers", user);
		return "myLeagues";
	}
	
//	@RequestMapping (path = "/users/{currentUser}/myLeagues", method = RequestMethod.POST)
//	public String createLeague(League league, @PathVariable("currentUser") String currentUser) {
//		leagueDao.saveLeague(league);
//		return "redirect:/users/{currentUser}/myLeagues";
//	}
//	
//	@RequestMapping (path = "/users/{currentUser}/myLeagues", method = RequestMethod.POST)
//	public String createMatch(TeeTime teeTime, @PathVariable("currentUser") String currentUser) {
//		teeTimeDao.saveTeeTime(teeTime);
//		return "redirect:/users/{currentUser}/myLeagues";
//	}
//	
//	
	
}
