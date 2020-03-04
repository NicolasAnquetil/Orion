testing
testOPRemoveReference
	| asAction oldInh asM2 asAction2 |
	asAction := ORActionAddReference new
		orionModel: orionModel;
		source: (orionModel entityNamed: #'Smalltalk::Class1.accessOrion1Class2()');
		target: (orionModel entityNamed: #Smalltalk::Class5).
	oldInh := asAction run.
	asM2 := (ORModel withParent: orionModel) name: #AsM2.
	asAction2 := ORActionRemoveReference new
		orionModel: asM2;
		entity: oldInh.
	asAction2 run.
	self assert: (orionModel contains: (orionModel entityNamed: #'Smalltalk::Class1.accessOrion1Class2()')).
	self deny: (asM2 contains: (orionModel entityNamed: #'Smalltalk::Class1.accessOrion1Class2()')).
	self assert: (orionModel includes: (orionModel entityNamed: #'Smalltalk::Class1.accessOrion1Class2()')).
	self assert: (asM2 includes: (asM2 entityNamed: #'Smalltalk::Class1.accessOrion1Class2()')).
	self assert: (orionModel entityNamed: #'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size = 2.
	self assert: (orionModel entityNamed: #Smalltalk::Class5) incomingReferences size = 1.
	self assert: (asM2 entityNamed: #'Smalltalk::Class1.accessOrion1Class2()') outgoingReferences size = 1.
	self assert: (asM2 entityNamed: #Smalltalk::Class5) incomingReferences size = 0.
	self assert: (orionModel includes: oldInh).
	self deny: (asM2 includes: oldInh)