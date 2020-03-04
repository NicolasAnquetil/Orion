*OrionBrowser
addAccessTo: aStructuralEntity inModel: aModelVersion
	(ORActionAddAccess new
		orionModel: aModelVersion;
		accessor: self;
		variable: aStructuralEntity)
		manualRun;
		postRun