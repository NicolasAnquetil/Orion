testing
testOPAddClass
	| sys act class |
	sys := self model system.
	act := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: #'Orion-TestModel-Constellation2');
		name: 'ClassTest';
		postRun.
	self assert: (orionModel entityNamed: ':ClassTest') isNil.
	self assert: orionModel changes size equals: 1.
	act run.
	class := orionModel entityNamed: 'ClassTest'.
	self assert: class notNil.
	self assert: (orionModel contains: class).
	self deny: (sys sourceModel contains: class).
	self assert: (orionModel includes: class).
	self deny: (sys sourceModel includes: class).
	self assert: class parentPackage equals: (orionModel entityNamed: #'Orion-TestModel-Constellation2').
	self assert: ((orionModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntities includes: class).
	self deny: (((sys sourceModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntitiesOR: sys sourceModel) includes: class).
	self deny: ((sys sourceModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntities includes: class).
	self assert: (orionModel contains: (orionModel entityNamed: #'Orion-TestModel-Constellation2')).
	self deny: (sys sourceModel contains: (orionModel entityNamed: #'Orion-TestModel-Constellation2')).
	self assert: orionModel size equals: sys sourceModel size + 1