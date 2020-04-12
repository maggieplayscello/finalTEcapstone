//package com.techelevator.controller;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.client.RestTemplate;
//
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.JsonNode;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.techelevator.model.APIMapDAO;
//import com.techelevator.model.Course.Course;
//import com.techelevator.model.User.User;
//import com.techelevator.model.User.UserDAO;
//
//@Controller
//public class APIMapController {
//
//	@Autowired
//	UserDAO userDAO;
////	@Autowired
////	PreferenceDAO preferenceDAO;
//	@Autowired
//	APIMapDAO mapDAO;
//	
//	// Maps user info; i.e. center point for the radius; We discussed using a searchCity (zip) as the center of the radius.
//	// if the searchCity = "", then we should execute the userName GET method, else map searchCity
//	@RequestMapping (path= "??????users/match??????/{userName}", method=RequestMethod.GET)
//	public String testAPI(@PathVariable String userName, HttpServletRequest request, ModelMap map) throws JsonProcessingException, IOException {
//		// https://developer.tomtom.com/user/me/apps
//		String apiKey = "rFxvuu7wyYEevwJv4dJoHVNeyZEq0Sqm";
//	User user = (User)userDAO.getUserByUserName(userName);
////??	String apisearchZip = user.getZip().replace(" ", "%20");
//	
//	// pulls search radius from the dropdown menu; radius is in meters=miles*16000
////??	int searchRadius = user.getSearchRadius();
//	
//	// pulls user address from the db. Default condition is use the user home address. Override condition is to user the dropdown searchCity condition.
////??	String searchAddress = user.getAddress();
//	//List<Preference> prefList = preferenceDAO.getUserPreferences(user.getId());
//	//String apiPrefs = user.getPrefsForAPI(prefList);
//	
//	//remove all spaces; maps the user location 
//	String requestAPI = "https://api.tomtom.com/search/2/geocode/"+    "76%20Clairview%2C%20Grosse%20Pointe%20Shores%2C%20MI%2048236"   +  ".xml?"
//			+ "countrySet=US&lat="  + 42.4248 + "&lon=" + -82.8858  +"&radius="  + "16000" +     "&topLeft=45%2C-85&btmRight=40%2C-80&"
//			+ "language=en-GB&key=" + apiKey;   
////	String requestAPI = "https://developers.zomato.com/api/v2.1/search?q=" +apiPrefs + "&start=0&count=100&radius=" +
////			user.getMilerangeForAPI(user.getMilerange()) + "&apikey=" + keyValue + "&address=" + apiUserAddress;
//	HttpEntity<String> httpEntity = new HttpEntity<>("");
//	RestTemplate restTemplate = new RestTemplate();
//	ResponseEntity<String> response = restTemplate.exchange(requestAPI, HttpMethod.GET, httpEntity, String.class);
//	ObjectMapper objectMapper = new ObjectMapper();
//	JsonNode jsonNode = objectMapper.readTree(response.getBody());
//
//	List<Course> courses = new ArrayList<>();
//    for (int i=0; i < jsonNode.path("courses").size(); i++) {
//        Course course = new Course();
////??        course.setCourseId(jsonNode.path("courses").path(i).path("course").path("R").path("course_id").asText());
//        course.setName(jsonNode.path("courses").path(i).path("course").path("name").asText());
//        //course.setCuisine(jsonNode.path("restaurants").path(i).path("course").path("cuisines").asText());
//        //displays a restaurant photo - we have no plans to include a course photo at this time
////        if(jsonNode.path("restaurants").path(i).path("restaurant").path("photos").path(0).path("photo").path("url").asText().contentEquals("")) {
////        	
////        	restaurant.setPhotoUrl("http://localhost:8080/capstone/img/noimg.png");
////        }
////        else {
////        	restaurant.setPhotoUrl(jsonNode.path("restaurants").path(i).path("restaurant").path("photos").path(0).path("photo").path("url").asText());
////        }
//        
////        course.setDisplay(false);
////        course.setAddress(jsonNode.path("courses").path(i).path("course").path("location").path("address").asText());
////        course.setLatitude(jsonNode.path("courses").path(i).path("course").path("location").path("latitude").asText());
////        course.setLongitude(jsonNode.path("courses").path(i).path("course").path("location").path("longitude").asText());
////        courses.add(course);
////    }
////    	courseDAO.addAllMatchesToDatabase(courses);
////        request.setAttribute("match", courses);
////        map.put("user", userDAO.getUserByUserName(userName));
//System.out.println("First Test Line - GET");
//    
////    return "match";
//    }
//    return null;
//	}
//	
////	@RequestMapping(path = "users/match/{userName}", method = RequestMethod.POST)
////	public String addToFavorites(@PathVariable String userName, @RequestParam String resId){
////		restaurantDAO.addFavoriteRestaurant(userDAO.getUserIdWithName(userName), resId);
////		return "favorites";
////	}
//	
////	@RequestMapping(path="users/match/{userName}", method = RequestMethod.DELETE)
////	public String dislike (@PathVariable String userName, @RequestParam String resId) {
////		restaurantDAO.dislikeRestaurant(resId);
////		return"favorites";
////	}
//	
////	@RequestMapping (path= "/restaurantDetails/{resId}/{userName}", method = RequestMethod.POST)
////	public String addLikeFromDetails(@PathVariable String userName, @PathVariable String resId) {
////		restaurantDAO.addFavoriteRestaurant(userDAO.getUserIdWithName(userName), resId);
////		return "favorites";
////	}
//	
//	// maps the courses
//	@RequestMapping (path= "/courseDetails/{courseId}/{userName}")
//	public String getCourseDetails(@PathVariable String resId, @PathVariable String userName, HttpServletRequest request, ModelMap map) throws JsonProcessingException, IOException {
//		//String apiURL = "https://developers.zomato.com/api/v2.1/restaurant?res_id=";
//		String apiKey = "rFxvuu7wyYEevwJv4dJoHVNeyZEq0Sqm";
//		String requestAPI = "https://api.tomtom.com/search/2/geocode/"+    "76%20Clairview%2C%20Grosse%20Pointe%20Shores%2C%20MI%2048236"   +  ".xml?"
//				+ "countrySet=US&lat="  + 42.4248 + "&lon=" + -82.8858  +"&radius="  + "16000" +     "&topLeft=45%2C-85&btmRight=40%2C-80&"
//				+ "language=en-GB&key=" + apiKey; 
//		
////??	String requestAPI = apiURL + courseId + "&apikey=" + apiKey;
//		
//		HttpEntity<String> httpEntity = new HttpEntity<>("");
////??	CourseTemplate courseTemplate = new CourseTemplate();
////??		ResponseEntity<String> response = courseTemplate.exchange(requestAPI, HttpMethod.GET, httpEntity, String.class);
//		ObjectMapper objectMapper = new ObjectMapper();
////??		JsonNode jsonNode = objectMapper.readTree(response.getBody());
//		
//		Course course = new Course();
////		course.setResId(jsonNode.path("R").path("res_id").asText());
////		course.setName(jsonNode.path("name").asText());
////		if(jsonNode.path("R").path("photos_url").asText().contentEquals("")) {
////			restaurant.setPhotoUrl("http://localhost:8080/capstone/img/noimg.png");
////		}
////		else {
////			restaurant.setPhotoUrl(jsonNode.path("photos").path(0).path("photo").path("url").asText());
////		}
////	
////		restaurant.setPhoneNumber(jsonNode.path("phone_numbers").asText());
////		restaurant.setCuisine(jsonNode.path("cuisines").asText());
////		restaurant.setHours(jsonNode.path("timings").asText());
////		restaurant.setRating(jsonNode.path("user_rating").path("aggregate_rating").asText());
////		restaurant.setAddress(jsonNode.path("location").path("address").asText());
////		restaurant.setLatitude(jsonNode.path("location").path("latitude").asText());
////		restaurant.setLongitude(jsonNode.path("location").path("longitude").asText());
////		restaurant.setRatingText(jsonNode.path("user_rating").path("rating_text").asText());
////		restaurant.setCostForTwo(jsonNode.path("average_cost_for_two").asText());
////		request.setAttribute("details", restaurant);
////		map.put("user",userDAO.getUserByUserName(userName));
////		return"details";
////	}
//	
////	@RequestMapping (path= "/users/favorites/{userName}", method=RequestMethod.POST)
////		public String displayUserFavorites(@PathVariable String userName, ModelMap map) {
////		map.put("favorites", restaurantDAO.displayFavorites(userDAO.getUserByUserName(userName)));
////		map.put("user",userDAO.getUserByUserName(userName));
////		return "favorites";
////		
////	}
//	
////	@RequestMapping (path= "/users/favorites/{userName}", method=RequestMethod.DELETE)
////	public String dislike(@PathVariable String userName, ModelMap map) {
////	System.out.println("in the delete.");
////	map.put("favorites", restaurantDAO.displayFavorites(userDAO.getUserByUserName(userName)));
////	map.put("user",userDAO.getUserByUserName(userName));
////	return "favorites";
////	
////}
//	return null;
//	}
//
//};

