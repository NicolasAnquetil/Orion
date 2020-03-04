tests
testEnsureORTrait
	
	|   aTrait |


	aTrait := aGenerator ensureORTrait: FAMIXTestClass .
	
	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TFAMIXTestClass.
	self assert: (Smalltalk globals at: #TFAMIXTestClass) notNil.
	self assert: aTrait selectors size equals: TMooseEntity selectors size.
	self assert: (aTrait traitComposition allTraits includes: TMooseEntity).
	
	aTrait removeFromSystem.
	Smalltalk globals at: #OREntity ifAbsent: [(Smalltalk globals at: #TFAMIXEntity) removeFromSystem].