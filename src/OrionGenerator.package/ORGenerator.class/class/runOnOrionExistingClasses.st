running
runOnOrionExistingClasses
	^ self
		makeORForClasses:
			(((RPackage organizer packageNamed: 'OrionFamixCore')
				classesForClassTag: 'Class') collect: #superclass)