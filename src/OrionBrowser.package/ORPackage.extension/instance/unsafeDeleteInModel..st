*OrionBrowser
unsafeDeleteInModel: aModelVersion

	(ORActionRemovePackageOnly new
		orionModel: aModelVersion ;
		entity: self )
	manualRun. 