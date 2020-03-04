*OrionBrowser
deleteInModel: aModelVersion

	(ORActionRemovePackage new
		orionModel: aModelVersion ;
		entity: self )
	manualRun; postRun . 