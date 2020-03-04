*OrionBrowser
deleteInAction:  anAction
	ORActionRemoveInheritance new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
	run; postRun. 
