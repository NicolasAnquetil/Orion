running
runOnOrionExistingClasses

	^ self
		createActionsForORClasses:
			((RPackage organizer packageNamed: 'OrionFamixCore')
				classesForClassTag: 'Class')