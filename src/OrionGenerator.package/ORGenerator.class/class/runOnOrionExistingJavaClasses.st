running
runOnOrionExistingJavaClasses
	^ self
		makeORForClasses:
			(((RPackage organizer packageNamed: 'OrionFamixJava')
				classesForClassTag: 'Class') collect: #superclass)