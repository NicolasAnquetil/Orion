testing
testOPMoveClassInNamespace
	| asS asAction asAction2 |
	asS := self model system.
	asAction2 := ORActionAddNamespace new
		orionModel: orionModel;
		name: 'NamespaceTest'.
	asAction2 run.
	asAction := ORActionMoveClass new
		orionModel: orionModel;
		entity: (orionModel entityNamed: 'Smalltalk::Class5');
		container: (orionModel entityNamed: 'NamespaceTest').
	asAction run.
	self assert: (orionModel entityNamed: 'NamespaceTest::Class5') notNil.
	self
		deny:
			(asS sourceModel
				contains: (orionModel entityNamed: 'NamespaceTest::Class5')).
	self
		deny:
			(asS sourceModel entityNamed: 'Smalltalk::Class5')
				= (orionModel entityNamed: 'NamespaceTest::Class5').
	self
		assert:
			((orionModel entityNamed: 'NamespaceTest') types
				includes: (orionModel entityNamed: 'NamespaceTest::Class5')).
	self
		deny:
			((orionModel entityNamed: 'Smalltalk') types
				includes: (orionModel entityNamed: 'NamespaceTest::Class5')).
	self
		deny:
			((asS sourceModel entityNamed: 'Smalltalk') types
				includes: (orionModel entityNamed: 'Smalltalk::Class5')).
	self
		deny:
			((orionModel entityNamed: 'Smalltalk') types
				includes: (orionModel entityNamed: 'NamespaceTest::Class5')).
	self
		assert:
			((asS sourceModel entityNamed: 'Smalltalk') types
				includes: (asS sourceModel entityNamed: 'Smalltalk::Class5')).
	self
		assert:
			((orionModel entityNamed: 'NamespaceTest::Class5') methods
				includes: (orionModel entityNamed: 'NamespaceTest::Class5.accessOrion2Class3()')).
	self
		assert: (orionModel entityNamed: 'NamespaceTest::Class5') parentPackage
		equals: (orionModel entityNamed: 'Orion-TestModel-Constellation2').