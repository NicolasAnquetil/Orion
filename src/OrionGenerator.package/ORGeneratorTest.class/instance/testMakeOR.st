tests
testMakeOR

	|   nbTraits anORClass nbClass nbMeth |

	nbTraits := Smalltalk allTraits size.
	nbClass := Smalltalk allClasses size.
	nbMeth := FAMIXTestClass methodDict size.
	
	aGenerator makeOR: FAMIXTestClass .
	anORClass := Smalltalk classNamed: #ORTestClass.
	self assert: (Smalltalk allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self assert: (Smalltalk allClasses contains: [:each | each name = #ORTestClass]).
	self assert: (anORClass traitComposition allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self assert: (anORClass superclass) equals: FAMIXTestClass.
	self assert: Smalltalk allClasses size equals: nbClass + 1.
	
	self assert: (FAMIXTestClass methodDict size >= nbMeth ).
	self assert: (FAMIXTestClass methodDict includesKey:  #privateKind).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind:).
	self assert: ((FAMIXTestClass methodDict at: #privateKind) protocol) equals: '*OrionOrionGeneratorTestModel-Class'. 
	
	anORClass removeFromSystem.
	(Smalltalk globals at: #TFAMIXTestClass) removeFromSystem.
	Smalltalk globals at: #OREntity ifAbsent: [(Smalltalk globals at: #TFAMIXEntity) removeFromSystem].
	"self assert: (Smalltalk allTraits) equals: nbTraits."