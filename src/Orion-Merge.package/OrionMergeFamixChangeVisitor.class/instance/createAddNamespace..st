deprecated
createAddNamespace: aFamixAddChange
	self orionVersionedModel
		addNamespaceNamed: aFamixAddChange entity name
		inORNamespace: (self orionVersionedModel entityNamed: aFamixAddChange entity parentScope mooseName)