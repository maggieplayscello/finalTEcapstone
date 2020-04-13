package com.techelevator.model.TeeTime;

public interface TeeTimeDAO {

	void saveTeeTime(TeeTime teeTime);

	int getLastTeeTimeId();

}
