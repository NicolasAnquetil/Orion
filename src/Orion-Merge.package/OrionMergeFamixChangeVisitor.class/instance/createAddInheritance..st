deprecated
createAddInheritance: aFamixAddChange
	aFamixAddChange entity to isStub
		ifTrue: [ self orionVersionedModel addInheritanceFrom: aFamixAddChange entity from toStub: aFamixAddChange entity to ]
		ifFalse: [ self orionVersionedModel addInheritanceFrom: aFamixAddChange entity from to: aFamixAddChange entity to ]