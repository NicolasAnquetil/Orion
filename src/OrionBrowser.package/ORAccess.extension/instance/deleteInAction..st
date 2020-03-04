*OrionBrowser
deleteInAction:  anAction
	ORActionRemoveAccess new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun. 