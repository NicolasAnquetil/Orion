*OrionBrowser
deleteInModel:  aModelVersion
	(ORActionRemoveInheritance new
		orionModel: aModelVersion;
		entity: self )
	manualRun; postRun. 
