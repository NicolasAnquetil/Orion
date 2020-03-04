*OrionBrowser
moveTo: aClass inModel: aModelVersion
	[ ^ (ORActionMoveMethod new
		orionModel: aModelVersion;
		entity: self;
		parentType: aClass)
		manualRun;
		postRun ] orBrowserExceptionsLauncher: aClass