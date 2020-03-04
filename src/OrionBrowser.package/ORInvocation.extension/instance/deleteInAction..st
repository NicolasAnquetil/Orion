*OrionBrowser
deleteInAction:  anAction
	ORActionRemoveInvocation new
		parentAction: anAction;
		orionModel: anAction orionModel ;
		entity: self ;
		run; postRun . 
