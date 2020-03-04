*OrionBrowser
deleteInModel: aModelVersion
	(ORActionRemoveClass new
		orionModel: aModelVersion;
		entity: self)
		manualRun;
		postRun