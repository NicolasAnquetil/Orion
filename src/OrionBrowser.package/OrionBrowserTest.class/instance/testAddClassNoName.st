tests
testAddClassNoName

	| orionModel |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'ClassTest') isNil.

	(orionModel entityNamed: 'Orion-TestModel-Constellation1') addClassNamed: nil inModel: orionModel .

	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation1::ClassTest') isNil.
	
	self assert: orionModel changes size = 0. "no change has been performed, the name is nil"