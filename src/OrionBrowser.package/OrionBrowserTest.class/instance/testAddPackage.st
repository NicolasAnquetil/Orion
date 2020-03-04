tests
testAddPackage

	| orionModel |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'PackageTest') isNil.

	orionModel addPackageNamed: 'PackageTest'.

	self deny: (orionModel entityNamed: 'PackageTest') isNil.

	self assert: orionModel changes size = 1.