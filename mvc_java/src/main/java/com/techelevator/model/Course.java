package com.techelevator.model;

import org.hibernate.validator.constraints.NotBlank;

public class Course {
	private int id;

//	@NotBlank(message = "Must enter a course name")
	private String name;
	private int par;
	private int slope;
	private double rating;
//	@NotBlank(message = "Must enter a city")
	private String city;
//	@NotBlank(message = "Must select your state")
	private String state;
//	@NotBlank(message = "Must enter par for course")

//	@NotBlank(message = "Must enter course rating")
	
//	@NotBlank(message = "Must enter slope")
	
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
	public int getPar() {
		return par;
	}
	public void setPar(int par) {
		this.par = par;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public int getSlope() {
		return slope;
	}
	public void setSlope(int slope) {
		this.slope = slope;
	}
}
