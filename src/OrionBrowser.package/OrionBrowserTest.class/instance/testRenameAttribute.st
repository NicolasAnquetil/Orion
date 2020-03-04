tests
testRenameAttribute

	| orionModel  |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.att1') notNil.

	(orionModel entityNamed: 'Smalltalk::Class1.att1') rename: 'attributeTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Smalltalk::Class1.att1') notNil.
	self deny: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') isNil.
	"self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')."