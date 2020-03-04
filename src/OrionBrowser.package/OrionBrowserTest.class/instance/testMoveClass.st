tests
testMoveClass

	| orionModel class |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	class := orionModel entityNamed: 'Smalltalk::Class1'.	
	self deny: class isNil.
	self assert: class parentPackage equals: (orionModel entityNamed: 'Orion-TestModel-Constellation1').	

	class moveTo: (orionModel entityNamed: 'Orion-TestModel-Constellation2') inModel: orionModel .

	class := orionModel entityNamed: 'Smalltalk::Class1'.	
	self deny: class isNil.
	self assert: class parentPackage equals: (orionModel entityNamed: 'Orion-TestModel-Constellation2').