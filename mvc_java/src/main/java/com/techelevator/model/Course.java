package com.techelevator.model;

import org.hibernate.validator.constraints.NotBlank;

public class Course {
	private int id;

//	@NotBlank(message = "Must enter a course name")
	private String name;
//	@NotBlank(message = "Must enter a city")
	private String city;
//	@NotBlank(message = "Must select your state")
	private String state;
//	@NotBlank(message = "Must enter par for course")
	private int par;
//	@NotBlank(message = "Must enter course rating")
	private double rating;
//	@NotBlank(message = "Must enter slope")
	private int slope;
	
	
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
