*OrionFamixJava
addInheritanceFrom: subclass toStub: superclass
	| actualClass |
	(self entityNamed: superclass mooseName)
		ifNil: [ actualClass := self addStubClass: superclass ]
		ifNotNil: [ actualClass := superclass ].
	^ (self entityNamed: subclass mooseName)
		addInheritanceTo: (self entityNamed: superclass mooseName)
		inModel: self