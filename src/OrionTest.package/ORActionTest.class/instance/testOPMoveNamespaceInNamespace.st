testing
testOPMoveNamespaceInNamespace
	| asS asAction orionA |
	asS := self model system.
	orionA := ORActionAddNamespace new orionModel: orionModel; name: 'NamespaceTest'.
	orionA run.
	asAction := ORActionMoveNamespace new orionModel: orionModel; entity: (orionModel entityNamed: 'Smalltalk'); parentScope: (orionModel entityNamed: 'NamespaceTest').
	asAction run.
	self assert: (orionModel entityNamed: 'NamespaceTest::Smalltalk') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'NamespaceTest::Smalltalk')).
	self deny: (asS sourceModel entityNamed: 'Smalltalk') = (orionModel entityNamed: 'NamespaceTest::Smalltalk').
	self
		assert: ((orionModel entityNamed: 'NamespaceTest::Smalltalk') types includes: (orionModel entityNamed: 'NamespaceTest::Smalltalk::Class5')).
	self assert: ((asS sourceModel entityNamed: 'Smalltalk') types includes: (orionModel entityNamed: 'NamespaceTest::Smalltalk::Class5')).
	self assert: ((orionModel entityNamed: 'NamespaceTest') childScopes includes: (orionModel entityNamed: 'NamespaceTest::Smalltalk')).
	self assert: (orionModel entityNamed: 'NamespaceTest::Smalltalk') parentScope equals: (orionModel entityNamed: 'NamespaceTest').
	self
		assert: (orionModel entityNamed: 'NamespaceTest::Smalltalk::Class5') container
		equals: (orionModel entityNamed: 'NamespaceTest::Smalltalk')