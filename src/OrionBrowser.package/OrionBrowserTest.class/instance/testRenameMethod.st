tests
testRenameMethod

	| orionModel  |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') notNil.

	(orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') rename: 'methodTest' inModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') notNil.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.methodTest()') isNil.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') name equals: 'methodTest'.
	"self assert: (orionModel entityNamed: 'Smalltalk::Class1.attributeTest') parentType equals: (orionModel entityNamed: 'Smalltalk::Class1')."