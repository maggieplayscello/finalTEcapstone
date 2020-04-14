package com.techelevator.model.TeeTime;

import java.time.LocalDateTime;
import java.util.List;

public interface TeeTimeDAO {

	void saveTeeTime(TeeTime teeTime);

	int getLastTeeTimeId();

	List<TeeTime> getTeeTimesByGolferIdPastToday(int id);
	
	List<LocalDateTime> getTeeTimesByCourse(int courseId, String date);

}
