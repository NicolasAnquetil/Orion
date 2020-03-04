*OrionBrowser
deleteInAction: anAction
	ORActionRemoveType new
		parentAction: anAction;
		orionModel: anAction orionModel;
		entity: self;
		run;
		postRun