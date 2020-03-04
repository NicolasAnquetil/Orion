tests-set
testSetOfRenameAttributeChanges

	| var1 var2  |
	var1 := self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.att1'.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.b2()') ; 
			variable: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') ; 
			variable: var1; 
			run.
	ORActionAddAccess new 		
			orionModel: self modelMerger baseModel; 
			accessor: (self modelMerger baseModel entityNamed: 'Smalltalk::B3diff.c3()') ; 
			variable: var1; 
			run.

	var2 := self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.att1'.
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.b2()').
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()').
	FAMIXAccess new variable: var2 ; accessor: (self modelMerger targetModel entityNamed: 'Smalltalk::B3diff.c3()').
	var2 name: 'toto'.
	
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	self assert: (self modelMerger result setOfRenameAttributeChanges) notNil.
	self assert: self modelMerger result setOfRenameAttributeChanges size equals: 1.
	self assert: (self modelMerger result setOfRenameAttributeChanges collect: [ :e | e entity name = 'att1' ] ) isNotEmpty.
	self assert:  (self modelMerger result setOfRenameAttributeChanges collect: [ :e | e entity name = 'toto' ] ) isNotEmpty.

	