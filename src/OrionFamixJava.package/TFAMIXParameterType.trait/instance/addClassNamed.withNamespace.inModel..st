adding
addClassNamed: aString withNamespace: aNamespace inModel: aModelVersion
	^aString
		ifNotNil: [ 
			(ORActionAddClass new
				orionModel: aModelVersion;
				parent: self;
				container: aNamespace;
				newName: aString) manualRun; postRun ]