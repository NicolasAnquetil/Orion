*OrionBrowser
addPackageNamed: aString
	^ aString notNil
		ifTrue: [ (ORActionAddPackage new orionModel: self; name: aString) manualRun; 
					postRun ]