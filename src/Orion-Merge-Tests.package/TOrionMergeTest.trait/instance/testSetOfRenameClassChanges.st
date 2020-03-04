tests-set
testSetOfRenameClassChanges
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') name: 'X3diff'.
	self diff.
	self modelMerger orionVersionedModel: self modelMerger baseModel createNewChildVersion.
	self assert: self modelMerger result setOfRenameClassChanges isNotNil.
	self assert: self modelMerger result setOfRenameClassChanges size equals: 1.
	self assert: (self modelMerger result setOfRenameClassChanges collect: [ :e | e entity mooseName = 'Smalltalk::A3diff' ]) isNotNil