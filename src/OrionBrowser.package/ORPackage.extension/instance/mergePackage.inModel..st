*OrionBrowser
mergePackage: aPackage inModel: aModelVersion

	(ORActionMergePackage  new
		orionModel: aModelVersion ;
		entity: self ;
		newContainer: aPackage )
	manualRun; postRun . 
