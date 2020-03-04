*OrionFamixJava
addReferenceFrom: aFAMIXMethod toStub: aFamixStubClass
	| actualClass |
	(self entityNamed: aFamixStubClass mooseName)
		ifNil: [ actualClass := self addStubClass: aFamixStubClass ]
		ifNotNil: [ actualClass := aFamixStubClass ].
	^ self addReferenceFrom: aFAMIXMethod to: actualClass