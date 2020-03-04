*OrionBrowser
deleteInAction: anAction

	ORActionRemoveComment new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun. 
