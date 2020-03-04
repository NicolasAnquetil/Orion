testing
testDisplayNameAfterRemove
	<expectedFailure>
	| asAction oldInv asM2 asAction2 asAction3 |
	orionModel := orionModel name: #AsM.
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
	asAction3 := ORActionRemoveMethod new
		orionModel: asM2;
		entity: (asM2 entityNamed: 'Smalltalk::Class1.accessOrion2Class3()').
	asAction3 run.
	self assert: asM2 changes first entity source asString ~= 'nil'