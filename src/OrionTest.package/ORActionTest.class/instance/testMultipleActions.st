testing long
testMultipleActions
	| act |
	orionModel := self modelNetwork.
	act := ORActionMoveClass new
		entity: (orionModel entityNamed: #Smalltalk::Socket);
		parentPackage: (orionModel entityNamed: #'Network-Url');
		runOnNewVersionFrom: orionModel.
	ORActionMoveClass new
		entity: (orionModel entityNamed: #Smalltalk::Socket);
		parentPackage: (orionModel entityNamed: #'Network-Kernel');
		runOnNewVersionFrom: act orionModel.
	self expectedFailures