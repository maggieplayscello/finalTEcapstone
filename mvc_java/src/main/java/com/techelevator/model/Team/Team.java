package com.techelevator.model.Team;

public class Team {
	private int teamId;
	private String name;
	private int leagueId;
	private int points;
	private int ranking;
	private double averageScore;
	
	public Team() {
	}
	
	public Team(int teamId, String name, int leagueId, int points) {
		super();
		this.teamId = teamId;
		this.name = name;
		this.leagueId = leagueId;
		this.points = points;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLeagueId() {
		return leagueId;
	}

	public void setLeagueId(int leagueId) {
		this.leagueId = leagueId;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	public double getAverageScore() {
		return averageScore;
	}

	public void setAverageScore(double averageScore) {
		this.averageScore = averageScore;
	}
	
}
