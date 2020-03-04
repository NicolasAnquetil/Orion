*OrionBrowser
deleteInAction:  anAction
	ORActionRemoveParameter new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun. 