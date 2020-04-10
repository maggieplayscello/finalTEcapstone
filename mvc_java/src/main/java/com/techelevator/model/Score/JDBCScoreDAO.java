package com.techelevator.model.Score;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Course.Course;

@Component
public class JDBCScoreDAO implements ScoreDAO {
	
private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCScoreDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Score> getAllScoresByUserId(Integer id) {
		List <Score> scores = new ArrayList<>();
		
		String sqlSelectAllCourses = "SELECT * FROM scores WHERE id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllCourses);
		while (results.next()) {
			scores.add(mapRowToScore(results));
		}
		return scores;
	}

	private Score mapRowToScore(SqlRowSet results) {
		Score theScore = new Score();
		
		theScore.setScore(results.getInt("score"));
		theScore.setId(results.getInt("id"));
		theScore.setCourseId(results.getInt("courseid"));
		theScore.setScoreId(results.getInt("scoreid"));
		theScore.setTeeTimeId(results.getInt("teetimeid"));
		return theScore;
	}

	@Override
	public void saveScore(Score theScore) {
		String sqlAddScore = "INSERT INTO scores (score, id, courseid, teetimeid) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddScore, theScore.getScore(), theScore.getId(), theScore.getCourseId(), theScore.getTeeTimeId());	
		
	}

}
