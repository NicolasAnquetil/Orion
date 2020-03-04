adding
addClassNamed: aString isStub: aBoolean withNamespace: aNamespace inModel: aModelVersion
	^ aString
		ifNotNil: [ (ORActionAddClass new
				orionModel: aModelVersion;
				parentPackage: self;
				isStub: aBoolean;
				container: aNamespace;
				name: aString)
				manualRun;
				postRun ]