testing
testOPRemoveInheritedClass
	| asAction asM2 |
	asAction := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'ClassTestChild'.
	asAction run.
	asAction := ORActionAddClass new
		orionModel: orionModel;
		parentPackage: (orionModel entityNamed: 'Orion-TestModel-Constellation2');
		name: 'ClassTestParent'.
	asAction run.
	asAction := ORActionAddInheritance new
		orionModel: orionModel;
		superclass: (orionModel entityNamed: 'ClassTestParent');
		subclass: (orionModel entityNamed: 'ClassTestChild').
	asAction run.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction := ORActionRemoveClass new
		orionModel: asM2;
		entity: (asM2 entityNamed: 'ClassTestChild').
	asAction run.
	self assert: (orionModel entityNamed: 'ClassTestChild') notNil.
	self assert: (asM2 entityNamed: 'ClassTestChild') isNil.
	self assert: (orionModel includes: (orionModel entityNamed: 'ClassTestChild')).
	"self deny:(asM2 includes: (orionModel entityNamed:#'ClassTestTo'))."
	self assert: ((orionModel entityNamed: 'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed: 'ClassTestChild')).
	"self deny:((asM2 entityNamed:#'Orion-TestModel-Constellation2') childNamedEntities includes: (orionModel entityNamed:#'ClassTestTo'))."
	self assert: (orionModel entityNamed: 'ClassTestParent') subInheritances size equals: 1.
	self assert: (asM2 entityNamed: 'ClassTestParent') subInheritances size equals: 0.
	self assert: orionModel size equals: asM2 size + 2	"ClassTestTo , Inheritance"