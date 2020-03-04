adding/removing
addAnnotationTypeNamed: aString inModel: aModelVersion
	aString
		ifNotNil: [ (ORActionAddAnnotationType new
				orionModel: aModelVersion;
				container: self ;
				newName: aString)
				manualRun;
				postRun ]