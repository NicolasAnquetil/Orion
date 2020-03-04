tests
testAddMethod

	| orionModel |
	self flag: #FIXME.
	self skip.
	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.

	(orionModel entityNamed: 'Smalltalk::Class1') addMethodNamed: 'methodTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1').
	
	self assert: orionModel changes size = 1.