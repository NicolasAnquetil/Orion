private-run
createMoveNamespace
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	"distinction is done between parentPackage and belongsTo (that correspond to the container in ST en Java)"

	self result setOfMoveNamespaceChanges
		do: [ :chg | 
			chg targetEntity parentScope
				ifNotNil: [ 
					chg entity
						moveTo: (self orionVersionedModel entityNamed: chg targetEntity parentScope mooseName)
						inModel: self orionVersionedModel ] ]