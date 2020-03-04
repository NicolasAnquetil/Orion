tests
testClassAddInheritance

	| orionModel class |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	class := orionModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class superInheritances size equals: 1.
	self assert: class superInheritances first to equals: (orionModel entityNamed: 'Smalltalk::Object').

	class addSuperClass: (orionModel entityNamed: 'Smalltalk::Class5') inModel:  orionModel .
	
	class := orionModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class superInheritances size equals: 2.
	self assert: (class superInheritances contains: [:inh | inh to = (orionModel entityNamed: 'Smalltalk::Object')]).
	self assert: (class superInheritances contains: [:inh | inh to = (orionModel entityNamed: 'Smalltalk::Class5')]).
	
	self assert: orionModel changes size = 1.
