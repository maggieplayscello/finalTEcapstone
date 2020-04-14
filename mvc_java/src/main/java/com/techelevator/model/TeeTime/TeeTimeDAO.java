package com.techelevator.model.TeeTime;

import java.util.List;

public interface TeeTimeDAO {

	void saveTeeTime(TeeTime teeTime);

	int getLastTeeTimeId();

	List<TeeTime> getTeeTimesByGolferIdPastToday(int id);

}
