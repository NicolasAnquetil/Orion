tests
testRenameClass

	| orionModel  |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1') notNil.

	(orionModel entityNamed: 'Smalltalk::Class1') rename: 'ClassTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Smalltalk::Class1') notNil.
	self deny: (orionModel entityNamed: 'Smalltalk::ClassTest') isNil.
	"self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')."