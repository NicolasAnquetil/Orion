adding
addInheritanceTo: superclass inModel: anORModel
	^ (ORActionAddInheritance new
		orionModel: anORModel;
		from: self;
		to: superclass)
		manualRun;
		postRun