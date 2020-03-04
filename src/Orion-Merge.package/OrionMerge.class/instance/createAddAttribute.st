private-run-migrated
createAddAttribute
	"create the corresponding ORActions from the set of changes. Each type of change is managed separately"

	self result setOfAddAttributeChanges
		do: [ :chg | 
			(chg entity belongsTo isInnerClass or: [ chg entity belongsTo isAnonymousClass ])
				ifFalse: [ 
					(self orionVersionedModel entityNamed: chg entity belongsTo mooseName)
						addAttributeNamed: chg entityName
						inModel: self orionVersionedModel ] ]