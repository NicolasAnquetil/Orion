testing
testOPRemoveClass
	| asAction asM2 asAction2 |
	asAction := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'ClassTest'.
	asAction run.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction2 := ORActionRemoveClass new
		orionModel: asM2;
		entity: (asM2 entityNamed: 'ClassTest').
	asAction2 run.
	self assert: (orionModel contains: (orionModel entityNamed: 'ClassTest')).
	self deny: (asM2 contains: (orionModel entityNamed: 'ClassTest')).
	self assert: ((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTest')).
	self deny: ((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTest')).
	self assert: orionModel size equals: asM2 size + 1