tests
testAddAccessorFrom
	
	|  aTrait nbTraits nbSel nbProp |

	nbTraits := Smalltalk allTraits size.

	aTrait := aGenerator ensureORTrait: FAMIXTestClass .
	nbSel := aTrait selectors size.
	nbProp := (aGenerator getPropertiesOf: FAMIXTestClass) size.
	
	"check the creation of the trait"
	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TFAMIXTestClass.
	self assert: aTrait selectors size equals: TMooseEntity selectors size.
	self assert: (aTrait traitComposition allTraits includes: TMooseEntity).
	
	aGenerator addAccessorFrom: FAMIXTestClass toTrait: aTrait. 
	self assert: aTrait selectors size equals:  (nbSel + (2*nbProp)).
	self assert: (aTrait selectors includes: #kind).
	self assert: (aTrait selectors includes: #kindOR:).

	
	aTrait removeFromSystem.
	Smalltalk globals at: #OREntity ifAbsent: [(Smalltalk globals at: #TFAMIXEntity) removeFromSystem].
	self assert: Smalltalk allTraits size equals: nbTraits.
	self deny: (Smalltalk allTraits includes: aTrait).