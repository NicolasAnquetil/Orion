tests
testAddAttribute

	| orionModel  |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.

	(orionModel entityNamed: 'Smalltalk::Class1') addAttributeNamed: 'attributeTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1').
	self assert: orionModel changes size equals: 1.