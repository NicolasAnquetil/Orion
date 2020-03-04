tests
testDeletePackage

	| orionModel pckg |
	self flag: #FIXME.
	self skip.
	self model system.
	orionModel := (ORModel withParent: self model) name: #AsM.
	
	pckg := orionModel entityNamed: 'Orion-TestModel-Constellation1'.	

	self assert: pckg notNil.

	pckg deleteInModel: orionModel .

	self assert: (orionModel entityNamed: 'Orion-TestModel-Constellation1') isNil.

	self assert: orionModel changes size = 16.