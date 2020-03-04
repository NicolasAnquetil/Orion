*OrionFamixJava
addReferenceFrom: aFamixMethod to: aFamixClass
	(aFamixMethod belongsTo isAnonymousClass not and: [ aFamixMethod belongsTo isInnerClass not ])
		ifTrue: [ ^ (self entityNamed: aFamixMethod mooseName)
				addReferenceTo: (self entityNamed: aFamixClass mooseName)
				inModel: self ]