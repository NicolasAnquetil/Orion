*OrionBrowser
updatePackage: aPackage inModel: aModel
	^ORActionMoveMethodInPackage new
		orionModel: aModel;
		entity: self;
		newContainer: aPackage;
		run; postRun 