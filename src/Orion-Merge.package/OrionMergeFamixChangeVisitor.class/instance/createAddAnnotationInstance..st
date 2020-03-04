deprecated
createAddAnnotationInstance: aFamixAddChange
	(self orionVersionedModel entityNamed: aFamixAddChange entity belongsTo mooseName)
		addAnnotationInstanceOfType: aFamixAddChange entityName
		inModel: self orionVersionedModel