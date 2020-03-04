accessing
addAnnotationInstanceOfType: anAnnotationTypeName inModel: aModelVersion
	^ anAnnotationTypeName
		ifNotNil: [ (ORActionAddAnnotationInstance new
				orionModel: aModelVersion;
				container: self;
				type: anAnnotationTypeName)
				manualRun;
				postRun ]