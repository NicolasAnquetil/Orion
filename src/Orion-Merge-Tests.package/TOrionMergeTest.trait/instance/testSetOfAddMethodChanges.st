tests-set
testSetOfAddMethodChanges
	| meth |
	meth := FAMIXMethod new name: 'toto'  ; yourself.
	self modelMerger targetModel add: meth.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') addMethod: meth.
	self diff.
	self modelMerger orionVersionedModel: (self modelMerger baseModel createNewChildVersion).

	
	self assert: (self modelMerger result setOfAddMethodChanges) notNil.
	self assert: self modelMerger result setOfAddMethodChanges size equals: 1.

	