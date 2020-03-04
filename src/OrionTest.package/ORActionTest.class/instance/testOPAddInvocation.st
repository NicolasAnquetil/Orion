testing
testOPAddInvocation
	| asS asAction invoc |
	asS := self model system.
	asAction := ORActionAddInvocation new
		orionModel: orionModel;
		sender: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()');
		candidates: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') asOrderedCollection.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations size equals: 1.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations size equals: 0.
	asAction run.
	self assert: (orionModel contains: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self deny: (asS sourceModel contains: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self assert: (orionModel includes: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self assert: (asS sourceModel includes: (asS sourceModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')).
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations size equals: 2.
	self assert: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations size equals: 1.
	invoc := (orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations at: 1.
	self assert: (orionModel contains: invoc).
	self deny: (asS sourceModel contains: invoc).
	self assert: (orionModel includes: invoc).
	self deny: (asS sourceModel includes: invoc).
	self assert: (invoc candidates includes: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion2Class3()')).
	self assert: invoc sender equals: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')