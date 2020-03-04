running
runOnOrionSQLClasses
	^ self
		createActionsForORClasses:
			(((RPackage organizer packages select: [:p | #(#'OrionFamixSQLCore' #'OrionFamixSQLAssociations' #'OrionFamixSQL') includes: p name ]) flatCollect: [ :p | p 
				classesForClassTag: 'Class' ] ))
