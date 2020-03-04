tests
testAddAttributeNoName

	| orionModel |

	 self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.

	(orionModel entityNamed: 'Smalltalk::Class1') addAttributeNamed: nil inModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.
	
	self assert: orionModel changes size = 0. "no change has been performed since the attribute has no name"