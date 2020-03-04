*OrionBrowser
addMethodNamed: aString withSignature: aSignature withBodyHash: anHash inModel: aModelVersion
	aString
		ifNotNil: [ (ORActionAddMethodWithBodyHash new
				orionModel: aModelVersion;
				container: self;
				newName: aString;
				bodyHash: anHash;
				signature: aSignature)
				manualRun;
				postRun ]