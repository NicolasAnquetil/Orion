testing
testOPRemoveNamespace
	| asAction asM2 asAction2 |
	asAction := ORActionAddNamespace new
		orionModel: orionModel;
		parentScope: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'NamespaceTest'.
	asAction run.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction2 := ORActionRemoveNamespace new
		orionModel: asM2;
		entity: (asM2 entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest').
	asAction2 run.
	self
		assert:
			(orionModel
				contains:
					(orionModel
						entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest')).
	self
		deny:
			(asM2
				contains:
					(orionModel
						entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest')).
	self
		assert:
			(orionModel
				includes:
					(orionModel
						entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest')).
	self
		deny:
			(asM2
				includes:
					(orionModel
						entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest')).
	self
		assert:
			((orionModel entityNamed: 'Orion-TestModel-Constellation2')
				childScopes
				includes:
					(orionModel
						entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest')).
	self
		deny:
			((asM2 entityNamed: 'Orion-TestModel-Constellation2') childScopes
				includes:
					(orionModel
						entityNamed: 'Orion-TestModel-Constellation2::NamespaceTest')).
	self assert: orionModel size = (asM2 size + 1)