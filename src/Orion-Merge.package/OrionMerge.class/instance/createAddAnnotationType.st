private-run-migrated
createAddAnnotationType
	self result setOfAddAnnotationTypeChanges
		do: [ :chg | 
			(chg entity belongsTo
				ifNotNil: [ self orionVersionedModel entityNamed: chg entity belongsTo mooseName ]
				ifNil: [ self orionVersionedModel ])
				addAnnotationTypeNamed: chg entityName
				inModel: self orionVersionedModel ]