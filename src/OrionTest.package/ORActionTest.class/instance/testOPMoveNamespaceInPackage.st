testing
testOPMoveNamespaceInPackage
	| asS asAction |
	self skip: 'Why moving a namespace into a package?'.

	asS := self model system.
	asAction := ORActionMoveNamespace new
		orionModel: orionModel;
		entity: (orionModel entityNamed: #Smalltalk);
		parentPackage: (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	asAction run.
	self assert: (orionModel entityNamed: #Smalltalk) notNil.
	self
		deny: (asS sourceModel contains: (orionModel entityNamed: #Smalltalk)).
	self
		deny:
			(asS sourceModel entityNamed: #Smalltalk)
				= (orionModel entityNamed: #Smalltalk).
	self
		assert:
			((orionModel entityNamed: #Smalltalk) types
				includes: (orionModel entityNamed: #Smalltalk::Class5)).
	self
		assert:
			((asS sourceModel entityNamed: #Smalltalk) types
				includes: (orionModel entityNamed: #Smalltalk::Class5)).
	self
		assert:
			((orionModel entityNamed: #'Orion-TestModel-Constellation1')
				childScopes includes: (orionModel entityNamed: #Smalltalk)).
	self
		assert: (orionModel entityNamed: #Smalltalk) parentPackage
		equals: (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	self
		assert: (orionModel entityNamed: #Smalltalk::Class5) container
		equals: (orionModel entityNamed: #Smalltalk::Class5) container.
	self
		deny:
			(orionModel entityNamed: #Smalltalk::Class5) container
				= (asS sourceModel entityNamed: #Smalltalk::Class5) container