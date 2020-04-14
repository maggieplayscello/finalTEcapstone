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
	public List<Team> getTeamsByUserId(int id) {
		List <Team> teams = new ArrayList<>();
		String sqlSelectAllTeams = "SELECT * FROM teams JOIN golfer_team ON teams.teamid = golfer_team.teamid WHERE golfer_team.id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllTeams, id);
		while (results.next()) {
			teams.add(mapRowToTeam(results));
		}
		return teams;
	}

}
