adding
addAttributeNamed: aString inModel: aModelVersion
	^ aString
		ifNotNil: [ (ORActionAddAnnotationTypeAttribute new
				orionModel: aModelVersion;
				container: self;
				newName: aString)
				manualRun;
				postRun ]