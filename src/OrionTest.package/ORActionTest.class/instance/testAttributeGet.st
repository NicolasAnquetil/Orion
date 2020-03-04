testing OrionModel
testAttributeGet
	| asAction |
	self assert: (orionModel entityNamed: #Smalltalk::Class5) extendedMethods isEmpty.
	asAction := ORActionMoveMethod new
		orionModel: orionModel;
		entity: (orionModel entityNamed: #'Smalltalk::Class5.accessOrion2Class3()');
		parentPackage: (orionModel entityNamed: #'Orion-TestModel-Constellation1').
	asAction run.
	self assert: (orionModel entityNamed: #Smalltalk::Class5) extendedMethods notEmpty