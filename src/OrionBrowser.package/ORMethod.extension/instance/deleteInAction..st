*OrionBrowser
deleteInAction: anAction

	ORActionRemoveMethod new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun . 