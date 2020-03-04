testing
testOPRemoveSuperClassWithSubInheritance
	| asAction asM2 |
		self flag: #FIXME.
	asAction := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'ClassTestParent'.
	asAction run.
	asAction := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'ClassTestChild'.
	asAction run.
	asAction := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'SuperClassTestParent'.
	asAction run.
	asAction := ORActionAddInheritance new
		orionModel: orionModel;
		superclass: (orionModel entityNamed: 'ClassTestParent');
		subclass: (orionModel entityNamed: 'ClassTestChild').
	asAction run.
	asAction := ORActionAddInheritance new
		orionModel: orionModel;
		subclass: (orionModel entityNamed: 'ClassTestParent');
		superclass: (orionModel entityNamed: 'SuperClassTestParent').
	asAction run.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction := ORActionRemoveClass new
		orionModel: asM2;
		entity: (asM2 entityNamed: 'ClassTestParent').
	asAction run.
	self assert: (orionModel entityNamed: 'ClassTestParent') notNil.
	self assert: (asM2 entityNamed: 'ClassTestParent') isNil.
	self
		assert: (orionModel includes: (orionModel entityNamed: 'ClassTestParent')).
	"self deny:(asM2 includes: (orionModel entityNamed: 'ClassTestFrom'))."
	self
		assert:
			((orionModel entityNamed: 'Orion-TestModel-Constellation2')
				childNamedEntities
				includes: (orionModel entityNamed: 'ClassTestChild')).
	"self deny:((asM2 entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestFrom'))."
	self
		assert:
			(orionModel entityNamed: 'ClassTestChild') superInheritances first
				superclass
		equals: (orionModel entityNamed: 'ClassTestParent').
	self assert: orionModel size equals: asM2 size + 3	"ClassTestParent , input Inheritance, output Inheritance"