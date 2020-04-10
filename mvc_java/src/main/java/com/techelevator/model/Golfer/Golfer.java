package com.techelevator.model.Golfer;

public class Golfer {
	private int golferId;
	private String street;
	private String city;
	private String state;
	private String zip;
	private boolean isInLeague;
	
	public Golfer() {
		
	}
	
	public Golfer(int golferId, String street, String city, String state, String zip) {
		super();
		this.golferId = golferId;
		this.street = street;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.isInLeague = false;
	}
	public int getGolferId() {
		return golferId;
	}
	public void setGolferId(int golferId) {
		this.golferId = golferId;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public boolean isInLeague() {
		return isInLeague;
	}
	public void setInLeague(boolean isInLeague) {
		this.isInLeague = isInLeague;
	}
}
