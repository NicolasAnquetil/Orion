testing
testOPRemoveInheritance
	| asAction oldInh asM2 asAction2 |
	asAction := ORActionAddInheritance new
		orionModel: orionModel;
		superclass: (orionModel entityNamed: 'Smalltalk::Class1');
		subclass: (orionModel entityNamed: 'Smalltalk::Class2').
	oldInh := asAction run.
	asM2 := (ORModel withParent: orionModel) name: 'AsM2'.
	asAction2 := ORActionRemoveInheritance new
		orionModel: asM2;
		entity: oldInh.
	asAction2 run.
	self assert: (orionModel contains: oldInh).
	self deny: (asM2 contains: oldInh).
	self assert: (orionModel includes: oldInh).
	self deny: (asM2 includes: oldInh).
	self deny: (orionModel entityNamed: 'Smalltalk::Class1') subInheritances isEmpty.
	self assert: (asM2 entityNamed: 'Smalltalk::Class1') subInheritances isEmpty.
	self
		assert: (orionModel entityNamed: 'Smalltalk::Class2') superInheritances size
		equals: 2.
	self assert: (asM2 entityNamed: 'Smalltalk::Class2') superInheritances size equals: 1