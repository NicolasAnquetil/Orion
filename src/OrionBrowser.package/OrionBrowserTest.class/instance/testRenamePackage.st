tests
testRenamePackage

	| orionModel  |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation1') notNil.

	(orionModel entityNamed: 'Orion-TestModel-Constellation1') rename: 'PackageTest' inModel: orionModel .

	self deny: (orionModel entityNamed: 'Orion-TestModel-Constellation1') notNil.
	self deny: (orionModel entityNamed: 'PackageTest') isNil.
	"self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')."