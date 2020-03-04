*OrionBrowser
deleteOnlyInModel: aModelVersion

	(ORActionRemoveClassOnly new
		orionModel: aModelVersion ;
		entity: self )
	manualRun; postRun. 
