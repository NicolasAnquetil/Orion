testing
testOPMovePackage
	| asS asAction |
	asS := self model system.
	asAction := ORActionMovePackage new
		orionModel: orionModel;
		entity: (orionModel entityNamed: #'Orion-TestModel-Constellation1');
		parentPackage: (orionModel entityNamed: #'Orion-TestModel-Constellation2').
	asAction run.
	self assert: (orionModel entityNamed: #'Orion-TestModel-Constellation1') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed: #'Orion-TestModel-Constellation1')).
	self deny: (asS sourceModel entityNamed: #'Orion-TestModel-Constellation1') = (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	self
		assert:
			((orionModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntities
				includes: (orionModel entityNamed: #'Orion-TestModel-Constellation1')).
	self
		deny:
			((asS sourceModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntities
				includes: (orionModel entityNamed: #'Orion-TestModel-Constellation1')).
	self
		assert: (orionModel entityNamed: #'Orion-TestModel-Constellation1') parentPackage
		equals: (orionModel entityNamed: #'Orion-TestModel-Constellation2')