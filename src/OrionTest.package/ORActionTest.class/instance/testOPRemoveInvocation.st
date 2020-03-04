testing
testOPRemoveInvocation
	| asAction oldInv asM2 asAction2 |
	asAction := ORActionAddInvocation new
		orionModel: orionModel;
		sender: (orionModel entityNamed: #'Smalltalk::Class1.accessOrion1Class2()');
		"candidates is a collection of candidates methods and manage as such in the run"
			candidates: (orionModel entityNamed: #'Smalltalk::Class1.accessOrion2Class3()') asOrderedCollection.
	oldInv := asAction run.
	asM2 := (ORModel withParent: orionModel) name: #AsM2.
	asAction2 := ORActionRemoveInvocation new
		orionModel: asM2;
		entity: oldInv.
	asAction2 run.
	self assert: (orionModel contains: oldInv).
	self deny: (asM2 contains: oldInv).
	self assert: (orionModel includes: oldInv).
	self deny: (asM2 includes: oldInv).
	self assert: ((orionModel entityNamed: #'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations includes: oldInv).
	self assert: ((orionModel entityNamed: #'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations includes: oldInv).
	self deny: ((asM2 entityNamed: #'Smalltalk::Class1.accessOrion2Class3()') incomingInvocations includes: oldInv).
	self deny: ((asM2 entityNamed: #'Smalltalk::Class1.accessOrion1Class2()') outgoingInvocations includes: oldInv)