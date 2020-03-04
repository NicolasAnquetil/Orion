tests
testMethodAddInvocation

	| orionModel meth |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingInvocations size equals: 1.
	self assert: meth outgoingInvocations first receiver equals: (orionModel entityNamed: 'Smalltalk::Class3').

	meth addInvocationTo: (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()') asOrderedCollection inModel:  orionModel .
	
	meth := 	orionModel entityNamed: 'Smalltalk::Class5.accessOrion2Class3()'.

	self assert: meth outgoingInvocations size equals: 2.
	self assert: (meth outgoingInvocations contains: [:inv | inv receiver = (orionModel entityNamed: 'Smalltalk::Class3')]).
	self assert: (meth outgoingInvocations contains: [:inv | inv to size =1 and: [ inv to  first = (orionModel entityNamed: 'Smalltalk::Class1.accessOrion1Class2()')]]).
