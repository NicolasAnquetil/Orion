*OrionBrowser
deleteInModel: aModelVersion

	(ORActionRemoveAttribute new
		orionModel: aModelVersion ;
		entity: self )
	manualRun; postRun. 
