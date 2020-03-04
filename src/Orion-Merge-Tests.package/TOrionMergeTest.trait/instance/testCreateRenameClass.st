tests-create
testCreateRenameClass
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff') name: 'X3diff'.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3diff') isNotNil.
