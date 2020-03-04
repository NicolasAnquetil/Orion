tests
testMoveMethod

	| orionModel meth |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	
	self deny: meth isNil.
	self assert: meth parentType equals: (orionModel entityNamed: 'Smalltalk::Class5').	

	meth moveTo: (orionModel entityNamed: 'Smalltalk::Class1') inModel: orionModel.

	meth := orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	
	self assert: meth isNil.
	
	meth := orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()'.	
	self deny: meth isNil.
	self assert: meth parentType equals: (orionModel entityNamed: 'Smalltalk::Class1').