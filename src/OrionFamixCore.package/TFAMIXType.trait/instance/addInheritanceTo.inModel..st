adding
addInheritanceTo: superclass inModel: anORModel
	^ (ORActionAddInheritance new
		orionModel: anORModel;
		subclass: self;
		superclass: superclass)
		manualRun;
		postRun