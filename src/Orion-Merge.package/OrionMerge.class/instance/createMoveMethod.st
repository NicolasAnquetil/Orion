private-run
createMoveMethod
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfMoveMethodChanges
		do: [ :chg | 
			chg entity belongsTo mooseName = chg targetEntity belongsTo mooseName
				ifFalse: [ 
					chg entity
						moveTo: (self orionVersionedModel entityNamed: chg targetEntity belongsTo mooseName)
						inModel: self orionVersionedModel ].
			chg entity packageScope mooseName = chg targetEntity packageScope mooseName
				ifFalse: [ 
					chg entity
						updatePackage: (self orionVersionedModel entityNamed: chg targetEntity packageScope mooseName)
						inModel: self orionVersionedModel]  ].
				