deprecated
createAddClass: aFamixAddChange
	| entity descr changeAction |
	entity := aFamixAddChange entity.
	descr := entity mooseDescription.
	changeAction := ('ORActionAdd' , descr name) asClass new.
	changeAction orionModel: self orionVersionedModel.
	descr allAttributesNotDerived do: [ :e | self setProperty: e from: entity to: changeAction ].
	changeAction manualRun; "	OLD VERSION : aFamixAddChange entity parentPackage
		ifNotNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity parentPackage mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]
		ifNil: [ (self orionVersionedModel entityNamed: aFamixAddChange entity container mooseName)
				addClassNamed: aFamixAddChange entityName
				isStub: aFamixAddChange entity isStub
				inModel: self orionVersionedModel ]"
			postRun