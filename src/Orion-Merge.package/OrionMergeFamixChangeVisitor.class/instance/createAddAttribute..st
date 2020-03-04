deprecated
createAddAttribute: aFamixAddChange
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addAttributeNamed: aFamixAddChange entityName
		inModel: self orionVersionedModel