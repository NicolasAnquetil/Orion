*OrionBrowser
deleteInAction: anAction

	ORActionRemoveFunction new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun. 
