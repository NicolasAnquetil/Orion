testing
testOPMoveMethod
	| asS asAction |
	asS := self model system.
	asAction := ORActionMoveMethod new
		orionModel: orionModel;
		entity: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()');
		parentType: (orionModel entityNamed: #Smalltalk::Class2).
	asAction run.
	self
		assert:
			(orionModel entityNamed: #'Smalltalk::Class2.accessOrion2Class3()')
				notNil.
	self
		assert:
			(orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')
				isNil.
	self
		deny:
			(asS sourceModel
				contains: (orionModel entityNamed: #'Smalltalk::Class2.accessOrion2Class3()')).
	self
		deny:
			(asS sourceModel
				entityNamed: #'Smalltalk::Class5.accessOrion2Class3()')
				= (orionModel entityNamed: #'Smalltalk::Class2.accessOrion2Class3()').

	"self assert:((orionModel entityNamed:#'Orion-TestModel-Constellation1') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()')).
	self deny:((orionModel entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()'))."
	self
		assert:
			((orionModel entityNamed: #Smalltalk::Class2) methods
				includes: (orionModel entityNamed: #'Smalltalk::Class2.accessOrion2Class3()')).
	self
		deny:
			((orionModel entityNamed: #Smalltalk::Class5) methods
				includes: (orionModel entityNamed: #'Smalltalk::Class2.accessOrion2Class3()')).
	"self assert:(orionModel entityNamed:#'Smalltalk::Class2.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation1').
	self deny:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (orionModel entityNamed:#'Orion-TestModel-Constellation2').
	self assert:(asS sourceModel entityNamed:#'Smalltalk::Class5.accessOrion2Class3()') parentPackage = (asS sourceModel entityNamed:#'Orion-TestModel-Constellation2')."
	self
		assert:
			(orionModel entityNamed: #'Smalltalk::Class2.accessOrion2Class3()')
				parentType
		equals: (orionModel entityNamed: #Smalltalk::Class2)