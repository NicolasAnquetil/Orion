*OrionBrowser
addReferenceTo: aClass inModel: aModelVersion
[ 

	(ORActionAddReference new
		orionModel: aModelVersion;
		source: self ;
		target: aClass)
	manualRun; postRun ]
	orBrowserExceptionsLauncher: aClass. 