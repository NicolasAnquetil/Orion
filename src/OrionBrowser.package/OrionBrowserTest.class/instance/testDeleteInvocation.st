tests
testDeleteInvocation

	| orionModel meth |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingInvocations size equals: 1.

	meth outgoingInvocations first deleteInModel: orionModel.
	
	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.
	self assert: meth outgoingInvocations size equals: 0.
	
	self assert: orionModel changes size = 1.
