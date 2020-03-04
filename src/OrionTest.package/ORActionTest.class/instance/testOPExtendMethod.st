testing
testOPExtendMethod
	| asS asAction |
	asS := self model system.
	self deny: ((asS sourceModel entityNamed: #Smalltalk::Class5) extendedInPackages includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentPackage).
	asAction := ORActionMoveMethod new
		orionModel: orionModel;
		entity: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()');
		parentPackage: (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	asAction run.
	self assert: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self deny: (asS sourceModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') = (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()').
	self assert: ((orionModel entityNamed: #'Orion-TestModel-Constellation1') childNamedEntities includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self deny: ((orionModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self assert: ((orionModel entityNamed: #Smalltalk::Class5) methods includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self assert: ((orionModel entityNamed: #Smalltalk::Class5) methods includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self deny: ((asS sourceModel entityNamed: #Smalltalk::Class5) methods includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self assert: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentPackage equals: (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	self assert: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentType equals: (orionModel entityNamed: #Smalltalk::Class5).
	self deny: (asS sourceModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed: #'Orion-TestModel-Constellation2').
	self deny: ((asS sourceModel entityNamed: #Smalltalk::Class5) extendedInPackages includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentPackage).
	self assert: ((orionModel entityNamed: #Smalltalk::Class5) extendedInPackages includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentPackage).
	self assert: (orionModel entityNamed: #Smalltalk::Class5) extendedInPackages size equals: 1