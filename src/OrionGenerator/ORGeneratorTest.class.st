Class {
	#name : #ORGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'aGenerator'
	],
	#category : 'OrionGenerator-Test'
}

{ #category : #tests }
ORGeneratorTest >> kindPropertyOfFAMIXTestClass [
	^ (aGenerator getPropertiesOf: FAMIXTestClass) detect: [ :e | e name = #kind ]
]

{ #category : #running }
ORGeneratorTest >> setUp [
	
	aGenerator := ORGenerator new.
	MooseModel resetMeta. "some Famix classes are added for test, the mooseModel has to be regenerated. Once for all is enough"
]

{ #category : #tests }
ORGeneratorTest >> testAddAccessorFrom [
	
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
]

{ #category : #tests }
ORGeneratorTest >> testAddPrivateAccessorTo [
	
	| nbMeth |

	
	nbMeth := FAMIXTestClass methodDict size.
	
	"self halt."
	aGenerator addPrivateAccessorTo: FAMIXTestClass. 
	self assert: (FAMIXTestClass methodDict size >= nbMeth ).
	self assert: (FAMIXTestClass methodDict includesKey:  #privateKind).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind:).
	self assert: ((FAMIXTestClass methodDict at: #privateKind) protocol) equals: '*OrionOrionGeneratorTestModel-Class'. 
	
	
]

{ #category : #tests }
ORGeneratorTest >> testAddThePrivateAccessorOf [
	| nbMeth |
	nbMeth := FAMIXTestClass methodDict size.
	aGenerator addThePrivateAccessorOf: self kindPropertyOfFAMIXTestClass  to: FAMIXTestClass.
	self assert: (FAMIXTestClass methodDict size = (nbMeth + 2) or: [ FAMIXTestClass methodDict size = nbMeth ]).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind).
	self assert: (FAMIXTestClass methodDict includesKey: #privateKind:).
	self assert: (FAMIXTestClass methodDict at: #privateKind) protocol equals: '*OrionOrionGeneratorTestModel-Class'.
	self assert: (FAMIXTestClass methodDict at: #privateKind:) protocol equals: '*OrionOrionGeneratorTestModel-Class'
]

{ #category : #tests }
ORGeneratorTest >> testCodeForORSelector [
	self
		assert: (aGenerator codeForORSelector: self kindPropertyOfFAMIXTestClass)
		equals:
			'kindOR: aVersion
	^ self privateKind versionIn: aVersion'
]

{ #category : #tests }
ORGeneratorTest >> testCodeForPrivateGetter [
	self
		assert: (aGenerator codeForPrivateGetter: self kindPropertyOfFAMIXTestClass)
		equals:
			'privateKind
	^ kind'
]

{ #category : #tests }
ORGeneratorTest >> testCodeForPrivateSetter [
	self
		assert: (aGenerator codeForPrivateSetter: self kindPropertyOfFAMIXTestClass)
		equals:
			'privateKind: aString
	kind := aString'
]

{ #category : #tests }
ORGeneratorTest >> testCodeForSelector [
	self
		assert: (aGenerator codeForSelector: self kindPropertyOfFAMIXTestClass)
		equals:
			'kind
	^ self kindOR: self currentContext'
]

{ #category : #tests }
ORGeneratorTest >> testCreateClassName [
	self assert: (aGenerator createClassName: FAMIXPackage) equals: #ORPackage
]

{ #category : #tests }
ORGeneratorTest >> testCreateClassNameNotFamix [

	self assert: (aGenerator createClassName: MooseEntity ) equals: #ORMooseEntity.
	
]

{ #category : #tests }
ORGeneratorTest >> testCreateTraitName [

	self assert: (aGenerator createTraitName: FAMIXPackage ) equals: #TFAMIXPackage.
	
]

{ #category : #tests }
ORGeneratorTest >> testCreateTraitNameNotFamix [

	self assert: (aGenerator createTraitName: MooseEntity ) equals: #TMooseEntity.
	
]

{ #category : #tests }
ORGeneratorTest >> testEnsureORClass [
	
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
]

{ #category : #tests }
ORGeneratorTest >> testEnsureORTrait [
	
	|   aTrait |


	aTrait := aGenerator ensureORTrait: FAMIXTestClass .
	
	self assert: aTrait notNil.
	self assert: (aTrait name) equals: #TFAMIXTestClass.
	self assert: (Smalltalk globals at: #TFAMIXTestClass) notNil.
	self assert: aTrait selectors size equals: TMooseEntity selectors size.
	self assert: (aTrait traitComposition allTraits includes: TMooseEntity).
	
	aTrait removeFromSystem.
	Smalltalk globals at: #OREntity ifAbsent: [(Smalltalk globals at: #TFAMIXEntity) removeFromSystem].
]

{ #category : #tests }
ORGeneratorTest >> testEnsureORTraitExisting [
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
	
]

{ #category : #tests }
ORGeneratorTest >> testEnsureORTraitWithoutExistingTraits [
	
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
]

{ #category : #tests }
ORGeneratorTest >> testGetPropertiesOf [

	self assert: (aGenerator getPropertiesOf: FAMIXTestClass ) size  equals: 2

]

{ #category : #tests }
ORGeneratorTest >> testGetPropertiesOfEmpty [

	self assert: (aGenerator getPropertiesOf: Object) size  equals: 0

]

{ #category : #tests }
ORGeneratorTest >> testMakeOR [

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
]

{ #category : #tests }
ORGeneratorTest >> testMakeORForAllClasses [

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
]
