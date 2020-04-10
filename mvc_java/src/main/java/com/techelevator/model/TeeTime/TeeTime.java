package com.techelevator.model.TeeTime;

import java.time.LocalDate;

public class TeeTime {
	private int teeTimeId;
	private LocalDate time;
	private int leagueId;
	private int numGolfers;
	private int courseId;
	
	public TeeTime () {
		
	}
	
	public int getTeeTimeId() {
		return teeTimeId;
	}
	public void setTeeTimeId(int teeTimeId) {
		this.teeTimeId = teeTimeId;
	}
	public LocalDate getTime() {
		return time;
	}
	public void setTime(LocalDate time) {
		this.time = time;
	}
	public int getLeagueId() {
		return leagueId;
	}
	public void setLeagueId(int leagueId) {
		this.leagueId = leagueId;
	}
	public int getNumGolfers() {
		return numGolfers;
	}
	public void setNumGolfers(int numGolfers) {
		this.numGolfers = numGolfers;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
}
