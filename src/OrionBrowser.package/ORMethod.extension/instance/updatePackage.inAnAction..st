*OrionBrowser
updatePackage: aPackage inAnAction: anAction
	ORActionMoveMethodInPackage new
		parentAction: anAction;
		orionModel: anAction orionModel;
		entity: self;
		newContainer: aPackage;
		run; postRun 