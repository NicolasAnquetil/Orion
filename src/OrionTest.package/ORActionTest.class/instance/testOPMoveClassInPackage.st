testing
testOPMoveClassInPackage
	| asS asAction |
	asS := self model system.
	asAction := ORActionMoveClass new orionModel: orionModel; 
		entity: (orionModel entityNamed: #Smalltalk::Class5); 
		parentPackage: (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	asAction run.
	self assert: (orionModel entityNamed: #Smalltalk::Class5) notNil.
	self deny: (asS sourceModel contains: (orionModel entityNamed: #Smalltalk::Class5)).
	self deny: (asS sourceModel entityNamed: #Smalltalk::Class5) = (orionModel entityNamed: #Smalltalk::Class5).
	self
		assert: ((orionModel entityNamed: #'Orion-TestModel-Constellation1') childNamedEntities includes: (orionModel entityNamed: #Smalltalk::Class5)).
	self
		deny: ((orionModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: #Smalltalk::Class5)).
	self
		assert:
			((asS sourceModel entityNamed: #'Orion-TestModel-Constellation2') childNamedEntities
				includes: (asS sourceModel entityNamed: #Smalltalk::Class5)).
	self
		deny:
			((asS sourceModel entityNamed: #'Orion-TestModel-Constellation1') childNamedEntities
				includes: (asS sourceModel entityNamed: #Smalltalk::Class5)).
	self
		assert: ((orionModel entityNamed: #Smalltalk::Class5) methods includes: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')).
	self
		assert: (orionModel entityNamed: #Smalltalk::Class5) parentPackage
		equals: (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	self
		assert: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()') parentType
		equals: (orionModel entityNamed: #Smalltalk::Class5)