tests
testEnsureORTraitWithoutExistingTraits
	
	|   aTrait nbTraits |

	nbTraits := Smalltalk allTraits size.

	aTrait := aGenerator ensureORTrait: ClassTest1 .
	
	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TClassTest1.
	
	
	aTrait removeFromSystem.
	Smalltalk globals at: #ORLocalVariable ifAbsent: [(Smalltalk globals at: #TFAMIXLocalVariable) removeFromSystem]. "the trait is removed only if it is the test that added it"
	Smalltalk globals at: #ORLeafEntity ifAbsent: [(Smalltalk globals at: #TFAMIXLeafEntity) removeFromSystem].
	Smalltalk globals at: #ORStructuralEntity ifAbsent: [(Smalltalk globals at: #TFAMIXStructuralEntity) removeFromSystem].
	Smalltalk globals at: #ORNamedEntity ifAbsent: [(Smalltalk globals at: #TFAMIXNamedEntity) removeFromSystem].
	Smalltalk globals at: #ORSourcedEntity ifAbsent: [(Smalltalk globals at: #TFAMIXSourcedEntity) removeFromSystem].
	Smalltalk globals at: #OREntity ifAbsent: [(Smalltalk globals at: #TFAMIXEntity) removeFromSystem].
		
	self assert: Smalltalk allTraits size = nbTraits 