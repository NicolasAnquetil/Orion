tests
testAddMethodNoName

	| orionModel |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.

	(orionModel entityNamed: 'Smalltalk::Class1') addMethodNamed: nil inModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.
	
	self assert: orionModel changes size = 0. "no change has been performed, the method has no name"