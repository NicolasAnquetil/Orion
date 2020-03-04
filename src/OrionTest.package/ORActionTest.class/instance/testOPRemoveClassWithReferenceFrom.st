testing
testOPRemoveClassWithReferenceFrom
	| asAction asM2 |
	asAction := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'ClassTestTo'.
	asAction run.
	asAction := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'ClassTestFrom'.
	asAction run.
	asAction := ORActionAddMethod new
		orionModel: orionModel;
		name: 'aMethodFrom';
		signature: 'aMethodFrom()';
		parentType: (orionModel entityNamed: 'ClassTestFrom').
	asAction run.
	asAction := ORActionAddReference new
		orionModel: orionModel;
		target: (orionModel entityNamed: 'ClassTestTo');
		source: (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()').
	asAction run.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction := ORActionRemoveClass new
		orionModel: asM2;
		entity: (asM2 entityNamed: 'ClassTestFrom').
	asAction run.
	self assert: (orionModel entityNamed: 'ClassTestFrom') notNil.
	self assert: (asM2 entityNamed: 'ClassTestFrom') isNil.
	self
		assert: (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()') notNil.
	self assert: (asM2 entityNamed: 'ClassTestFrom.aMethodFrom()') isNil.
	self
		assert: (orionModel includes: (orionModel entityNamed: 'ClassTestFrom')).
	"self deny:(asM2 includes: (orionModel entityNamed:#'ClassTestFrom'))."
	self
		assert:
			((orionModel entityNamed: 'Orion-TestModel-Constellation2')
				childNamedEntities
				includes: (orionModel entityNamed: 'ClassTestFrom')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (asM2 entityNamed:#'ClassTestFrom'))."
	self
		assert: (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()') notNil.
	self assert: (asM2 entityNamed: 'ClassTestFrom.aMethodFrom()') isNil.
	self
		assert: (orionModel entityNamed: 'ClassTestTo') incomingReferences size
		equals: 1.
	self
		assert: (asM2 entityNamed: 'ClassTestTo') incomingReferences size
		equals: 0.
	self assert: orionModel size equals: asM2 size + 3	"removed: ClassTestFrom , aMethodFrom , Reference"