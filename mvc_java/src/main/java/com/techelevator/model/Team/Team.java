package com.techelevator.model.Team;

public class Team {
	private int teamId;
	private String teamName;
	private int leagueId;
	private int points;
	
	public Team() {
	}
	
	public Team(int teamId, String teamName, int leagueId, int points) {
		super();
		this.teamId = teamId;
		this.teamName = teamName;
		this.leagueId = leagueId;
		this.points = points;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
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
	
}
