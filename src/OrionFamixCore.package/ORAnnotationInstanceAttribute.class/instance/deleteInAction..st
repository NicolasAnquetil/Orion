as yet unclassified
deleteInAction: anAction
	ORActionRemoveAnnotationInstanceAttribute new
		parentAction: anAction;
		orionModel: anAction orionModel;
		entity: self;
		run; postRun