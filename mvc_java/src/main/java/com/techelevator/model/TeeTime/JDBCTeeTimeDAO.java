package com.techelevator.model.TeeTime;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

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
	
}
