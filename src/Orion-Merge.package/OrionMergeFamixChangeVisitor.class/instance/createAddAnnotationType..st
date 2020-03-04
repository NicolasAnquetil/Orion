deprecated
createAddAnnotationType: aFamixAddChange
	(aFamixAddChange entity belongsTo
		ifNotNil: [ self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName ]
		ifNil: [ self orionVersionedModel ])
		addAnnotationTypeNamed: aFamixAddChange entityName
		inModel: self orionVersionedModel