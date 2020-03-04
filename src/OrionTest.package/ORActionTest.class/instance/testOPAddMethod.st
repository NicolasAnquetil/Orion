testing
testOPAddMethod
	| asS asAction |
	asS := self model system.
	asAction := ORActionAddMethod new
		orionModel: orionModel;
		name: 'methodTest';
		signature: 'methodTest()';
		parentType: (orionModel entityNamed: 'Smalltalk::Class5').
	asAction run.
	self
		assert: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	self
		assert:
			(orionModel
				contains: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self
		deny:
			(asS sourceModel
				contains: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	"Method is not put in the childNamedEntities collection by default
	self
		assert:
			((orionModel entityNamed: 'Orion-TestModel-Constellation2')
				childNamedEntities
				includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()'))."
	self
		deny:
			((asS sourceModel entityNamed: 'Orion-TestModel-Constellation2')
				childNamedEntities
				includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self
		assert:
			(orionModel
				includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self
		deny:
			(asS sourceModel
				includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self
		assert:
			((orionModel entityNamed: 'Smalltalk::Class5') methods
				includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self
		deny:
			((asS sourceModel entityNamed: 'Smalltalk::Class5') methods
				includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	"Method is not put in the childNamedEntities collection by default
	self
		assert:
			(orionModel entityNamed: 'Smalltalk::Class5.methodTest()')
				parentPackage
		equals: (orionModel entityNamed: 'Orion-TestModel-Constellation2')."
	self
		assert: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()') parentType
		equals: (orionModel entityNamed: 'Smalltalk::Class5').
	self assert: orionModel size equals: asS sourceModel size + 1