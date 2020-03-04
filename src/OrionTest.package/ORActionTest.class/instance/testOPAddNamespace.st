testing
testOPAddNamespace
	| asS asAction ns |
	asS := self model system.
	asAction := ORActionAddNamespace new
		orionModel: orionModel;
		parentScope: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'NamespaceTest'.
	self
		assert:
			(orionModel
				entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest')
				isNil.
	asAction run.
	ns := orionModel
		entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest'.
	self assert: ns notNil.
	self assert: (orionModel contains: ns).
	self deny: (asS sourceModel contains: ns).
	self assert: (orionModel includes: ns).
	self deny: (asS sourceModel includes: ns).
	self
		assert: ns parentScope
		equals: (orionModel entityNamed: 'Orion-TestModel-Constellation2').
	self
		assert:
			((orionModel entityNamed: #'Orion-TestModel-Constellation2')
				childScopes includes: ns).
	self
		deny:
			((asS sourceModel entityNamed: #'Orion-TestModel-Constellation2')
				childScopes includes: ns).
	self assert: orionModel size equals: asS sourceModel size + 1