adding
addClassNamed: aString isStub: aBoolean inModel: aModelVersion
	^ aString
		ifNotNil: [ (ORActionAddClass new
				orionModel: aModelVersion;
				container: self;
				isStub: aBoolean;
				newName: aString)
				manualRun;
				postRun ]