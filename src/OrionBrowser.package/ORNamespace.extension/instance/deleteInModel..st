*OrionBrowser
deleteInModel: aModelVersion

	(ORActionRemoveNamespace new
		orionModel: aModelVersion ;
		entity: self ;
		yourself) 
	manualRun; postRun .