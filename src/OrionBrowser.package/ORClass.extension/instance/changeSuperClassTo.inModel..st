*OrionBrowser
changeSuperClassTo: newSuperClass inModel: aModelVersion 

	[(ORActionReplaceInheritance new 
			orionModel: aModelVersion; 
			entity: self;
			from: self ;
			to: newSuperClass) 
			manualRun;
			postRun ]
		orBrowserExceptionsLauncher: newSuperClass 