*OrionBrowser
deleteInAction: anAction

	ORActionRemoveAttribute new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun. 