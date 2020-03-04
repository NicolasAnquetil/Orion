testing
testOPAddReference
	| asS asAction ref |
	asS := self model system.
	asAction := ORActionAddReference new
		orionModel: orionModel;
		source: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()');
		target: (orionModel entityNamed: 'Smalltalk::Class5').
	self
		assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size
		equals: 1.
	self assert: (orionModel entityNamed: 'Smalltalk::Class5') incomingReferences size equals: 0.
	asAction run.
	self
		assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self
		deny: (asS sourceModel contains: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self
		assert: (orionModel includes: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self
		assert:
			(asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self
		assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size
		equals: 2.
	self assert: (orionModel entityNamed: 'Smalltalk::Class5') incomingReferences size equals: 1.
	ref := (orionModel entityNamed: 'Smalltalk::Class5') incomingReferences at: 1.
	self assert: (orionModel contains: ref).
	self deny: (asS sourceModel contains: ref).
	self assert: (orionModel includes: ref).
	self deny: (asS sourceModel includes: ref).
	self assert: ref target equals: (orionModel entityNamed: 'Smalltalk::Class5').
	self
		assert: ref source
		equals: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')