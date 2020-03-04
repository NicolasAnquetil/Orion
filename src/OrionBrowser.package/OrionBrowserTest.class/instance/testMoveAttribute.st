tests
testMoveAttribute

	| orionModel att  |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	att := orionModel entityNamed: 'Smalltalk::Object.DependentsFields'.	

	self deny: att isNil.
	self assert: att parentType equals: (orionModel entityNamed: 'Smalltalk::Object').	

	att moveTo: (orionModel entityNamed: 'Smalltalk::Class1') inModel: orionModel.

	att := orionModel entityNamed: 'Smalltalk::Object.DependentsFields'.	
	self assert: att isNil.
	
	att := orionModel entityNamed: 'Smalltalk::Class1.DependentsFields'.	
	
	self deny: att isNil.
	self assert: att parentType equals: (orionModel entityNamed: 'Smalltalk::Class1').