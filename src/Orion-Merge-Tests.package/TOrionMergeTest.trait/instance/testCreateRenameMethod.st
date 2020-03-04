tests-expected failures
testCreateRenameMethod
	<expectedFailure>
	(self modelMerger targetModel entityNamed: 'Smalltalk::A3diff.c3()') name: 'd3()'.
	self diff.
	self assert: (self modelMerger baseModel entityNamed: 'Smalltalk::A3diff.c3()') isNotNil.
	self assert: (self modelMerger orionVersionedModel entityNamed: 'Smalltalk::A3diff.c3()') name equals: 'd3()'.