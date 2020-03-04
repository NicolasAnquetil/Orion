tests
testAddClass

	| orionModel |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::ClassTest') isNil.

	(orionModel entityNamed: 'Orion-TestModel-Constellation1') addClassNamed: 'ClassTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Smalltalk::ClassTest') isNil.
	self assert: (orionModel entityNamed: 'Smalltalk::ClassTest') parentPackage equals: (orionModel entityNamed: 'Orion-TestModel-Constellation1').
	self assert: orionModel changes size = 1.