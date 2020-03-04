private-run-migrated
createAddInnerClass
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self changes
		do: [ :chg | 
			(chg isAddition and: [ chg isForType and: [ chg entity isInnerClass or: [ chg entity isAnonymousClass ] ]])
				ifTrue: [ 
					chg entity container
						ifNotNil: [ 
							chg entity container isType ifTrue: [ (self orionVersionedModel entityNamed: chg entity container mooseName)
								addClassNamed: chg entityName
								inModel: self orionVersionedModel ].
							chg entity container isMethod ifTrue: [ (self orionVersionedModel entityNamed: (chg entity container name, '()'))
								addClassNamed: chg entityName
								inModel: self orionVersionedModel ] ] ] ]