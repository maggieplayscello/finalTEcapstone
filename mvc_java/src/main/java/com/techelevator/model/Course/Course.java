package com.techelevator.model.Course;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;

public class Course {
	private int id;

	@NotBlank(message = "Must enter a course name")
	private String name;
	
	@Min (value = 20, message = "Par is too low")
	@Max (value = 100, message = "Par is too high")
	private Integer par;
	
	private Integer slope;
	
	private Double rating;
	
	@NotBlank(message = "Must enter a city")
	private String city;
	
	@NotBlank(message = "Must select your state")
	private String state;
	
	
	public Course() {
		
	}
	
	public Course(int id, String name, int par, int slope, double rating, String city, String state) {
		this.id = id;
		this.name = name;
		this.par = par;
		this.slope = slope;
		this.rating = rating;
		this.city = city;
		this.state = state;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getPar() {
		return par;
	}
	public void setPar(Integer par) {
		this.par = par;
	}
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public Integer getSlope() {
		return slope;
	}
	public void setSlope(Integer slope) {
		this.slope = slope;
	}
}
