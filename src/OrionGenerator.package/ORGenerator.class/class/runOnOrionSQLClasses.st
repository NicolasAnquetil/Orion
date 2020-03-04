running
runOnOrionSQLClasses
	^ self
		makeORForClasses:
			(((RPackage organizer packageNamed: 'Famix-SQL')
				classes select: [ :c | #(#'Famix-SQL-Core' #'Famix-SQL' #'Famix-SQL-Associations') includes: c category ] ) )