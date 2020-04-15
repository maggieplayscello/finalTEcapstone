package com.techelevator.controller;

import java.util.List;

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
import com.techelevator.model.User.User;
import com.techelevator.model.User.UserDAO;

@Controller
public class MyLeaguesController {

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private courseDAO courseDao;
	
	@Autowired
	private LeagueDAO leagueDao;
	
	
	@RequestMapping(path="/users/{currentUser}/myLeagues", method=RequestMethod.GET)
	public String loadMyLeaguesPage(@PathVariable("currentUser") String currentUser, ModelMap map){
		List<Course> course = courseDao.getAllCourses();
		map.put("allCourses", course);
		List<League> league = leagueDao.getAllLeaguesByUserId(userDao.getIdByUserName(currentUser));
		map.put("allLeagues", league);
		List<User> user = userDao.getAllUsers();
		map.put("allUsers", user);
		return "myLeagues";
	}
	
	@RequestMapping(path = "/users/{currentUser}/addLeague", method = RequestMethod.GET)
	public String showAddLeaguePage(@PathVariable("currentUser") String currentUser, ModelMap map) {
		List<User> user = userDao.getAllUsers();
		map.put("allUsers", user);
		return "createLeague";
	}
	
	@RequestMapping(path= "/users/{currentUser}/addLeague", method = RequestMethod.POST)
	public String processAddLeagueForm(@PathVariable("currentUser") String currentUser, 
			@RequestParam String name, @RequestParam List<String> users) {
		League myLeague = new League();
		myLeague.setName(name);
		myLeague.setOwner(currentUser);
		leagueDao.saveLeague(myLeague);
		for (int x = 0; x < users.size(); x++) {
			leagueDao.addUserToLeague(users.get(x), name);
		}
		return "redirect:/users/{currentUser}/myLeagues";
		
	}
	
//	@RequestMapping (path = "/users/{currentUser}/myLeagues", method = RequestMethod.POST)
//	public String createLeague(@RequestParam String name, @RequestParam String user, @PathVariable("currentUser") String currentUser) {
//		League newLeague = new League();
//		newLeague.setName(name);
//		//how do we update this for multiple users or do we need to separate it out
//		leagueDao.saveLeague(newLeague);
//		return "redirect:/users/{currentUser}/myLeagues";
//	}
//	
//	@RequestMapping (path = "/users/{currentUser}/myLeagues", method = RequestMethod.POST)
//	public String createMatch(@RequestParam LocalDate date, @RequestParam int leagueId, 
//			@RequestParam int numGolfers, @RequestParam int courseId, 			
//			@PathVariable("currentUser") String currentUser) {
//		TeeTime newTeeTime = new TeeTime();
//		newTeeTime.setTime(date);
//		newTeeTime.setLeagueId(leagueId);
//		newTeeTime.setNumGolfers(numGolfers);
//		newTeeTime.setCourseId(courseId);
//		
//		teeTimeDao.saveTeeTime(newTeeTime);
//		return "redirect:/users/{currentUser}/myLeagues";
//	}
	
	
	
}
