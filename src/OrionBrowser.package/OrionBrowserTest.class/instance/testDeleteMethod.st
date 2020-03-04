tests
testDeleteMethod

	| orionModel meth |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.	

	self assert: meth notNil.

	meth deleteInModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()') isNil.
	
	self assert: orionModel changes size = 3. "1 method + 1 reference + 1 invocation"