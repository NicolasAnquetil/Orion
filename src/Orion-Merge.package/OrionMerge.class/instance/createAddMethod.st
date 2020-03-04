private-run-migrated
createAddMethod
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddMethodChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifFalse: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addMethodNamed: chg entityName
						withSignature: chg entity signature
						inModel: self orionVersionedModel ] ]