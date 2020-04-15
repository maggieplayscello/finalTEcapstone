package com.techelevator.model.Team;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCTeamDAO implements TeamDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCTeamDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private Team mapRowToTeam(SqlRowSet results) {
		Team team = new Team();
		team.setTeamId(results.getInt("teamid"));
		team.setName(results.getString("teamname"));
		team.setLeagueId(results.getInt("leagueid"));
		team.setPoints(results.getInt("points"));
		return team;
	}
	
	@Override
	public List<Team> getAllTeams() {
		List <Team> teams = new ArrayList<>();
		String sqlSelectAllTeams = "SELECT * FROM teams";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllTeams);
		while (results.next()) {
			teams.add(mapRowToTeam(results));
		}
		return teams;
	}

	@Override
	public Team getTeamByTeamId(int teamId) {
		Team team = new Team();
		String sqlSelectAllTeams = "SELECT * FROM teams WHERE teamid = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllTeams, teamId);
		while (results.next()) {
			team = (mapRowToTeam(results));
		}		
		return team;
	}

	@Override
	public List<Team> getTeamsByLeagueId(int leagueId) {
		List <Team> teams = new ArrayList<>();
		String sqlSelectAllTeams = "SELECT * FROM teams WHERE leagueid = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllTeams, leagueId);
		while (results.next()) {
			teams.add(mapRowToTeam(results));
		}
		return teams;
	}
	
	@Override
	public List<Team> getTeamsByLeagueIdAndUserId(int leagueId, int userId) {
		List <Team> teams = new ArrayList<>();
		String sqlSelectAllTeams = "SELECT * FROM teams JOIN league_golfer ON league_golfer.leagueid = "
				+ "teams.leagueid WHERE leagueid = ? AND league_golfer.id = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllTeams, leagueId, userId);
		while (results.next()) {
			teams.add(mapRowToTeam(results));
		}
		return teams;
	}

	@Override
	public List<Team> getTeamsByUserId(int id) {
		List <Team> teams = new ArrayList<>();
		String sqlSelectAllTeams = "SELECT * FROM teams JOIN golfer_team ON teams.teamid = golfer_team.teamid WHERE golfer_team.id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllTeams, id);
		while (results.next()) {
			teams.add(mapRowToTeam(results));
		}
		return teams;
	}

	@Override
	public List<Team> getRankingByLeagueId(int leagueId) {
		List <Team> rankedTeams = new ArrayList<>();
		String sqlGetRanking = "SELECT * FROM teams JOIN golfer_team ON teams.teamid = golfer_team.teamid WHERE points >= 0 AND leagueid = ? ORDER BY points DESC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetRanking, leagueId);
		while (results.next()) {
			rankedTeams.add(mapRowToTeam(results));
		}
		return rankedTeams;
	}
	
	@Override
	public int getRankingByUserIdAndLeagueId(int leagueId, int userId) {
		int ranking = 0;
		List <Integer> rankedTeams = new ArrayList<>();
		String sqlGetRanking = "SELECT * FROM teams JOIN golfer_team ON teams.teamid = golfer_team.teamid WHERE points >= 0 AND leagueid = ? ORDER BY points DESC";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetRanking, leagueId);
		while (results.next()) {
			rankedTeams.add(results.getInt("userId"));
		}
		for(int i = 1; i < rankedTeams.size(); i++) {
			if (rankedTeams.contains(userId)) {
				ranking = i;
			}
		}
		return ranking;
	}
	
	

}
