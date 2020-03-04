testing
testOPRemoveMethod
	| asAction asM2 asAction2 class5 |
	class5 := orionModel entityNamed: 'Smalltalk::Class5'.
	asAction := ORActionAddMethod new orionModel: orionModel; name: 'methodTest'; signature: 'methodTest()'; parentType: class5; 
			parentPackage: class5 parentPackage.
	asAction run.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction2 := ORActionRemoveMethod new orionModel: asM2; entity: (asM2 entityNamed: 'Smalltalk::Class5.methodTest()').
	asAction2 run.
	self assert: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	self deny: (asM2 entityNamed: 'Smalltalk::Class5.methodTest()') notNil.
	self assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny: (asM2 contains: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self
		assert:
			((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities
				includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self
		deny:
			((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities
				includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self assert: (orionModel includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny: (asM2 includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self assert: ((orionModel entityNamed: 'Smalltalk::Class5') methods includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self deny: ((asM2 entityNamed: 'Smalltalk::Class5') methods includes: (orionModel entityNamed: 'Smalltalk::Class5.methodTest()')).
	self assert: orionModel size equals: asM2 size + 1