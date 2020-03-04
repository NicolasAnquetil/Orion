tests
testAddPackageNoName

	| orionModel |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	self assert: (orionModel entityNamed: 'PackageTest') isNil.

	orionModel addPackageNamed: nil.

	self assert: (orionModel entityNamed: 'PackageTest') isNil.
	self assert: orionModel changes size = 0. "no changes is performed, the package has no name"