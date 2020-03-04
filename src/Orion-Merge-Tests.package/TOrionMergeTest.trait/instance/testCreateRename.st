tests-expected failures
testCreateRename
	(self modelMerger targetModel entityNamed: 'Smalltalk::B3diff') name: 'X3diff'.
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') name equals: 'd3()'.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::B3diff') notNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::X3diff') notNil.
