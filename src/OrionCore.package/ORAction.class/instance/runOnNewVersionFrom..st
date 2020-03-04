method execution
runOnNewVersionFrom: previousVersion

	| newModel |
	newModel := previousVersion createNewChildVersion.
	self orionModel: newModel.
	^self manualRun.