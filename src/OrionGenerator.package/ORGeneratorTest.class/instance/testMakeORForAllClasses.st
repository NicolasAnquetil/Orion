tests
testMakeORForAllClasses

	|   nbTraits nbClass aColl |
	
	aColl := Smalltalk allClasses select: [ :c | (c category =#'OrionGenerator-TestModel')].	

	nbTraits := Smalltalk allTraits size.
	nbClass := Smalltalk allClasses size.
	
	self deny: (Smalltalk allClasses contains: [:each | each name = #ORTestClass]).
	self deny: (Smalltalk allClasses contains: [:each | each name = #ORClassTest1]).
	self deny: (Smalltalk allClasses contains: [:each | each name = #ORClassTest2]).

	self deny: (Smalltalk allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self deny: (Smalltalk allTraits contains: [:each | each name = #TClassTest1]).
	self deny: (Smalltalk allTraits contains: [:each | each name = #TClassTest2]).
	
	aGenerator makeORForAllClasses: aColl .
	
	"verification that the 2 traits have been created"
	self assert: (Smalltalk allTraits contains: [:each | each name = #TFAMIXTestClass]).
	self assert: (Smalltalk allTraits contains: [:each | each name = #TClassTest1]).
	self deny: (Smalltalk allTraits contains: [:each | each name = #TClassTest2]).

	
	
	"Removing the traits and the classes created during the test"
	(Smalltalk globals at: #TFAMIXTestClass) removeFromSystem.
	(Smalltalk globals at: #TClassTest1) removeFromSystem.
	
	Smalltalk globals at: #ORLocalVariable ifAbsent: [(Smalltalk globals at: #TFAMIXLocalVariable) removeFromSystem]. "the trait is removed only if it is the test that added it"
	Smalltalk globals at: #ORLeafEntity ifAbsent: [(Smalltalk globals at: #TFAMIXLeafEntity) removeFromSystem].
	Smalltalk globals at: #ORStructuralEntity ifAbsent: [(Smalltalk globals at: #TFAMIXStructuralEntity) removeFromSystem].
	Smalltalk globals at: #ORNamedEntity ifAbsent: [(Smalltalk globals at: #TFAMIXNamedEntity) removeFromSystem].
	Smalltalk globals at: #ORSourcedEntity ifAbsent: [(Smalltalk globals at: #TFAMIXSourcedEntity) removeFromSystem].
	Smalltalk globals at: #OREntity ifAbsent: [(Smalltalk globals at: #TFAMIXEntity) removeFromSystem].
	
	(Smalltalk globals at: #ORTestClass) removeFromSystem.
	(Smalltalk globals at: #ORClassTest1) removeFromSystem.
	
	
	self assert: Smalltalk allTraits size equals: nbTraits.
	self assert: Smalltalk allClasses size equals: nbClass .