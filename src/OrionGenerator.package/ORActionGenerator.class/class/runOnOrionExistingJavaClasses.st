running
runOnOrionExistingJavaClasses

	^ self
		createActionsForORClasses:
			((RPackage organizer packageNamed: 'OrionFamixJava')
				classesForClassTag: 'Class')