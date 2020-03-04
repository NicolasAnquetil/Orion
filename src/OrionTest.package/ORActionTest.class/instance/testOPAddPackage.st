testing
testOPAddPackage
	| asS asAction |
	asS := self model system.
	asAction := ORActionAddPackage new
		orionModel: orionModel;
		name: 'PackageTest'.
	asAction run.
	self
		assert: (orionModel contains: (orionModel entityNamed: #PackageTest)).
	self
		deny: (asS sourceModel contains: (orionModel entityNamed: #PackageTest)).
	self
		assert: (orionModel includes: (orionModel entityNamed: #PackageTest)).
	self
		deny: (asS sourceModel includes: (orionModel entityNamed: #PackageTest)).
	self
		assert: (orionModel entityNamed: #PackageTest) parentPackage = nil.
	self
		assert: (orionModel entityNamed: #PackageTest) childNamedEntities isEmpty.
	self assert: orionModel size = (asS sourceModel size + 1)