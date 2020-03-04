*OrionBrowser
deleteInAction: anORActionRemoveMethod
	ORActionRemoveImplicitVariable new
		parentAction: anORActionRemoveMethod;
		orionModel: anORActionRemoveMethod orionModel;
		entity: self;
		run;
		postRun