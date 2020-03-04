*OrionBrowser
moveTo: aPackage inModel: aModelVersion
	
	[^(ORActionMoveClass new
		orionModel: aModelVersion ;
		entity: self ;
		parentPackage: aPackage )
	manualRun;
	postRun ]
	orBrowserExceptionsLauncher: aPackage  
