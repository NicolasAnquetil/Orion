method execution
runOR: aVersion

	aVersion system announcer announce: ORAnnouncement.
	entity := entity versionIn: aVersion.
	^self