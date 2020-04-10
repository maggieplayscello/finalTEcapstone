package com.techelevator.model.League;

import java.util.List;

public interface LeagueDAO {
	public List<League> getAllLeagues();
	
	public League getLeagueByLeagueId(int leagueId);
	
}
