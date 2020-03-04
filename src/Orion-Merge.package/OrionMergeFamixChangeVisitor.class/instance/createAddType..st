deprecated
createAddType: aFamixAddChange
	aFamixAddChange entity parentPackage
		ifNotNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity parentPackage mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]
		ifNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity container mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]