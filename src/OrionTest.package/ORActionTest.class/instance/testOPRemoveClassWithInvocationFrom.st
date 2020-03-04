testing
testOPRemoveClassWithInvocationFrom
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
	asAction := ORActionAddMethod new
		orionModel: orionModel;
		name: 'aMethodTo';
		signature: 'aMethodTo()';
		parentType: (orionModel entityNamed: 'ClassTestTo').
	asAction run.
	asAction := ORActionAddInvocation new
		orionModel: orionModel;
		candidates:
			(orionModel entityNamed: 'ClassTestTo.aMethodTo()')
				asOrderedCollection;
		"candidates is a collection of candidates methods and manage as such in the run"
			sender: (orionModel entityNamed: 'ClassTestFrom.aMethodFrom()').
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
	"self deny:(asM2 includes: (orionModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom'))."
	self
		assert:
			((orionModel entityNamed: 'Orion-TestModel-Constellation2')
				childNamedEntities
				includes: (orionModel entityNamed: 'ClassTestFrom')).
	"self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'Orion-TestModel-Constellation2::ClassTestFrom'))."
	self
		assert:
			(orionModel entityNamed: 'ClassTestTo.aMethodTo()')
				incomingInvocations size
		equals: 1.
	self
		assert: (asM2 entityNamed: 'ClassTestTo.aMethodTo()') incomingInvocations size
		equals: 0.
	self assert: orionModel size equals: asM2 size + 3	"removed: ClassTestFrom , aMethodFrom , Invocation"