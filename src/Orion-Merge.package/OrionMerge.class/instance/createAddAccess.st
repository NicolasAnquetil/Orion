private-run
createAddAccess
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddAccessChanges
		do: [ :chg | 
			(self orionVersionedModel entityNamed: chg entity from mooseName)
				addAccessTo: (self orionVersionedModel entityNamed: chg entity to mooseName)
				inModel: self orionVersionedModel ]