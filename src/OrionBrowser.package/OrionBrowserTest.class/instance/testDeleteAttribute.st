tests
testDeleteAttribute

	| orionModel att |

	self model system.
	orionModel := (ORModel withParent: self model) name: 'AsM'.

	att := orionModel entityNamed: 'Smalltalk::Object.DependentsFields'.	

	self assert: att notNil.

	att deleteInModel: orionModel .

	self assert: (orionModel entityNamed: 'Smalltalk::Object.DependentsFields') isNil.
	
	self assert: orionModel changes size = 1.