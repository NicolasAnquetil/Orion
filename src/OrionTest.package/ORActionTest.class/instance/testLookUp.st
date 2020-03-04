testing OrionModel
testLookUp
	| asSys orionAction orionModel2 orionAction2 |
	asSys := self model system.
	orionModel := orionModel name: 'AsM'.
	orionAction := ORActionAddInheritance new
		orionModel: orionModel;
		superclass: (orionModel entityNamed: 'Smalltalk::Class1');
		subclass: (orionModel entityNamed: 'Smalltalk::Class2').
	orionAction run.
	orionModel2 := (ORModel withParent: orionModel) name: 'AsM2'.
	orionAction2 := ORActionAddInheritance new
		orionModel: orionModel2;
		superclass: (orionModel2 entityNamed: 'Smalltalk::Class1');
		subclass: (orionModel2 entityNamed: 'Smalltalk::Class2').
	orionAction2 run.
	self assert: (orionModel2 entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') parentType equals: (orionModel2 entityNamed: 'Smalltalk::Class1').
	self
		assert:
			(orionModel2 allInheritanceDefinitions
				collect: [ :entity | entity superclass = (orionModel2 entityNamed: 'Smalltalk::Class1') and: [ entity subclass = (orionModel2 entityNamed: 'Smalltalk::Class2') ] ]) notNil