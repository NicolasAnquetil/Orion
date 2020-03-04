testing
testOPUnextendMethod
	| asS asAction asAction2 |
	self flag: #FIXME.
	asS := self model system.
	asAction := ORActionMoveMethod new
		orionModel: orionModel;
		entity: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()');
		parentPackage: (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	asAction run.
	asAction2 := ORActionUnextendMethod new
		orionModel: orionModel;
		entity: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()').
	asAction2 run.
	self assert: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self
		deny:
			(asS sourceModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')
				= (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()').
	self
		deny:
			((orionModel entityNamed: #'Orion-TestModel-Constellation1') childNamedEntities
				includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self
		assert:
			((orionModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntities
				includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self
		assert: ((orionModel entityNamed: #Smalltalk::Class5) methods includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self
		assert: ((orionModel entityNamed: #Smalltalk::Class5) methods includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self
		deny:
			((asS sourceModel entityNamed: #Smalltalk::Class5) methods includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self
		deny:
			(orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentPackage
				= (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	self
		assert: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentPackage
		equals: (orionModel entityNamed: #'Orion-TestModel-Constellation2').
	self
		assert: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentType
		equals: (orionModel entityNamed: #Smalltalk::Class5).
	self assert: (orionModel entityNamed: #Smalltalk::Class5) extendedInPackages size equals: 0