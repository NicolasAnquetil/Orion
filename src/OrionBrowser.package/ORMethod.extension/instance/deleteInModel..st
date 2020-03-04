*OrionBrowser
deleteInModel: aModelVersion

	(ORActionRemoveMethod new
		orionModel: aModelVersion ;
		entity: self ;
		yourself) 
	manualRun; postRun . 