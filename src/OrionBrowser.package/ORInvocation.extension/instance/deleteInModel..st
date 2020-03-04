*OrionBrowser
deleteInModel:  aModelVersion
	(ORActionRemoveInvocation new
		orionModel: aModelVersion;
		entity: self )
	manualRun; postRun . 
