*OrionBrowser
deleteInAction: anAction

	ORActionRemoveNamespace  new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun. 