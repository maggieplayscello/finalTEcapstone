package com.techelevator.model.Score;

public class Score {
	private int scoreId;
	private int score;
	private int id;
	private int teeTimeId;
	private int courseId;
	
	public Score() {
		
	}
	public int getScoreId() {
		return scoreId;
	}
	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTeeTimeId() {
		return teeTimeId;
	}
	public void setTeeTimeId(int teeTimeId) {
		this.teeTimeId = teeTimeId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
}
