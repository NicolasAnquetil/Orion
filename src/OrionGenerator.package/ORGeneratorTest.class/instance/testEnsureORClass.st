tests
testEnsureORClass
	
	|  anORClass nbClass |
	
	nbClass := Smalltalk allClasses size.
	
	anORClass := aGenerator ensureORClass: FAMIXTestClass.

	self assert: anORClass notNil.
	self assert: (anORClass name) equals: #ORTestClass.
	self assert: (anORClass traitComposition allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self assert: (anORClass superclass) equals: FAMIXTestClass.
	self assert: Smalltalk allClasses size equals: nbClass + 1.
	
	anORClass removeFromSystem.
	(Smalltalk globals at: #TFAMIXTestClass) removeFromSystem.
	Smalltalk globals at: #OREntity ifAbsent: [(Smalltalk globals at: #TFAMIXEntity) removeFromSystem].