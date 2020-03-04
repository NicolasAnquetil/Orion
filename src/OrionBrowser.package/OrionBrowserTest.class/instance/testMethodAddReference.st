tests
testMethodAddReference

	| orionModel meth |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingReferences size equals: 1.
	self assert: meth outgoingReferences first to equals: (orionModel entityNamed: 'Smalltalk::Class3').

	meth addReferenceTo: (orionModel entityNamed: 'Smalltalk::Class2') inModel:  orionModel .
	
	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingReferences size equals: 2.
	self assert: (meth outgoingReferences contains: [:inh | inh to = (orionModel entityNamed: 'Smalltalk::Class3')]).
	self assert: (meth outgoingReferences contains: [:inh | inh to = (orionModel entityNamed: 'Smalltalk::Class2')]).
