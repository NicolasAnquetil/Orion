*OrionBrowser
moveTo: aClass inAction: anAction

[ 
	(ORActionMoveAttribute  new
		parentAction: anAction ;
		orionModel: anAction orionModel ;
		entity: self ;
		newContainer: aClass )
	run ; postRun]
		orBrowserExceptionsLauncher: aClass.
