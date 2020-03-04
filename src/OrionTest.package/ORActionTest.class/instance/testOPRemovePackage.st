testing
testOPRemovePackage
	| asM2 asAction2 pckg |
	self flag: #FIXME.
	pckg := orionModel entityNamed: 'Orion-TestModel-Constellation1'.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction2 := ORActionRemovePackage new
		orionModel: asM2;
		entity: pckg.
	asAction2 run.
	self assert: (orionModel includes: (orionModel entityNamed: 'Orion-TestModel-Constellation1')).
	self deny: (asM2 includes: (orionModel entityNamed: 'Orion-TestModel-Constellation1')).

	"self assert:(orionModel  includes: (orionModel entityNamed:#'PackageTest')).
	self deny:(asM2 includes: (orionModel entityNamed:#'PackageTest'))."
	self assert: orionModel size equals: asM2 size + 15.	"Classes and methods have been removed"