tests
testDeleteClass

	| orionModel class |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	class := orionModel entityNamed: 'Smalltalk::Class1'.	

	self assert: class notNil.
	class deleteInModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Class1') isNil.
	
	self assert: orionModel changes size = 11. "(1 class, 2 meth, 1 attribute, 3 invocations, 1 inheritance, 3 references)"