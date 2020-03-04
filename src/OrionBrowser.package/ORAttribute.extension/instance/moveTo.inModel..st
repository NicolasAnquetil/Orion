*OrionBrowser
moveTo: aClass inModel: aModelVersion

[ 
	^(ORActionMoveAttribute  new
		orionModel: aModelVersion ;
		entity: self ;
		parentType: aClass )
	manualRun; postRun ]
		orBrowserExceptionsLauncher: aClass.
