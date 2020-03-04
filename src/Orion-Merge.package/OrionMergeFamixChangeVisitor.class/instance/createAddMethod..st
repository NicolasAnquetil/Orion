deprecated
createAddMethod: aFamixAddChange
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addMethodNamed: aFamixAddChange entityName
		withSignature: aFamixAddChange entity signature
		inModel: self orionVersionedModel