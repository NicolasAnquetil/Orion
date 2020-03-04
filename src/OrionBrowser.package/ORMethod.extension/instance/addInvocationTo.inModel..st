*OrionBrowser
addInvocationTo: anOrderedCollection inModel: aModelVersion
	[ (ORActionAddInvocation new
		orionModel: aModelVersion;
		sender: self;
		candidates: anOrderedCollection)
		manualRun;
		postRun ] orBrowserExceptionsLauncherCollection: anOrderedCollection