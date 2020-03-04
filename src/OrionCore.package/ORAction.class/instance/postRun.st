initialize-release
postRun

	orionModel addToListOfChanges: self.	
	orionModel system announcer announce: ORAnnouncement.