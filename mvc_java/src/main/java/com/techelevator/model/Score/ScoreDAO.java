package com.techelevator.model.Score;

import java.util.List;

public interface ScoreDAO {

	public List<Score> getAllScoresByUserId(Integer id);
	
	public void saveScore(Score theScore);

	public String getDateFromScoreId(int id);
}
