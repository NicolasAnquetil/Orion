*OrionBrowser
deleteInModel:  aModelVersion
	(ORActionRemoveReference new
		orionModel: aModelVersion;
		entity: self )
	manualRun; postRun . 