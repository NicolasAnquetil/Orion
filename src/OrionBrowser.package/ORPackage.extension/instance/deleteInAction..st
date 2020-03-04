*OrionBrowser
deleteInAction: anAction

	ORActionRemovePackageOnly new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun . 