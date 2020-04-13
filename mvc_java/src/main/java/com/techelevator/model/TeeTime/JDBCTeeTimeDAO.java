package com.techelevator.model.TeeTime;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Score.Score;

@Component
public class JDBCTeeTimeDAO implements TeeTimeDAO {
	
private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCTeeTimeDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveTeeTime(TeeTime teeTime) {
		if (teeTime.getLeagueId() == 0) {
			String sqlAddTeeTime = "INSERT INTO tee_time (time, numgolfers, courseid) VALUES (?, ?, ?)";
			jdbcTemplate.update(sqlAddTeeTime, teeTime.getTime(), teeTime.getNumGolfers(), teeTime.getCourseId());
		}else {
		String sqlAddTeeTime = "INSERT INTO tee_time VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddTeeTime, 
				teeTime.getTime(), teeTime.getLeagueId(), teeTime.getNumGolfers(), teeTime.getCourseId());
		}
		
	}
	
	@Override
	public int getLastTeeTimeId() {
		int id = 0;
		String sqlSelectAllCourses = "SELECT teetimeid FROM tee_time ORDER BY teetimeid DESC LIMIT 1";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllCourses);
		if (results.next()) {
			id = results.getInt("teetimeid");
		}
		return id;
	}
	
}
