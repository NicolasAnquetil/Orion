testing
testOPSafeRemovePackage
	| asAction asM2 asAction2 |
	asAction := ORActionAddPackage new orionModel: orionModel; name: 'PackageTest'.
	asAction run.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction2 := ORActionSafeRemovePackage new orionModel: asM2; entity: (asM2 entityNamed: 'PackageTest').
	asAction2 run.
	self
		assert: (orionModel contains: (orionModel entityNamed: 'PackageTest')).
	self deny: (asM2 contains: (orionModel entityNamed: 'PackageTest')).
	self
		assert: (orionModel includes: (orionModel entityNamed: 'PackageTest')).
	self deny: (asM2 includes: (orionModel entityNamed: 'PackageTest')).
	self assert: orionModel size equals: asM2 size + 1.
	orionModel := asM2