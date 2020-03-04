tests
testEnsureORTraitExisting
	"In order to be sure that we apply the method ensureORTrait on an existing trait, we apply it twice "
	|   aTrait aTrait2 nbTraits |

	"self assert: (Smalltalk globals at: #TFAMIXTestClass) ."
	
	aTrait := aGenerator ensureORTrait: FAMIXTestClass .
	
	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TFAMIXTestClass.
	self assert: (Smalltalk globals at: #TFAMIXTestClass) notNil.
	
	nbTraits := Trait allInstances size.
	
	aTrait2 := aGenerator ensureORTrait: FAMIXTestClass .

	self assert: aTrait2  notNil.
	self assert: (aTrait2 name) equals: #TFAMIXTestClass.
	self assert: aTrait equals: aTrait2.
	self assert: Trait allInstances size equals: nbTraits.
	self assert: aTrait2 selectors size equals: aTrait selectors size.
	
	aTrait removeFromSystem.
	Smalltalk globals at: #OREntity ifAbsent: [(Smalltalk globals at: #TFAMIXEntity) removeFromSystem].
	