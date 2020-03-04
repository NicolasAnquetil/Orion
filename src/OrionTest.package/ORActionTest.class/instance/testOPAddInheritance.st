testing
testOPAddInheritance
	| asS asAction inheritance |
	asS := self model system.
	orionModel := orionModel name: 'AsM'.
	asAction := ORActionAddInheritance new
		orionModel: orionModel;
		superclass: (orionModel entityNamed: 'Smalltalk::Class1');
		subclass: (orionModel entityNamed: 'Smalltalk::Class2').
	asAction run.
	self assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class1')).
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'Smalltalk::Class1')).
	self assert: (orionModel includes: (orionModel entityNamed: 'Smalltalk::Class1')).
	self assert: (asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1')).
	self
		deny:
			(orionModel entityNamed: 'Smalltalk::Class1') hash
				= (asS sourceModel entityNamed: 'Smalltalk::Class1') hash.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1') subInheritances size equals: 1.
	self assert: (orionModel entityNamed: 'Smalltalk::Class2') superInheritances size equals: 2.
	inheritance := (orionModel entityNamed: 'Smalltalk::Class1') subInheritances at: 1.
	self assert: (orionModel contains: inheritance).
	self deny: (asS sourceModel contains: inheritance).
	self assert: (orionModel includes: inheritance).
	self deny: (asS sourceModel includes: inheritance).
	self assert: inheritance subclass equals: (orionModel entityNamed: 'Smalltalk::Class2').
	self assert: inheritance superclass equals: (orionModel entityNamed: 'Smalltalk::Class1')