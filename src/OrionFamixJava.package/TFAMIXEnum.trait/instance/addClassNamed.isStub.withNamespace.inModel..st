adding
addClassNamed: aString isStub: aBoolean withNamespace: aNamespace inModel: aModelVersion
	^ aString
		ifNotNil: [ (ORActionAddClass new
				orionModel: aModelVersion;
				parent: self;
				isStub: aBoolean;
				container: aNamespace;
				newName: aString)
				manualRun;
				postRun ]