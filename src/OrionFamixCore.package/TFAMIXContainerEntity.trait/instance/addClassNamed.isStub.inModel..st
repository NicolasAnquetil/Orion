adding
addClassNamed: aString isStub: aBoolean inModel: aModelVersion
	^ aString
		ifNotNil: [ (ORActionAddClass new
				orionModel: aModelVersion;
				parentPackage: self;
				isStub: aBoolean;
				name: aString)
				manualRun;
				postRun ]