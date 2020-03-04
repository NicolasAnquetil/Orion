*OrionBrowser
deleteInAction: anAction

	ORActionRemoveReference new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun . 
